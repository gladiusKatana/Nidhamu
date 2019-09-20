// TextField        ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension CollectionVC {
    
    
    func presentTextField(after delay: Double, dateString: String) {
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) { [weak self] in
            self?.formatAndPresentTextField(dateString: dateString)
        }
    }
    
    
    func formatAndPresentTextField(dateString: String) {
        ///textFieldHeight = CGFloat(3 * timetableLayout.cellHeight!); textFieldWidth = // already calculated in calculateAndResetSizes()
        eventField.placeholder = dateString
        eventField.delegate = self
        eventField.frame = CGRect(x: downcastLayout!.cellWidth!, y: textFieldY, width: textFieldWidth, height: textFieldHeight) //fieldHeight
        view.addSubview(eventField)
        eventField.becomeFirstResponder()
    }
    
    
    func rePresentTextField() {                                             //print("t")
        ///eventField.placeholder = "..." ; eventField.removeFromSuperview()
        
        if let placeholder = eventField.placeholder {                       //print("re-presented text field from prepare()")
            formatAndPresentTextField(dateString: placeholder)
        }
        else {formatAndPresentTextField(dateString: "!")}
    }
    
}

