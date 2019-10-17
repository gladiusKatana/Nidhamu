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
        formatAndPresentTextField(dateString)
    }
    
    func rePresentTextField() {        //print("re-presenting text field & keyboard")
        ///eventField.placeholder = "..."
        ///eventField.removeFromSuperview()     /// causes a blink if keyboard is locked (since it dismisses & re-presents the keyboard & text field on every  reload Data (). )
        
        if vcType != .archive {
            var contents = ""
            
            if let placeholder = eventField.placeholder {
                
                contents = placeholder
                
            } else {contents = "!"}
            
            formatAndPresentTextField(contents)
        }
    }
    
    func formatAndPresentTextField(_ textFieldContents: String) {
        textFieldWidth = globalWindow.frame.width * 3 / 4    /// 3/4 = 6/8 e.g. 8 - 2 columns (1 right, 1 left of text field)
        let eighthWidth = globalWindow.frame.width / 8
        
        eventField.placeholder = textFieldContents
        eventField.delegate = self
        eventField.frame = CGRect(x: eighthWidth, y: textFieldY, width: textFieldWidth, height: textFieldHeight)
        
        ///        eventField.attributedPlaceholder = NSAttributedString(string: dateString, attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray])
        
        view.addSubview(eventField)
        eventField.becomeFirstResponder()
        textFieldDisplayed = true
    }
}

