// TFReturn         ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension CollectionVC {    ///  /**/  commented code here is for animations
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {          //print("text field returned")
        ///textField.removeFromSuperview(); textField.resignFirstResponder()
        
        let textEntered = textField.text!
        
        if textEntered == "" || textEntered == " " || textEntered == "  " { // if user (for some reason) enters > 2 whitespaces, well, it's saved
            
            /*for cell in self.collectionView.visibleCells as! [BaseCell] {
             if cell.xyCoordinate == selectedTimeBlockPath {
             cell.backgroundColor = headerColour
             }
             }//animateSelectedCellColourBack()
             selectedTimeBlockPath = defaultPathOutOfView*/
            
            if !keyboardLocked {previousTimeBlockPathSelected = defaultPathOutOfView}
            
        } else {
            addToTimeBlocks(column: selectedTimeBlockPath[0], row: selectedTimeBlockPath[1], textEntered: textEntered,
                            taskDeadline: selectedCellDate, withStatus: nil)
            
            if viewControllerType == .timetable {
                if !keyboardLocked {
                    selectedTimeBlockPath = defaultPathOutOfView
                    previousTimeBlockPathSelected = defaultPathOutOfView
                }
            }
            
            if viewControllerType == .taskList {
                if let tasks = tasksAtIndexPath[timeBlock] {  /// if time-block is not empty
                    taskListVC.downcastLayout!.rows = tasks.count
                }
            }
        }
        
        textField.text = ""
        
        if !keyboardLocked {exitTaskAddingMode()}
        
        reloadCV()
        
        return true
    }
}

