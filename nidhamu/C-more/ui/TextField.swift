// TextField        ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension CollectionVC {
    
    func rePresentTextField() {     //print("re-presenting text field")
        if textFieldDisplayed {                                                 //eventField.placeholder = "..."
            if let placeholder = eventField.placeholder {                       //print("re-presented text field from prepare()")
                formatAndPresentTextField(dateString: placeholder)
            } else {formatAndPresentTextField(dateString: "!")}
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
    
    func presentTextField(after delay: Double, dateString: String) {
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) { [weak self] in
            self?.formatAndPresentTextField(dateString: dateString)
        }
    }
}

