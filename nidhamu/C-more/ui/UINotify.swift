// UINotify         ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit; import NotificationCenter

extension CollectionVC {
    
    func statusBarHeightChangeNotificationSetup() {
        
        if phones.contains(modelName) {
            let center = UNUserNotificationCenter.current()
            center.removeAllDeliveredNotifications()                // to remove all delivered notifications
            center.removeAllPendingNotificationRequests()           // to remove all pending notifications which are not delivered yet but scheduled.
            
            NotificationCenter.default.addObserver(self, selector: #selector(reloadCV),
                                                   name: UIApplication.willChangeStatusBarFrameNotification, object: nil)
        }
    }
    
    
    func keyboardNotificationSetup() {
        NotificationCenter.default.addObserver(self, selector: #selector(showKBoard), name: UIResponder.keyboardWillShowNotification, object: nil
        )
    }
    
    
    @objc func showKBoard(_ notification: Notification) {                                       //print("keyboard will show")
        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            keyboardHeight = keyboardRectangle.height
            
            textFieldDisplayed = true //; print("⌨️")
            reloadCV(); firstReloadForKeyboard = true
        }
    }
}

