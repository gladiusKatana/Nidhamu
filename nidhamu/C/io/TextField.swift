// TextField        ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension CollectionVC {
    
    func rePresentTextField() {
        if textFieldDisplayed {
            let customLayout = downcastLayout!
            eventField.placeholder = "..."
            formatAndPresentTextField(layout: customLayout, dateString: eventField.placeholder!)
        }
    }
    
    func formatAndPresentTextField(layout: CustomFlowLayout, dateString: String) {   // may remove argument  customLayout
        if !classifierViewDisplayed {
            let fieldWidth = CGFloat(325)
            let fieldHeight = CGFloat(2 * timetableLayout.cellHeight!)
            let halfWidth = (timetableLayout.cellWidth! + globalKeyWindow.frame.width - fieldWidth) / 2
            
            eventField.placeholder = dateString
            eventField.delegate = self
            eventField.frame = CGRect(x: halfWidth, y: textFieldY, width: fieldWidth, height: fieldHeight)
            view.addSubview(eventField)
            eventField.becomeFirstResponder(); print("set text field as first responder")
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {      //print("TF_return")
        textField.resignFirstResponder()
        textField.removeFromSuperview()
        textFieldDisplayed = false
        
        let textEntered = textField.text!
        if textEntered != "" {
            
            switch vcType {
                
            case .hours:                    //; print("text: \(text)")
                
                addToTimeBlocks(column: selectedTimeBlockPath[0], row: selectedTimeBlockPath[1], textEntered: textEntered)
                reloadCV()
                
            case .todoList:                 //print("selected time block: \([previousSelectedPath[0], previousSelectedPath[1]])")
                
                addToTimeBlocks(column: previousSelectedTimeBlockPath[0], row: previousSelectedTimeBlockPath[1], textEntered: textEntered)
                gotoView(vc: todoListVC)    // essentially reloads the view to display the updated list
                
            default: print("unrecognized collection view type")}
            
            textField.text = ""
        }
        
        if vcType == .hours {animateSelectedCellColourBack()}
        return true
    }
}

