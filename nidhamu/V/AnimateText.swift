// AnimateText      ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension CollectionVC {
    
    func conditionalTextAnimation(cell: CustomCell) {
        
        if taskArraysToProcess.isEmpty {
            DispatchQueue.main.asyncAfter(deadline: .now() + lastLoginTextFadeLength) {
                UILabel.transition(with: cell.titleLabel, duration: 1, options: .transitionCrossDissolve, animations: {
                    cell.titleLabel.textColor = UIColor.clear
                }, completion: nil)
            }
        }
        
    }
    
}

