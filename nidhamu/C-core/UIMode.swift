// UIMode           ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension CollectionVC {
    func exitEventAddingMode() {
        eventField.removeFromSuperview()
        eventField.resignFirstResponder()
        if !tempGotoAnimationBool {
            globalWindow.backgroundColor = .white //defaultWindowBackgroundColour
            backgroundVC.view.backgroundColor = globalWindow.backgroundColor
        }
        keyboardHeight = 0
        textFieldDisplayed = false
    }
}

extension PopupMenuVC {
    func updateBlockProcessingVariables(column: Int, row: Int, eventWillShowUpNextWeek: Bool) {
        
        if eventIndex < eventsInBlockToBeProcessed {eventIndex += 1}
        if eventsInBlockToBeProcessed > 0 {eventsInBlockToBeProcessed -= 1}
        
        if eventsInBlockToBeProcessed == 0 { ///print("ZERO!\n")
            if !eventWillShowUpNextWeek {eventsAtIndexPath.remove(at: eventsAtIndexPath.index(forKey: TimeBlock(values:(column, row)))!)}
            
            eventIndex = 0
            pathsToProcess.removeFirst(); eventArraysToProcess.removeFirst(); eventDescriptionsToProcess.removeFirst()
            if !eventArraysToProcess.isEmpty {
                eventsInBlockToBeProcessed = eventArraysToProcess.first!.count
            }
        }
        
        print("\(eventArraysToProcess.count) blocks remaining now; \(eventsInBlockToBeProcessed) events; tag #\(eventIndex + 1)\n")
    }
    
    func dismissPopupMenuAndSave() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {                        ///print("now paths to process: \(pathsToProcess)")
            self.removePopupMenuAndSwitch()
            earliestEventAddress = defaultPathOutOfView
            selectedEventWillRecur = false
            
            if pathsToProcess.isEmpty {
                defaultSaveData(saveDate: true, resetLastLogin: true, showDate: true, pryntEvents: true)
                AppUtility.lockOrientation(.all)                                        ///; print("rotated back")
            }
            else {defaultSaveData(saveDate: false, resetLastLogin: false, showDate: false, pryntEvents: false)}
            
            timetableVC.reloadCV()                                                      ///; print("block events remaining now: \(eventsInBlockToBeProcessed)\n")
            timetableVC.tagEventsSinceLastLogin()
        }
    }
}

