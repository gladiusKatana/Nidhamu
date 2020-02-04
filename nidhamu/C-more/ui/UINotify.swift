// UINotify         ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit; import NotificationCenter

/// only below method does not use NotificationCenter
func dateHeaderNotification(_ date: Date) -> String { /// creates a string notifying if input date is a daylight-savings date, OR if user has not backed up past-task archives in > 30 days
    
    let fbk = (truncateMins(date) != truncateMins(fallBackDate)) ? "" :
    "🌖 Daylight Savings (fall-back): the 1am time-block lasts for 2 hours "
    let spf = (truncateMins(date) != truncateMins(springForwardDate)) ? "" :
    "🌔 Daylight Savings (spring-forward): the 2am time-block gets skipped "  //(1:59→ 3:00)"
    var archiveIntervalNotification = ""
    let daysSinceLastArchiveEmail = Int(Date().timeIntervalSince(lastArchiveEmailDate) / 86400)
    
    if daysSinceLastArchiveEmail >= 30
        && fbk == "" && spf == ""
    {
        archiveIntervalNotification = "⌛️Note: Your Past-Event Archives were last updated \(daysSinceLastArchiveEmail) days ago... " //⭐️
    }
    
    return "\(fbk)\(spf)\(archiveIntervalNotification)"
}

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

