// RefreshUI        ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension CollectionVC {
    
    
    @objc func reloadCV() {
        self.collectionView.reloadData()                                    //; print("↺")
    }
    
    
    func reloadWithDelay(after timeDelay: Double) {                         //print("↺d")
        DispatchQueue.main.asyncAfter(deadline: .now() + timeDelay) {
            self.reloadCV()
            //self.collectionView.reloadData()
        }
    }
    
    
    func dismissNavController(completion: @escaping () -> ()) {
        navController?.dismiss(animated: false, completion: nil)
        completion()
    }
    
    
    func rePresentThenReload(vc: CollectionVC) {                            // reload again (and /or potentially re-present)
        
        /*if previousOrientation == "landscape" && currentOrientation == "portrait" // (needed when, e.g., toggling views while in landscape)
         || firstReenteredForeground
         {*/
        
        //if vcType == .hours {print("\n---------------------presented then reloaded \(vc.vcType) cv ")}
        
        setupTitleAndPresentViewController(vc: vc) { () -> () in
            
            //reloadWithDelay(after: 0.5)                                   //+ 0.1 //+ 0.2  //time delays previously tried, on an iPhone 7*
            //reloadCV()
            
            rePresentedVCManually = false
        }
        
        /*} else {
         previousOrientation = currentOrientation
         reloadCV() //reloadWithDelay(after: 0.02)//?use delay, as in above completion block? (*will test over time, with different devices)
         }*/
        
    }
}

