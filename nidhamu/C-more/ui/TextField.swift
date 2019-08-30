// TextField        ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension CollectionVC {
    
    func rePresentTextField() {
        if textFieldDisplayed {                                                 //eventField.placeholder = "..."
            if let placeholder = eventField.placeholder {                       //print("re-presented text field from prepare()")
                formatAndPresentTextField(dateString: placeholder)
            } ///else {formatAndPresentTextField(dateString: "!")}
        }
    }
    
    func formatAndPresentTextField(dateString: String) {
        let fieldWidth = CGFloat(325)
        let fieldHeight = CGFloat(2 * timetableLayout.cellHeight!)
        let halfWidth = (timetableLayout.cellWidth! + globalKeyWindow.frame.width - fieldWidth) / 2
        
        eventField.placeholder = dateString
        eventField.delegate = self
        eventField.frame = CGRect(x: halfWidth, y: textFieldY, width: fieldWidth, height: fieldHeight)
        view.addSubview(eventField)
        eventField.becomeFirstResponder()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {              //print("TF_return")
        textField.resignFirstResponder()
        textField.removeFromSuperview()
        textFieldDisplayed = false
        let textEntered = textField.text!
        
        if !(textEntered == "" || textEntered == " " || textEntered == "  ") {  // if user (for some reason) enters > 2 whitespaces, well, it's saved
            addToTimeBlocks(column: selectedTimeBlockPath[0], row: selectedTimeBlockPath[1], textEntered: textEntered)
            
            switch vcType {
                
            case .hours:                                                        //print("text: \(textEntered)")
                reloadCV()
                
            case .todoList:                                                     //print("selected block: \([selectedPath[0], selectedPath[1]])")
                gotoView(vc: todoListVC)                                        // re-presents view & reloads its data, to display updated todo list
                
            default: print("unrecognized collection view type")}
        } else {
            for cell in self.collectionView.visibleCells as! [CustomCell] {
                if cell.xyCoordinate == selectedTimeBlockPath {
                    cell.markedForItems = false
                    cell.backgroundColor = .white
                }
            }
        }
        
        textField.text = ""
        if vcType == .hours {animateSelectedCellColourBack()}
        return true
    }
}
