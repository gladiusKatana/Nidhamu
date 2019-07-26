// Pinching         ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension CollectionVC {
    
    func addPinchRecognizer() {
        if vcType == .todoList {
            let dismissPinch = UIPinchGestureRecognizer(target: self, action: #selector(handlePinch))
            self.view.addGestureRecognizer(dismissPinch)
        }
        
        if vcType == .hours {justPinched = false}
    }
    
    
    @objc func handlePinch() {
        if !justPinched { justPinched = true
            self.gotoView(vc: timetableVC)
            timetableVC.reloadCV()
        }
    }
}

