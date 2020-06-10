// Prynts           ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

func printTasksTabularized() { // optimized for console printing on an iPad Mini 4, landscape orientation (using Duet app & iPad stand)
    ///if timeBlockPaths.isEmpty {print("[no tasks]")}
    let gap = " "; var i = 0
    print("")
    
    for path in timeBlockPaths {
        
        guard let tasks = tasksAtIndexPath[TimeBlock(values:(path[0], path[1]))] else {print("no tasks"); return}
        var j = 0
        
        for task in tasks {
            let pathString = "\(path[0]),\(path[1])";  let maxPathString = " 8,7 "//" 28,7 "
            let excess = String(repeating: " ", count: maxPathString.count - "\(pathString)".count)
            let spaces = String(repeating: " ", count: maxPathString.count - 2)
            
            let title = task.taskDescription
            let titleCount = "\(title)".count
            let titleBound = 15
            var count = (titleCount < titleBound) ? titleBound - titleCount : 0 ///titleCount - bound
            let titleExcess = String(repeating: " ", count: count)
            
            let dateString = formattedDateString(task.deadline, roundedDown: false,
                                                 showYear: true, prefix: "", suffix: "", dateFormat: .fullDayShortFormNoDots)
            let dateBound = 20
            let dateStringCount = dateString.count
            count = (dateStringCount < dateBound) ? dateBound - dateStringCount : 0 ///dateStringCount - bound
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
    pryntDate(lastLoginDate, prefix: "last login           ")
}

func pryntCurrentDate() {
    pryntDate(Date(), prefix: "date right now       ")
}

func pryntArchiveEmailDate() {
    pryntDate(lastArchiveEmailDate, prefix: "archives last emailed on")
}

func pryntDate(_ date: Date, prefix: String) {
    let dst = dstMarkerForConsole(date)
    print(formattedDateString(date, roundedDown: false, showYear: true, prefix: prefix, suffix: " \(dst)", dateFormat: .fullDay)) //; print("")
}

func pryntTaskTaggingVariables() {
    print("\n\(taskArraysToProcess.count) task arrays to process;\ndescriptions to process: \(taskDescriptionsToProcess);\npaths to process: \(indexPathsToProcess)\nindex \(taskIndex) of \(tasksInBlockToBeProcessed) tasks in block")
}



