// Prynts           ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

func printTasksTabularized() { // optimized for console printing on an iPad Mini 4, landscape orientation (using Duet app & iPad stand)
    ///if timeBlockPaths.isEmpty {print("[no tasks]")}
    let gap = " "; var i = 0
    
    for path in timeBlockPaths {
        
        guard let tasks = tasksAtIndexPath[TimeBlock(values:(path[0], path[1]))] else {print("no tasks"); return}
        var j = 0
        
        for task in tasks {
            let pathString = "\(path[0]),\(path[1])";  let maxPathString = " 24,7 "
            let excess = String(repeating: " ", count: maxPathString.count - "\(pathString)".count)
            let spaces = String(repeating: " ", count: maxPathString.count - 2)
            
            let title = task.taskDescription
            let titleCount = "\(title)".count
            let bound = 24
            var count = (titleCount < bound) ? bound - titleCount : 0 ///titleCount - bound
            let titleExcess = String(repeating: " ", count: count)
            
            let dateString = formattedDateString(task.deadline, roundedDown: false,
                                                 showYear: true, prefix: "", suffix: "", dateFormat: .fullDayShortFormNoDots)
            let dateStringCount = dateString.count
            count = (dateStringCount < bound) ? bound - dateStringCount : 0 ///dateStringCount - bound
            let dateExcess = String(repeating: " ", count: count)
            
            let restOfString = "\(gap)\(excess)\(title)\(titleExcess)\(dateString)\(dateExcess)\(task.taskStatus)"
            
            if j == 0  { print("\(pathString)\(restOfString)")}
            else {       print("\(spaces)\(restOfString)")}
            
            //if j == tasks.count - 1 {print("")}
            j += 1
        }
        i += 1
    }
    if !(timeBlockPaths.isEmpty) {print("")}
}

func pryntLastLoginDate() { /// spelling 'prynt' with a y so this function's existence does not override Xcode autocomplete for print statements
    pryntDate(lastLoginDate, prefix: "last login              ")
}

func pryntCurrentDate() {
    pryntDate(Date(), prefix: "date right now          ")
}

func pryntArchiveEmailDate() {
    pryntDate(lastArchiveEmailDate, prefix: "archives last emailed on")
}

func pryntDate(_ date: Date, prefix: String) {
    let dst = dstMarkerForConsole(date)
    print(formattedDateString(date, roundedDown: false, showYear: true, prefix: prefix, suffix: " \(dst)", dateFormat: .fullDay)) //; print("")
}

func dstMarkerForConsole(_ date: Date) -> String { /// creates a string notifying whether input date is a daylight-savings date (correct to 1 hr, which is time block size)
    let fbk = (truncateMins(date) == truncateMins(fallBackDate)) ? "(fall-back)" : ""
    let spf = (truncateMins(date) == truncateMins(springForwardDate)) ? "(spring-forward)" : ""
    return "\(fbk)\(spf)"
}

func dstMarkerForHeader(_ date: Date) -> String { /// creates a string notifying whether input date is a daylight-savings date (correct to 1 hr, which is time block size)
    let fbk = (truncateMins(date) != truncateMins(fallBackDate)) ? "" :
    "🌖 Daylight Savings (fall-back): the 1am time-block lasts for 2 hours "
    let spf = (truncateMins(date) != truncateMins(springForwardDate)) ? "" :
    "🌔 Daylight Savings (spring-forward): the 2am time-block gets skipped "  //(1:59→ 3:00)"
    return "\(fbk)\(spf)"
}

