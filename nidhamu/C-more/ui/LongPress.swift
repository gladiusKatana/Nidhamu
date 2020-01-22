// LongPress        ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension CollectionVC {
    
    @objc func handleLongPress(gestureRecognizer : UILongPressGestureRecognizer) {
        
        if (gestureRecognizer.state != UIGestureRecognizer.State.ended) {
            return
        }
        
        let location = gestureRecognizer.location(in: self.collectionView)
        
        if let indexPath = self.collectionView?.indexPathForItem(at: location) {
            rowLongPressed = indexPath.row;                                         //print("long pressed task \(rowLongPressed)")
            prepareAndPresentTextField()
            reloadCV()
        }
    }
}

