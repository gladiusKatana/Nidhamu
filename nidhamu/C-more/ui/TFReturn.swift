// TFReturn         ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension CollectionVC {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {          //print("TF_return")
        
        textField.resignFirstResponder()
        textField.removeFromSuperview()
        textFieldDisplayed = false
        
        let textEntered = textField.text!
        
        if textEntered == "" || textEntered == " " || textEntered == "  " { // if user (for some reason) enters > 2 whitespaces, well, it's saved
            
            if vcType == .hours && downcastLayout?.autoFitHScale != 1 {
                downcastLayout?.autoFitHScale = 1
                reloadCV()
            }
            
            for cell in self.collectionView.visibleCells as! [BaseCell] {
                if cell.xyCoordinate == selectedTimeBlockPath {
                    cell.backgroundColor = headerColour
                }
            }
            
            ///animateSelectedCellColourBack()
            previousTimeBlockPathSelected = defaultPathOutOfView
        }
        else {
            addToTimeBlocks(column: selectedTimeBlockPath[0], row: selectedTimeBlockPath[1], textEntered: textEntered)
            
            if vcType == .todoList {
                rePresentedVCManually = true
                gotoView(vc: todoListVC)                                    // re-presents view & reloads its data, to display updated todo list
            }
            
            selectedTimeBlockPath = defaultPathOutOfView
        }
        
        textField.text = ""
        
        if vcType == .hours {
            DispatchQueue.main.asyncAfter(deadline: .now()) { [weak self] in
                keyboardHeight = 0                                          //; print("changed keyboard height")
                self?.reloadCV()
            }
        }
        return true
    }
}

