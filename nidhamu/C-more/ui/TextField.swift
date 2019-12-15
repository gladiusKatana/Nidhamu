// TextField        ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension CollectionVC {
    
    func prepareAndPresentTextField(dateString: String) {
        globalWindow.backgroundColor = iosKeyboardDefaultColourApprox
        backgroundVC.view.backgroundColor = globalWindow.backgroundColor
        
        formatAndPresentTextField(dateString)
        reloadCV()
    }
    
    func rePresentTextField() {         //print("re-presenting text field & keyboard")
        ///taskField.placeholder = "..."
        ///taskField.removeFromSuperview()          /// do not uncomment: causes a blink if keyboard is locked (since it dismisses & re-presents the keyboard & text field on every  reload Data (). )
        
        if viewControllerType != .archive {
            var contents = ""
            
            if let placeholder = taskField.placeholder {
                
                contents = placeholder
                
            } else {contents = "!"}
            
            formatAndPresentTextField(contents)
        }
    }
    
    func formatAndPresentTextField(_ textFieldContents: String) {
        textFieldWidth = globalWindow.frame.width * 3 / 4           /// 3/4 = 6/8 e.g. 8 - 2 columns (1 right, 1 left of text field)
        let eighthWidth = globalWindow.frame.width / 8
        
        taskField.placeholder = textFieldContents
        taskField.delegate = self
        taskField.frame = CGRect(x: eighthWidth, y: textFieldY, width: textFieldWidth, height: textFieldHeight)
        
        ///taskField.attributedPlaceholder = NSAttributedString(string: dateString, attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray])
        
        view.addSubview(taskField)
        taskField.becomeFirstResponder()
        textFieldDisplayed = true
    }
}

