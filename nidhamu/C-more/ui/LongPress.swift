// LongPress        ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension CollectionVC {
    
    @objc func handleLongPress(gestureRecognizer : UILongPressGestureRecognizer) {
        
        let location = gestureRecognizer.location(in: self.collectionView)
        
        if let indexPath = self.collectionView?.indexPathForItem(at: location) {
            
            if gestureRecognizer.state == UIGestureRecognizer.State.began {
                latestLongPressOnTask = Date()
            }
            
            if (gestureRecognizer.state == UIGestureRecognizer.State.ended) {
                let longPressDuration = Date().timeIntervalSince1970 - latestLongPressOnTask.timeIntervalSince1970
                ///print("Long pressed for \(longPressDuration) seconds")
                
                if longPressDuration > TimeInterval(2) {
                    if let task = tasksAtIndexPath[timeBlock] {
                        taskIsDeletable = true
                        setNavBarTitle(customString: "Tap to Delete Task '\(task[indexPath.row].taskDescription)':")
                    }
                }
                else {
                    rowLongPressed = indexPath.row                      //; print("long pressed task \(rowLongPressed)")
                    prepareAndPresentTextField()
                    reloadCV()
                }
            }
        }
    }
}

