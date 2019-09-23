// TextField        ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension CollectionVC {
    
    func prepareAndPresentTextField(dateString: String) {
        UIApplication.shared.keyWindow!.backgroundColor = iosKeyboardDefaultColourApprox
        presentTextField(after: 0, dateString: selectedTimeBlockDateDescription)
        reloadCV()
    }
    
    func presentTextField(after delay: Double, dateString: String) { /// commented stuff in this method double-commented on purpose; see next few commits
        formatAndPresentTextField(dateString: dateString)
    }
    
    
    func rePresentTextField() {                                                             //print("t")
        ///eventField.placeholder = "..."
        ///eventField.removeFromSuperview()     /// investigate... eg why not needed?
        
        if let placeholder = eventField.placeholder {                                       //print("re-presented text field from prepare()")
            formatAndPresentTextField(dateString: placeholder)
        }
        else {
            formatAndPresentTextField(dateString: "!")
        }
    }
    
    
    func formatAndPresentTextField(dateString: String) {
        
        textFieldWidth = UIApplication.shared.keyWindow!.frame.width * 3 / 4    // 3/4 = 6/8 e.g. 8 - 2 columns (1 right, 1 left of text field)
        let eighthWidth = UIApplication.shared.keyWindow!.frame.width / 8
        
        eventField.placeholder = dateString
        eventField.delegate = self
        eventField.frame = CGRect(x: eighthWidth, y: textFieldY, width: textFieldWidth, height: textFieldHeight)
        
        ///        eventField.attributedPlaceholder = NSAttributedString(string: dateString,
        ///                                                              attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray])
        
        view.addSubview(eventField)
        eventField.becomeFirstResponder()
    }
}

