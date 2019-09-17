// Reload           ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
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
    
}

