// DefaultLoad      ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

func defaultLoadData(showDate: Bool) {                                                      //print("(load using defaults)\n")
    
    let defaults = UserDefaults.standard
    
    if let components = defaults.array(forKey: "savedLastLoginDate") {
        lastLoginDateComponents = components
        lastLoginDate = dateFromComponents(lastLoginDateComponents)
        if showDate {
            pryntLastLoginDate()
            pryntCurrentDate()
        }
    }
    else {                                                                                  //print("\nfirst login")
        let (year, _, month, _ , day, weekday, _, hour, minute, _) = getChosenDateComponents(Date(), roundedDown: true)
        lastLoginDateComponents = [year, month, day, weekday, hour, minute]
    }
    
    timeBlockPaths = defaults.array(forKey: "savedTimeBlockPaths") as? [[Int]] ?? []
    taskDescriptionArrays = defaults.array(forKey: "savedTaskDescriptionArrays") as? [[String]] ?? []
    taskDateArrays = defaults.array(forKey: "savedTaskDateArrays") as? [[[Any]]] ?? [[[]]]
    taskStatusArrays = defaults.array(forKey: "savedTaskStatusArrays") as? [[Int]] ?? []
    
    archiveTaskDescriptions = defaults.array(forKey: "savedArchiveTaskDescriptions") as? [String] ?? []
    archiveTaskStatuses = defaults.array(forKey: "savedArchiveTaskStatuses") as? [Int] ?? []
    archiveTaskDateComponentArrays = defaults.array(forKey: "savedArchiveTaskDateComponentArrays") as? [[Int]] ?? []
    
    populateDictionaryFromDefaults()                                                        //; print("loaded task paths: \(timeBlockPaths)")
    if !firstTimeLoaded {populateTaskDatesAndStatusesFromDefaults()}
    firstTimeLoaded = true
}

func populateDictionaryFromDefaults() {
    var i = 0
    
    for path in timeBlockPaths {                                                            //print("path: \(path)")
        
        let taskDescriptions = taskDescriptionArrays[i] //!*
        var tasks = [SimpleTask]()
        var j = 0
        
        for description in taskDescriptions {
            let taskStatus = taskStatusArrays[i][j]
            let dateComponents = taskDateArrays[i][j]                                       //; print("task date components: \(dateComponents)")
            let date = dateFromComponents(dateComponents)                                   //; print("date: \(date)")
            let task = SimpleTask(taskDescription: description, taskDate: date, taskStatus: TaskStatus(rawValue: taskStatus)!)
            
            ///print("loaded: '\(task.taskDescription)' [\(task.taskStatus)] with deadline:\(formattedDateString(date, roundedDown: true, prefix: "", suffix: "", short: false))")
            
            tasks.append(task)
            j += 1
        }
        
        tasksAtIndexPath[TimeBlock(values: (path[0], path[1]))] = tasks
        i += 1
    }
}

func populateTaskDatesAndStatusesFromDefaults() {
    var i = 0
    for _ in archiveTaskStatuses {
        archiveTaskDateStrings.append(formattedDateString(dateFromInts(archiveTaskDateComponentArrays[i]), roundedDown: false, showYear: true, prefix: "", suffix: "", dateFormat: .archiveFormat))
        archiveTaskStatusStrings.append(TaskStatus(rawValue: archiveTaskStatuses[i])!.caseName())
        i += 1
    }
}

