// UIMode           ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit


extension CollectionVC {

    func exitEventAddingMode() {
        eventField.removeFromSuperview()
        eventField.resignFirstResponder()
        globalWindow.backgroundColor = defaultWindowBackgroundColour
        keyboardHeight = 0
        self.reloadCV()
    }

}

/// also will add deferral-date selection mode methods here
