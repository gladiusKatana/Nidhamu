//  GoToVC.swift
//  nidhamu  ∙  1st commit July. 08, 2019  ∙  Created by Garth Snyder, aka gladiusKatana ⚔️
import UIKit

extension UICollectionViewController {
    
    func gotoView(vc: CollectionVC) {                                               //print("\nshowing vc \(vc)")
        
        if topVC != vc || !rePresentedVCFromButton {
            
            if vc == todoListVC {                                                   //print("time block being tested: \(timeBlock)")
                if let events = eventsAtIndexPath[previousTimeBlock] {
                    todoListVC.downcastLayout!.rows = events.count
                }
            }
            
            //if currentOrientation == "landscape" {
            
            setupTitleAndPresentViewController(vc: vc) { () -> () in
                reloadWithDelay(after: 0.02)
            }
            
            //} else {setupAndPresent(vc: vc)}
            
        } else {
            print("you're already looking at the \(vc.vcType)-view   nav'd by button?\(rePresentedVCFromButton)")//collectionViewType
        }
    }
}

