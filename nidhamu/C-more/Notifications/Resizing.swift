// Resizing         ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit; import NotificationCenter

extension CollectionVC {
    
    func statusBarHeightChangeNotificationSetup() {
        if phones.contains(modelName) {
            let center = UNUserNotificationCenter.current()
            center.removeAllDeliveredNotifications()          // to remove all delivered notifications
            center.removeAllPendingNotificationRequests()     // to remove all pending notifications which are not delivered yet but scheduled.
            
            /*NotificationCenter.default.addObserver(self, selector: #selector(reloadCV),
             name: UIApplication.willChangeStatusBarFrameNotification, object: nil)*/
        }
    }
    
    /// may not need the below method (which replaces the willChangeStatusBarFrameNotification observer above). The reloading after resizing affects the layout object, thus is done in prepare()
    /*override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
     super.viewWillTransition(to: size, with: coordinator) /// If this line is missing your child will not get the delegate call in its viewWillTransition
     reloadCV()    ; print("size changed")
     }*/
    
    func keyboardNotificationSetup() {
        NotificationCenter.default.addObserver(self, selector: #selector(showKBoard), name: UIResponder.keyboardWillShowNotification, object: nil
        )
    }
    
    @objc func showKBoard(_ notification: Notification) { //print("⌨️")
        textFieldDisplayed = true
    }
    
    //    @objc func showKBoard(_ notification: Notification) {                                   //print("⌨️")
    //        checkOrientation()
    //
    //        if let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
    //            keyboardHeight = keyboardFrame.cgRectValue.height + textFieldHeight             //; print("⌨️height: \(keyboardHeight)")
    //
    //            if currentOrientation == "portrait" {
    //                portraitKeyboardHeight = keyboardHeight
    //                if !firstPortraitKeyboardPresented {firstPortraitKeyboardPresented = true}
    //            }
    //
    //            if currentOrientation == "landscape" {
    //                landscapeKeyboardHeight = keyboardHeight
    //                if !firstLandscapeKeyboardPresented {firstLandscapeKeyboardPresented = true}
    //            }
    //        }
    //
    //        textFieldDisplayed = true
    //        timetableVC.reloadCV()
    //    }
}

