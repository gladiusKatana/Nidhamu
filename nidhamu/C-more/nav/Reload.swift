// Reload           ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension CollectionVC {
    
    
    @objc func reloadCV() {                                         /// called 9 times in this program
        
        //; print("↺")
        
        self.collectionView.reloadData()
    }
    
    
    func reloadCollectionViewAfterDelay(_ timeDelay: Double) {                 /// called 2 times in this program
        
        //print("↺d")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + timeDelay) {
            self.collectionView.reloadData()
        }
    }
    
}

