// Prynts           ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

func printTasksTabularized() { // optimized for console printing on an iPad Mini 4, landscape orientation (using Duet app & iPad stand)
    
    let gap = " "; var i = 0
    ///if timeBlockPaths.isEmpty {print("[no tasks]")}
    
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

func pryntLastLoginDate() { /// spelling 'prynt' with a y so this function's existence does not cause override of autocomplete for print statements
    print(formattedDateString(lastLoginDate, roundedDown: false, showYear: true,
                              prefix: "last login              ", suffix: "", dateFormat: .fullDay))  ///print("              (unformatted gmt) \(lastLoggedInDate)\n")
}

func pryntCurrentDate() {
    print(formattedDateString(Date(), roundedDown: false, showYear: true,
                              prefix: "date right now          ", suffix: "", dateFormat: .fullDay))
    print("")                                                                                         ///print("              (unformatted gmt)    \(Date())\n")
}

