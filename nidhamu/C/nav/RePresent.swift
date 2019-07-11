//  RePresent.swift
//  nidhamu  ∙  1st commit July. 08, 2019  ∙  Created by Garth Snyder, aka gladiusKatana ⚔️
import UIKit

extension UICollectionViewController {
    
    @objc func reloadAfterVCIsPossiblyPresentedAgainFromCallToPrepare(vc: CollectionVC) { //---------reload again (and potentially re-present) for...
        classifierVC.view.removeFromSuperview()                     // ...visual continuity (needed when, e.g., toggling views while in landscape)
        
        if previousOrientation == "landscape" && currentOrientation == "portrait" || firstReenteredForeground {
            rePresentedVCFromButton = false                         //; print("\n---------presented then reloaded \(vc.collectionViewType) cv ")
            setupTitleAndPresentViewController(vc: vc) { () -> () in
                previousOrientation = currentOrientation //* should probably factor out
                reloadWithDelay(after: 0.05) //0.1 //0.2
            }
            
        } else {
            previousOrientation = currentOrientation
            reloadCV() //reloadWithDelay(after: 0.02) // ?use time delay, as in above completion block? (will test over time, with different devices)
            
            /*setupTitleAndPresentViewController(vc: vc) { () -> () in
             previousOrientation = currentOrientation
             reloadWithDelay(after: 0)
             }*/
        }
    }
}

