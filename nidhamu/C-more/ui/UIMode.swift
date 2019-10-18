// UIMode           ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit


extension CollectionVC {
    
    func exitEventAddingMode() {
        
        if !keyboardLocked {
            eventField.removeFromSuperview()
            eventField.resignFirstResponder()
            globalWindow.backgroundColor = defaultWindowBackgroundColour
            keyboardHeight = 0
            textFieldDisplayed = false
        }
    }
    
}


extension PopupMenuVC {
    
    func dismissPopupMenuAndSave() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {                        ///print("now paths to process: \(pathsToProcess)")
            self.removePopupMenuAndSwitch()
            earliestEventAddress = defaultPathOutOfView
            selectedEventWillRecur = false
            
            timetableVC.reloadCV()                                                      ///; print("block events remaining now: \(eventsInBlockToBeProcessed)\n")
            timetableVC.tagEventsSinceLastLogin()
            
            if pathsToProcess.isEmpty {
                defaultSaveData(saveDate: true, resetLastLogin: true, showDate: true, pryntEvents: true)
                AppUtility.lockOrientation(.all)                                        ///; print("rotated back")
            }
            else {defaultSaveData(saveDate: true, resetLastLogin: false, showDate: true, pryntEvents: false)}
        }
    }
    
}

