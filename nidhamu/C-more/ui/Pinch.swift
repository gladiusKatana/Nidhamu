// Pinch            ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension CollectionVC {
    
    func setupPinching() {
        if vcType == .todoList {
            let dismissPinch = UIPinchGestureRecognizer(target: self, action: #selector(handlePinch))
            self.view.addGestureRecognizer(dismissPinch)
        }
        
        if vcType == .hours {justPinched = false}
    }
    
    
    @objc func handlePinch() {
        if !justPinched { justPinched = true
            gotoView(vc: timetableVC)
        }
    }
}

