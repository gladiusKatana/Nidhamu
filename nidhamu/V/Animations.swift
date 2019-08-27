// Animations       ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension CollectionVC {
    
    func animateSelectedCellColourBack() {                              //print("animating cell colour back")
        
        let cells = self.collectionView.visibleCells as! [CustomCell]
        
        for cell in cells {
            if cell.xyCoordinate == selectedTimeBlockPath {             //print("animate cell \(cell.xyCoordinate) colour back")
                
                animateCellColourBack(cell: cell, duration: 0.75)
                
                /*cell.titleLabel.textColor = .clear
                UIView.transition(with: cell.titleLabel, duration: 1, options: UIView.AnimationOptions.transitionCrossDissolve,
                                  animations: {
                                    cell.titleLabel.textColor = cellTextDefaultColour
                }, completion: nil)*/
                
                selectedTimeBlockPath = defaultPathOffOfView
            }
        }
    }
    
    func animateCellColourBack(cell: CustomCell, duration: Double) {
        UIView.animate(withDuration: TimeInterval(duration), delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1,
                       options: UIView.AnimationOptions.curveEaseOut, animations: {
                        cell.backgroundColor = cell.cellColour
        }, completion: nil)
    }
}

