// BlockUpdate      ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension PopupMenuVC {
    
    func updateBlockProcessingVariables(column: Int, row: Int, taskWillShowUpNextWeek: Bool, selectedStatus: TaskStatus) {
        
        if taskIndex <= tasksInBlockToBeProcessed {taskIndex += 1}
        
        if selectedStatus != .deferred {
            if tasksInBlockToBeProcessed > 0 {tasksInBlockToBeProcessed -= 1}
        }
        
        if tasksInBlockToBeProcessed == 0 {
            
            if !taskWillShowUpNextWeek || selectedStatus == .deferred {
                tasksAtIndexPath.remove(at: tasksAtIndexPath.index(forKey: TimeBlock(values:(column, row)))!)
            }
            
            taskIndex = 0
            indexPathsToProcess.removeFirst(); taskArraysToProcess.removeFirst(); taskDescriptionsToProcess.removeFirst()
            
            if !taskArraysToProcess.isEmpty {
                tasksInBlockToBeProcessed = taskArraysToProcess.first!.count
            }
            
            dismissPopupMenuAndSave(newTimeBlock: true)
            
        } else {dismissPopupMenuAndSave(newTimeBlock: false)}
        
        ///print("\(taskArraysToProcess.count) blocks now; \(tasksInBlockToBeProcessed) tasks; tag #\(taskIndex + 1)\n")
    }
    
}

