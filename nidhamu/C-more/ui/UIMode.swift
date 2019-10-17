// UIMode           ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit


extension CollectionVC {
    
    func exitEventAddingMode() {
        
        if !keyboardLocked {
            eventField.removeFromSuperview()
            eventField.resignFirstResponder()
            globalWindow.backgroundColor = defaultWindowBackgroundColour
            keyboardHeight = 0
            textFieldDisplayed = false
        }

    }
    
}

/// also will add deferral-date selection mode methods here
