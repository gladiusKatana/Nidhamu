// BlockUpdate      ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension PopupMenuVC {
    
    func updateBlockProcessingVariables(column: Int, row: Int, taskWillShowUpNextWeek: Bool, selectedStatus: TaskStatus) {
        
        if selectedStatus != .deferred {
            if tasksInBlockToBeProcessed > 0 {
                tasksInBlockToBeProcessed -= 1
            }
        }
        
        let tasks = tasksAtIndexPath[TimeBlock(values:(column, row))]
        if tasks != nil && tasks!.count > 0 {
            tasksAtIndexPath[TimeBlock(values:(column, row))]?.removeFirst()
        }
        
        dismissPopupMenuAndSave(newTimeBlock: false, autoSave: false)
        
        ///print("\(taskArraysToProcess.count) blocks now; \(tasksInBlockToBeProcessed) tasks\n")
    }
}

