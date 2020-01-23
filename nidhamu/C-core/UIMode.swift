// UIMode           ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension CollectionVC {
    func exitTaskAddingMode() {
        taskField.removeFromSuperview()
        taskField.resignFirstResponder()
        if !tempRescalingBool {
            globalWindow.backgroundColor = cellDefaultColour
            backgroundVC.view.backgroundColor = globalWindow.backgroundColor
        }
        keyboardHeight = 0; textFieldDisplayed = false
    }
}

extension PopupMenuVC {
    func updateBlockProcessingVariables(column: Int, row: Int, taskWillShowUpNextWeek: Bool, selectedStatus: TaskStatus) {
        
        if taskIndex <= tasksInBlockToBeProcessed {
            taskIndex += 1
        }
        
        if tasksInBlockToBeProcessed > 0 {tasksInBlockToBeProcessed -= 1}
        
        if tasksInBlockToBeProcessed == 0 { ///print("ZERO!\n")
            if !taskWillShowUpNextWeek || selectedStatus == .deferred {
                tasksAtIndexPath.remove(at: tasksAtIndexPath.index(forKey: TimeBlock(values:(column, row)))!)
            }
            
            taskIndex = 0
            
            indexPathsToProcess.removeFirst(); taskArraysToProcess.removeFirst(); taskDescriptionsToProcess.removeFirst()
            
            if !taskArraysToProcess.isEmpty {
                tasksInBlockToBeProcessed = taskArraysToProcess.first!.count
            }
            
            dismissPopupMenuAndSave(newTimeBlock: true)
        } else {dismissPopupMenuAndSave(newTimeBlock: false)} ///print("\(taskArraysToProcess.count) blocks now; \(tasksInBlockToBeProcessed) tasks; tag #\(taskIndex + 1)\n")
    }
    
    func dismissPopupMenuAndSave(newTimeBlock: Bool) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {                        ///print("now paths to process: \(pathsToProcess)")
            if newTimeBlock {
                self.dismissTaggingWizard()
                earliestTaskAddress = defaultPathOutOfView
            } else {taskTaggingViewController.collectionView.reloadData()}
            
            selectedTaskWillRecur = false
            
            if indexPathsToProcess.isEmpty {
                defaultSaveData(saveDate: true, resetLastLogin: true, showDate: true, pryntTasks: true)
                AppUtility.lockOrientation(.all)
            } else {defaultSaveData(saveDate: false, resetLastLogin: false, showDate: false, pryntTasks: false)}
            
            timetableVC.reloadCV()                                                      ///; print("block tasks remaining now: \(tasksInBlockToBeProcessed)\n")
            timetableVC.tagTasksSinceLastLogin()
        }
    }
}

