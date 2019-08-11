// TextField        ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension CollectionVC {
    
    func rePresentTextField() {
        if textFieldDisplayed {                                                 //eventField.placeholder = "..."
            formatAndPresentTextField(dateString: eventField.placeholder!)
        }
    }
    
    func formatAndPresentTextField(dateString: String) {
        if !classifierViewDisplayed {
            let fieldWidth = CGFloat(325)
            let fieldHeight = CGFloat(2 * timetableLayout.cellHeight!)
            let halfWidth = (timetableLayout.cellWidth! + globalKeyWindow.frame.width - fieldWidth) / 2
            
            eventField.placeholder = dateString
            eventField.delegate = self
            eventField.frame = CGRect(x: halfWidth, y: textFieldY, width: fieldWidth, height: fieldHeight)
            view.addSubview(eventField); eventField.becomeFirstResponder()
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {              //print("TF_return")
        textField.resignFirstResponder(); textField.removeFromSuperview()
        textFieldDisplayed = false
        let textEntered = textField.text!
        
        if !(textEntered == "" || textEntered == " " || textEntered == "  ") {  // if user (for some reason) enters > 2 whitespaces, well, it's saved
            
            switch vcType {
                
            case .hours:                                                        //; print("text: \(text)")
                addToTimeBlocks(column: selectedTimeBlockPath[0], row: selectedTimeBlockPath[1], textEntered: textEntered)
                reloadCV()
                
            case .todoList:                                     //print("selected time block: \([selectedPath[0], selectedPath[1]])")
                addToTimeBlocks(column: selectedTimeBlockPath[0], row: selectedTimeBlockPath[1], textEntered: textEntered)
                gotoView(vc: todoListVC)                        // re-presents the view & reloads its data, to display updated todo list
                
            default: print("unrecognized collection view type")}
        } else {
            for cell in self.collectionView.visibleCells as! [CustomCell] {
                if cell.xyCoordinate == selectedTimeBlockPath {
                    cell.markedForItems = false; cell.backgroundColor = .red
                }
            }
        }
        
        textField.text = ""
        if vcType == .hours {animateSelectedCellColourBack()}
        return true
    }
}

