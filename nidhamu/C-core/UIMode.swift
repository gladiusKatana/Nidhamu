// UIMode           ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension CollectionVC {
    func exitEventAddingMode() {
        eventField.removeFromSuperview()
        eventField.resignFirstResponder()
        if !tempRescalingBool {
            globalWindow.backgroundColor = .white
            backgroundVC.view.backgroundColor = globalWindow.backgroundColor
        }
        keyboardHeight = 0; textFieldDisplayed = false
    }
}

extension PopupMenuVC {
    func updateBlockProcessingVariables(column: Int, row: Int, eventWillShowUpNextWeek: Bool, selectedStatus: EventStatus) {
        if eventIndex < tasksInBlockToBeProcessed {eventIndex += 1}
        if tasksInBlockToBeProcessed > 0 {tasksInBlockToBeProcessed -= 1}
        
        if tasksInBlockToBeProcessed == 0 { ///print("ZERO!\n")
            if !eventWillShowUpNextWeek || selectedStatus == .deferred {
                eventsAtIndexPath.remove(at: eventsAtIndexPath.index(forKey: TimeBlock(values:(column, row)))!)
            }
            
            eventIndex = 0
            indexPathsToProcess.removeFirst(); taskArraysToProcess.removeFirst(); eventDescriptionsToProcess.removeFirst()
            if !taskArraysToProcess.isEmpty {
                tasksInBlockToBeProcessed = taskArraysToProcess.first!.count
            }
            
            dismissPopupMenuAndSave(newTimeBlock: true)
        }
        else {dismissPopupMenuAndSave(newTimeBlock: false)} ///print("\(eventArraysToProcess.count) blocks now; \(eventsInBlockToBeProcessed) events; tag #\(eventIndex + 1)\n")
    }
    
    func dismissPopupMenuAndSave(newTimeBlock: Bool) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {                        ///print("now paths to process: \(pathsToProcess)")
            if newTimeBlock {
                self.dismissTaggingWizard()
                earliestEventAddress = defaultPathOutOfView
            } else {taskTaggingViewController.collectionView.reloadData()}
            
            selectedEventWillRecur = false
            
            if indexPathsToProcess.isEmpty {
                defaultSaveData(saveDate: true, resetLastLogin: true, showDate: true, pryntEvents: true)
                AppUtility.lockOrientation(.all)
            } else {defaultSaveData(saveDate: false, resetLastLogin: false, showDate: false, pryntEvents: false)}
            
            timetableVC.reloadCV()                                                      ///; print("block events remaining now: \(eventsInBlockToBeProcessed)\n")
            timetableVC.tagEventsSinceLastLogin()
        }
    }
}

