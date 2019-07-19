// Animations       ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension CollectionVC {
    
    func animateSelectedCellColourBack() {
        
        let cells = self.collectionView.visibleCells as! [CustomCell]
        
        for cell in cells {                                             //print("xy coord \(cell.xyCoordinate)")
            if cell.xyCoordinate == selectedTimeBlockPath {
                animateCellColourBack(cell: cell, originalColour: cell.cellColour)
                
                cell.titleLabel.textColor = .clear
                UIView.transition(with: cell.titleLabel, duration: 1, options: UIView.AnimationOptions.transitionCrossDissolve,
                                  animations: {
                                    cell.titleLabel.textColor = cellTextDefaultColour
                }, completion: nil)
            }
        }
    }
    
    func animateCellColourBack(cell: CustomCell, originalColour: UIColor) {
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1,
                       options: UIView.AnimationOptions.curveEaseOut, animations: {
                        cell.backgroundColor = originalColour
        }, completion: nil)
//        selectedTimeBlockPath = [-3, -3]
    }
    
}

