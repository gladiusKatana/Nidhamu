//  RePresent.swift
//  nidhamu  ∙  1st commit July. 08, 2019  ∙  Created by Garth Snyder, aka gladiusKatana ⚔️
import UIKit

//             reload again (and /or potentially re-present)
//             for visual continuity
//             (needed when, e.g., toggling views while in landscape)

extension UICollectionViewController {
    
    @objc func re_Reload__PossiblyAfterRe_Presenting(vc: CollectionVC) {
        
        classifierVC.view.removeFromSuperview()
        
        if previousOrientation == "landscape" && currentOrientation == "portrait" || firstReenteredForeground {
            
            rePresentedVCFromButton = false                            ; print("\n---------------------presented then reloaded \(vc.vcType) cv ")
            
            setupTitleAndPresentViewController(vc: vc) { () -> () in
                previousOrientation = currentOrientation               //* check whether able to factor out
                reloadWithDelay(after: 0.05)                           //+ 0.1 //+ 0.2  //time delays previously tried, on an iPhone 7*
            }
            
        } else {
            
            previousOrientation = currentOrientation
            reloadCV() //reloadWithDelay(after: 0.02)//?use time delay, as in above completion block? (*will test over time, with different devices)
            
            /*setupTitleAndPresentViewController(vc: vc) { () -> () in
             previousOrientation = currentOrientation
             reloadWithDelay(after: 0)
             }*/
        }
    }
    
}

