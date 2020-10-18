// DefaultSave      ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

func defaultSaveData(saveDate: Bool, resetLastLogin: Bool, showDate: Bool, pryntTasks: Bool) {  //print("saving")
    if showDate {pryntDate(Date(), prefix: "\n               ✔︎saved")}
    let defaults = UserDefaults.standard
    timeBlockPaths.removeAll(); taskDescriptionArrays.removeAll(); taskStatusArrays.removeAll(); taskDeadlineArrays.removeAll()
    
    for key in tasksAtIndexPath.keys {
        let (a, b) = key.values                                                             //; print("key: [\(key)  values \((a, b))")
        timeBlockPaths.append([a, b])
    }
    
    //    if timeBlockPaths.count > 1 {
    sortedTimeBlockPaths = timeBlockPaths.sorted(by: {lastTaskFromPath($0).deadline < lastTaskFromPath($1).deadline})
    sortingTransform = findSortingTransform(timeBlockPaths, output: sortedTimeBlockPaths)   //; print("T:\(sortingTransform)\n")
    //    }
    
    for vals in tasksAtIndexPath.values {
        if vals.count >= 1 {
            var taskDescriptions = [String]()
            var taskStatuses = [Int]()
            var taskDeadlineComponents = [[Int(), String(), Int(), String(), Int(), Int()]] as [[Any]]
            taskDeadlineComponents.removeAll() /// keep this line; above array-of-arrays looks like it's initialized empty on each iteration of the loop; it's not
            
            for task in vals {
                taskDescriptions.append(task.taskDescription)
                taskStatuses.append(task.taskStatus.rawValue)
                let (year, _, month, _ , day, weekday, _, hour, minute, _) = getChosenDateComponents(task.deadline, roundedDown: true)
                taskDeadlineComponents.append([year, month, day, weekday, hour, minute])
            }
            
            taskDescriptionArrays.append(taskDescriptions)
            taskStatusArrays.append(taskStatuses)
            taskDeadlineArrays.append(taskDeadlineComponents)
        }///else {print("\n!descriptions array at this time block contains only default (\(defaultEmptTaskDescription)), and it's: \(vals[0].taskDescription)")}
    }
    
    //    if timeBlockPaths.count > 1 {
    timeBlockPaths = sortedTimeBlockPaths
    taskDescriptionArrays = applySortingTransform(taskDescriptionArrays, transform: sortingTransform) as? [[String]] ?? taskDescriptionArrays
    taskStatusArrays = applySortingTransform(taskStatusArrays, transform: sortingTransform) as? [[Int]] ?? taskStatusArrays
    taskDeadlineArrays = applySortingTransform(taskDeadlineArrays, transform: sortingTransform) as? [[[Any]]] ?? taskDeadlineArrays
    //    }
    
    if pryntTasks {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
            printTasksTabularized()
        }
    }
    setForKeys(defaults, saveDate: saveDate, resetLastLogin: resetLastLogin)
}

func setForKeys(_ defaults: UserDefaults, saveDate: Bool, resetLastLogin: Bool) {
    saveArchiveDate(defaults)
    if saveDate {saveLastLoginComponentsAndDate(defaults, resetLastLogin: resetLastLogin)}
    
    defaults.set(timeBlockPaths, forKey: "savedTimeBlockPaths")
    defaults.set(taskDescriptionArrays, forKey: "savedTaskDescriptionArrays")
    defaults.set(taskStatusArrays, forKey: "savedTaskStatusArrays")
    defaults.set(taskDeadlineArrays, forKey: "savedTaskDeadlineArrays")
    
    defaults.set(archiveTaskDescriptions, forKey: "savedArchiveTaskDescriptions")
    defaults.set(archiveTaskStatuses, forKey: "savedArchiveTaskStatuses")
    defaults.set(archiveTaskDateComponentArrays, forKey: "savedArchiveTaskDateComponentArrays")
}

func saveArchiveDate(_ defaults: UserDefaults) {
    let (year, _, month, _ , day, weekday, _, hour, minute, _) = getChosenDateComponents(lastArchiveEmailDate, roundedDown: false)
    lastArchiveDateComponents = [year, month, day, weekday, hour, minute]
    lastArchiveEmailDate = dateFromComponents(lastArchiveDateComponents)
    defaults.set(lastArchiveDateComponents, forKey: "savedLastArchiveEmailDate")
}

func saveLastLoginComponentsAndDate(_ defaults: UserDefaults, resetLastLogin: Bool) {
    let (year, _, month, _ , day, weekday, _, hour, minute, _) = getChosenDateComponents(Date(), roundedDown: false)
    lastLoginDateComponents = [year, month, day, weekday, hour, minute]
    if resetLastLogin {lastLoginDate = dateFromComponents(lastLoginDateComponents)}
    defaults.set(lastLoginDateComponents, forKey: "savedLastLoginDate")
}

