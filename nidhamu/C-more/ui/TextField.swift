// TextField        ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension CollectionVC {
    
    func prepareAndPresentTextField(dateString: String) {
        globalWindow.backgroundColor = iosKeyboardDefaultColourApprox
        collectionView.backgroundColor = .clear
        presentTextField(after: 1, dateString: selectedTimeBlockDateDescription)
        reloadCV()
    }
    
    func presentTextField(after delay: Double, dateString: String) { /// commented stuff in this method is double-commented on purpose; see next few commits
        formatAndPresentTextField(dateString: dateString)
    }
    
    
    func rePresentTextField() {
        ///eventField.placeholder = "..."
        //eventField.removeFromSuperview()     /// is this actually needed? ...investigate
        
        if vcType != .archive {
            if let placeholder = eventField.placeholder {                       //print("re-presented text field from prepare()")
                formatAndPresentTextField(dateString: placeholder)
            }
            else {
                formatAndPresentTextField(dateString: "!")
            }
        }
    }
    
    
    func formatAndPresentTextField(dateString: String) {
        
        textFieldWidth = globalWindow.frame.width * 3 / 4    /// 3/4 = 6/8 e.g. 8 - 2 columns (1 right, 1 left of text field)
        let eighthWidth = globalWindow.frame.width / 8
        
        eventField.placeholder = dateString
        eventField.delegate = self
        eventField.frame = CGRect(x: eighthWidth, y: textFieldY, width: textFieldWidth, height: textFieldHeight)
        
        ///        eventField.attributedPlaceholder = NSAttributedString(string: dateString,
        ///                                                              attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray])
        
        view.addSubview(eventField)
        eventField.becomeFirstResponder()
        textFieldDisplayed = true
    }
}

