// TextField        ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension CollectionVC {
    
    func prepareAndPresentTextField() {
        globalWindow.backgroundColor = iosKeyboardDefaultColourApprox
        backgroundVC.view.backgroundColor = globalWindow.backgroundColor
        let dateStr = formattedDateString(selectedCellDate, roundedDown: false, showYear: false, prefix: "Add Task [Due:", suffix: "]", dateFormat: .fullDayShortForm) /// ! probably needs smaller font on iPhone SE in portrait
        formatAndPresentTextField(dateStr)
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
        let width = globalWindow.frame.width
        textFieldWidth = width * 3 / 4           /// 3/4 = 6/8 e.g. 8 - 2 columns (1 right, 1 left of text field)
        let eighthWidth = width / 8
        
        taskField.placeholder = textFieldContents
        taskField.delegate = self
        taskField.frame = CGRect(x: eighthWidth, y: textFieldY, width: textFieldWidth, height: textFieldHeight)
        
        ///taskField.attributedPlaceholder = NSAttributedString(string: dateString, attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray])
        
        view.addSubview(taskField)
        taskField.becomeFirstResponder()
        textFieldDisplayed = true
    }
}

