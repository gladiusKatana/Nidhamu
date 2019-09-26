// TFReturn         ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension CollectionVC {    /// ** commented code here is for animations
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {          //print("TF_return")
        
        textField.removeFromSuperview(); textField.resignFirstResponder()
        textFieldDisplayed = false
        let textEntered = textField.text!
        
        if textEntered == "" || textEntered == " " || textEntered == "  " { // if user (for some reason) enters > 2 whitespaces, well, it's saved
            
            /*for cell in self.collectionView.visibleCells as! [BaseCell] {
             if cell.xyCoordinate == selectedTimeBlockPath {
             cell.backgroundColor = headerColour
             }
             }///animateSelectedCellColourBack()
             selectedTimeBlockPath = defaultPathOutOfView*/
            
             previousTimeBlockPathSelected = defaultPathOutOfView
        } else {
            addToTimeBlocks(column: selectedTimeBlockPath[0], row: selectedTimeBlockPath[1], textEntered: textEntered)
            
            if vcType == .hours {
                selectedTimeBlockPath = defaultPathOutOfView
                previousTimeBlockPathSelected = defaultPathOutOfView
            }
            
            if vcType == .todoList {
                if let events = eventsAtIndexPath[timeBlock] {  /// if time-block is not empty
                    todoListVC.downcastLayout!.rows = events.count
                    setupTitleAndPresentViewController(vc: todoListVC) { () -> () in    /// re-presents view & reloads its data, to display updated todo list
                        ///(empty; may remove the completion handler from this method)
                    }
                }
            }
        }
        
        textField.text = ""
        exitEventAddingMode()
        return true
    }
    
    func exitEventAddingMode() {
        eventField.removeFromSuperview()
        UIApplication.shared.keyWindow!.backgroundColor = windowBackgroundColour
        keyboardHeight = 0
        reloadCV()
    }
}

