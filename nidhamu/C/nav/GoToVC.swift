// GoToVC           ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension CollectionVC {
    
    func gotoView(vc: CollectionVC) {                                               //print("\nshowing vc \(vc)")
        
        if topVC != vc || !rePresentedVCFromButton {
            
            if vc == todoListVC {                                                   //print("time block being tested: \(timeBlock)")
                if let events = eventsAtIndexPath[timeBlock] {                      //eventsAt IndexPath[imeBlock]
                    todoListVC.downcastLayout!.rows = events.count
                }
            }
            
            setupTitleAndPresentViewController(vc: vc) { () -> () in
                reloadWithDelay(after: 0.02)
            }
            
        } else {print("you're already looking at the \(vc.vcType)-view   nav'd by button?\(rePresentedVCFromButton)")}
    }
}

