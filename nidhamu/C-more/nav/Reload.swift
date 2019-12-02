// Reload           ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension CollectionVC {
    
    
    @objc func reloadCV() {
        
        //print("↺")
        
        collectionView.reloadData()
    }
    
    
    func reloadCollectionViewAfterDelay(_ timeDelay: Double) {
        
        //print("↺d")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + timeDelay) {
            self.collectionView.reloadData()
        }
    }
    
}

