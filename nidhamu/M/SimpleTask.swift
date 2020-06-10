// SimpleTask       ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

class SimpleTask: NSObject {
    
    var taskDescription = ""                // description of a task coming up (or task list item) on this day
    var taskStatus = TaskStatus.upcoming
    var deadline = Date()                   // date the task must be done by
    ///var recurring = false ///* replacing global selectedTaskWillRecur with this seems logical
    
    init(taskDescription: String, deadline: Date, taskStatus: TaskStatus) {
        self.taskDescription = taskDescription
        self.deadline = deadline
        self.taskStatus = taskStatus
    }
    
    /**/
}

enum TaskStatus: Int, CaseIterable {
    
    case upcoming = 0; case done, delegated, deferred, deleted
    
    func simpleDescription() -> String {
        switch self {
        case .upcoming:     return "task is upcoming"
        case .done:         return "task was done. Nice!"
        case .delegated:    return "task was delegated to someone else"
        case .deferred:     return "task was deferred; it was moved to the time-block chosen during deferral"   // ***
        case .deleted:      return "task was deleted; no need to do it anymore"
        }
    }
    
    func caseName() -> String {
        switch self {
        case .upcoming:     return "Upcoming"
        case .done:         return "Done"
        case .delegated:    return "Delegated"
        case .deferred:     return "Deferred"
        case .deleted:      return "Deleted"
        }
    }
}

/*
 //    func showTaskProperties() {
 //        var descriptor = ""
 //        if taskStatus == .upcoming {
 //            descriptor = "will occur on"
 //        } else {descriptor = "occurred on"}
 //        print("\n Task: \(taskDescription)\n (\(taskStatus)); \(descriptor): \(deadline)\n")
 //    }
 */

