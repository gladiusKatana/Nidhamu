// UIMode           ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension CollectionVC {
    
    func exitTaskAddingMode() {
        
        taskField.removeFromSuperview()
        taskField.resignFirstResponder()
        
        /*if !tempRescalingBool {
         globalWindow.backgroundColor = cellDefaultColour
         backgroundVC.view.backgroundColor = globalWindow.backgroundColor
         }*/
        
        keyboardHeight = 0; textFieldDisplayed = false
        setupNavBarButtons(grayTwo, greyIndex: colourIndex, disabler: false)
    }
}

extension PopupMenuVC {
    
    func dismissPopupMenuAndSave(newTimeBlock: Bool) {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {            ///print("now paths to process: \(pathsToProcess)")
            
            if newTimeBlock {
                self.dismissTaggingWizard()
                earliestTaskAddress = defaultPathOutOfView                  ///; print("******************earliest task address: \(earliestTaskAddress)")
            } else {
                taskTaggingViewController.collectionView.reloadData()
            }
            
            selectedTaskWillRecur = false
            
            if indexPathsToProcess.isEmpty {
                defaultSaveData(saveDate: true, resetLastLogin: true, showDate: true, pryntTasks: true)
                AppUtility.lockOrientation(.all)
                
            } else {
                defaultSaveData(saveDate: false, resetLastLogin: false, showDate: false, pryntTasks: false)
            }
            
            timetableVC.reloadCV()                                          ///; print("block tasks remaining now: \(tasksInBlockToBeProcessed)\n")
            timetableVC.tagTasksSinceLastLogin()
        }
    }
}

