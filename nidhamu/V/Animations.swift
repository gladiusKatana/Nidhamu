// Animations       ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension CollectionVC {
    
    func animateTimeBlockTappedToAddEvent(cell: CustomCell) {
        
        UIView.animate(
            withDuration: 1, delay: 0,
            usingSpringWithDamping: 1, initialSpringVelocity: 1, options: UIView.AnimationOptions.curveLinear, animations: {
                cell.backgroundColor = eventAddingColour
        }, completion: nil /*{(finished:Bool) in self.prepareAndPresentTextField(dateString: selectedTimeBlockDateDescription)}*/
        )
    }
    
    // commented out only for now; may be implemented again soon
    
    //    func animateSelectedCellColourBack() {                              //print("animating cell colour back")
    //
    //        guard let cells = self.collectionView.visibleCells as? [BaseCell] else {print("could not downcast visibleCells for animation"); return}
    //
    //        for cell in cells {
    //            if cell.xyCoordinate == selectedTimeBlockPath {             //print("animate cell \(cell.xyCoordinate) colour back")
    //
    //                animateCellColourBack(cell: cell, delay: 0, duration: 0.75)
    //
    //                /*cell.titleLabel.textColor = .clear
    //                 UIView.transition(with: cell.titleLabel, duration: 1, options: UIView.AnimationOptions.transitionCrossDissolve,
    //                 animations: {
    //                 cell.titleLabel.textColor = cellTextDefaultColour
    //                 }, completion: nil)*/
    //            }
    //        }
    //    }
    
    
    //    func animateCellColourBack(cell: BaseCell, delay: Double, duration: Double) {
    //        UIView.animate(withDuration: TimeInterval(duration), delay: TimeInterval(delay), usingSpringWithDamping: 1, initialSpringVelocity: 1,
    //                       options: UIView.AnimationOptions.curveLinear, animations: {
    //                        cell.backgroundColor = cell.cellColour
    //        }, completion: nil)
    //    }
    
}

