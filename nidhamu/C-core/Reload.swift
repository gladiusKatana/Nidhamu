// Reload           ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension CollectionVC {
    
    
    @objc func reloadCV() {
        
        if !reloadLock {
            self.collectionView.reloadData()
            reloadLock = true /// prevents concurrent reload-Data()s
            //print("↺")
            
        }
        //else {print("🔒reloadLock")}
        
    }
    
    
    func reloadCollectionViewAfterDelay(_ timeDelay: Double) {
        
        //print("↺d")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + timeDelay) {
            self.reloadCV()
        }
    }
    
}

