// Pinch            ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension CollectionVC {
    
    
    func setupPinchToExit() {
        
        dismissPinch = UIPinchGestureRecognizer(target: self, action: #selector(handlePinch))
        self.view.addGestureRecognizer(dismissPinch)
        justPinched = false
        
    }
    
    
    @objc func handlePinch() {
        
        if !justPinched { justPinched = true
            gotoView(vc: timetableVC)
        }
        
    }
    
}

