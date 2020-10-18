// DefaultLoad      ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

func defaultLoadData(showDate: Bool) {                                                      //print("(load using defaults)\n")
    let defaults = UserDefaults.standard
    
    if let components = defaults.array(forKey: "savedLastLoginDate") {
        lastLoginDateComponents = components
        lastLoginDate = dateFromComponents(lastLoginDateComponents)
        if showDate {pryntLastLoginDate(); pryntCurrentDate()}/// * may modify these methods to adjust cell string (printed in console only) to adjust for DST
        
        if dateOfLastSecond(fallBackDate).isBetween(lastLoginDate, and: Date() + oneHour) {/// if fall-back (eg 1:59->1:00) while app in background
            foundNextFallBackDate = false /*; foundNextSpringForwardDate = false*/
            findFallbackDate(startingDate: Date(), printDSTDates: showDSTDates)
        } ///else {print("no background dst rollover")} /// "fall back hour did not roll over while app in background"
    }
    else {                                                                                  //print("\nfirst login")
        let (year, _, month, _ , day, weekday, _, hour, minute, _) = getChosenDateComponents(Date(), roundedDown: true)
        lastLoginDateComponents = [year, month, day, weekday, hour, minute]
    }
    
    if let components = defaults.array(forKey: "savedLastArchiveEmailDate") {
        lastArchiveDateComponents = components
        lastArchiveEmailDate = dateFromComponents(lastArchiveDateComponents)
        //if showDate && lastArchiveEmailDate.timeIntervalSince1970 > 0 {pryntArchiveEmailDate()}
    }
    
    timeBlockPaths = defaults.array(forKey: "savedTimeBlockPaths") as? [[Int]] ?? []
    taskDescriptionArrays = defaults.array(forKey: "savedTaskDescriptionArrays") as? [[String]] ?? []
    taskDeadlineArrays = defaults.array(forKey: "savedTaskDeadlineArrays") as? [[[Any]]] ?? [[[]]]
    taskStatusArrays = defaults.array(forKey: "savedTaskStatusArrays") as? [[Int]] ?? []
    
    archiveTaskDescriptions = defaults.array(forKey: "savedArchiveTaskDescriptions") as? [String] ?? []
    archiveTaskStatuses = defaults.array(forKey: "savedArchiveTaskStatuses") as? [Int] ?? []
    archiveTaskDateComponentArrays = defaults.array(forKey: "savedArchiveTaskDateComponentArrays") as? [[Int]] ?? []
    
    populateDictionaryFromDefaults()                                                        //; print("loaded task paths: \(timeBlockPaths)")
    if !firstTimeLoaded {populateArchivedDatesAndStatusesFromDefaults()}
    firstTimeLoaded = true
}

func populateDictionaryFromDefaults() {                                     //print("task description count: \(taskDescriptionArrays.count)")
    var i = 0
    for path in timeBlockPaths {                                                            //print("path: \(path)")
        let taskDescriptions = taskDescriptionArrays[i] //!*
        var tasks = [SimpleTask]()
        var j = 0
        
        for description in taskDescriptions {
            let taskStatus = taskStatusArrays[i][j]
            let dateComponents = taskDeadlineArrays[i][j]                                   //; print("task date components: \(dateComponents)")
            let deadline = dateFromComponents(dateComponents)                               //; print("date: \(date)")
            let task = SimpleTask(taskDescription: description, deadline: deadline, taskStatus: TaskStatus(rawValue: taskStatus)!)
            ///print("loaded: '\(task.taskDescription)' [\(task.taskStatus)] with deadline:\(formattedDateString(deadline, roundedDown: true, prefix: "", suffix: "", short: false))")
            
            tasks.append(task)
            j += 1
        }
        tasksAtIndexPath[TimeBlock(values: (path[0], path[1]))] = tasks
        i += 1
    }
}

func populateArchivedDatesAndStatusesFromDefaults() {
    var i = 0
    for _ in archiveTaskStatuses {
        archiveTaskStatusStrings.append(TaskStatus(rawValue: archiveTaskStatuses[i])!.caseName())
        archiveTaskDateStrings.append(formattedDateString(dateFromInts(archiveTaskDateComponentArrays[i]), roundDown: false, showYear: true, prefix: "", suffix: "", dateFormat: .archiveFormat))
        i += 1
    }
}

