// TFReturn         ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension CollectionVC {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {          //print("text field returned")
        ///textField.removeFromSuperview(); textField.resignFirstResponder()
        let textEntered = textField.text!
        if textEntered == "" || textEntered == " " || textEntered == "  " { /// if user (for some reason) enters > 2 whitespaces, well, it's saved
            
            previousTimeBlockPathSelected = defaultPathOutOfView
            exitTaskAddingMode()
        }
        else {
            if viewControllerType == .timetable {
                
                addToTimeBlock(atColumn: selectedTimeBlockPath[0], atRow: selectedTimeBlockPath[1],
                               textEntered: textEntered, taskDeadline: selectedCellDate, withStatus: nil)
            }
            
            if viewControllerType == .taskList {
                
                if rowLongPressed != -1 {
                    rewriteTask(atColumn: selectedTimeBlockPath[0], atRow: selectedTimeBlockPath[1], index: rowLongPressed,
                                textEntered: textEntered, taskDeadline: selectedCellDate, withStatus: nil)
                }
                else {
                    addToTimeBlock(atColumn: selectedTimeBlockPath[0], atRow: selectedTimeBlockPath[1],
                                   textEntered: textEntered, taskDeadline: selectedCellDate, withStatus: nil)
                    
                    if let tasks = tasksAtIndexPath[timeBlock] { /// if time-block is not empty
                        taskListVC.downcastLayout!.rows = tasks.count + minTaskListRows
                    }
                }
            }
        }
        
        textField.text = ""
        rowLongPressed = -1
        textFieldEditingMode = false
        
        if tasksAtIndexPath[timeBlock] == nil {
            exitTaskAddingMode()
        }
        
        reloadCV()
        topVC.setNavBarTitle(customString: nil)
        return true
    }
}


///for animations:

/*for cell in self.collectionView.visibleCells as! [BaseCell] {
 if cell.xyCoordinate == selectedTimeBlockPath {
 cell.backgroundColor = headerColour
 }
 }//animateSelectedCellColourBack()
 selectedTimeBlockPath = defaultPathOutOfView*/

