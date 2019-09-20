// UINotify         ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit
import NotificationCenter


extension CollectionVC {
    
    
    func statusBarHeightChangeNotificationSetup() {
        
        if phones.contains(modelName) {
            let center = UNUserNotificationCenter.current()
            center.removeAllDeliveredNotifications()          // to remove all delivered notifications
            center.removeAllPendingNotificationRequests()     // to remove all pending notifications which are not delivered yet but scheduled.
            
            NotificationCenter.default.addObserver(self, selector: #selector(reloadCV),
                                                   name: UIApplication.willChangeStatusBarFrameNotification, object: nil)
        }
    }
    
    
    func keyboardNotificationSetup() {
        NotificationCenter.default.addObserver(self, selector: #selector(showKBoard), name: UIResponder.keyboardWillShowNotification, object: nil
        )
    }
    
    
    @objc func showKBoard(_ notification: Notification) {     //print("⌨️")
        
        checkOrientation()
        
        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            
            keyboardHeight = keyboardFrame.cgRectValue.height + textFieldHeight
            
            if currentOrientation == "portrait" {
                portraitKeyboardHeight = keyboardFrame.cgRectValue.height + textFieldHeight
                if !firstPortraitKeyboardPresented {firstPortraitKeyboardPresented = true}
            }
            if currentOrientation == "landscape" {
                landscapeKeyboardHeight = keyboardFrame.cgRectValue.height + textFieldHeight
                if !firstLandscapeKeyboardPresented {firstLandscapeKeyboardPresented = true}
            }
            
            textFieldDisplayed = true
            timetableVC.reloadWithDelay(after: 0)
        }
    }
}

