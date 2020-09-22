// Animations       ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension CollectionVC {
    
    func animateLoginIntervalCells(cell: CustomCell) {              print("|", terminator: "")
        animating = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            if indexPathsToProcess.isEmpty {
                UIView.animate(
                    withDuration: 7, delay: 0,
                    usingSpringWithDamping: 1, initialSpringVelocity: 0, options: UIView.AnimationOptions.curveEaseIn, animations: {
                        cell.backgroundColor = cell.xyCoordinate[0] > nowColumn ? cellDefaultColour : greyoutForTimeBlocksPassedThisWeek
                }, completion: {(finished:Bool) in
                    if !taglessSavingFlag {
                        defaultSaveData(saveDate: true, resetLastLogin: false, showDate: false, pryntTasks: true)
                        print("\n(autosaved)\n")
                        wakeupDateReset(withReload: false)
                        taglessSavingFlag = true
                    }
                    animating = false
                }
                )
            }
        }
    }
    
    //    func animateTimeBlockTappedToAddTask(cell: CustomCell) {
    //
    //        UIView.animate(
    //            withDuration: 0.5, delay: 0,
    //            usingSpringWithDamping: 1, initialSpringVelocity: 1, options: UIView.AnimationOptions.curveLinear, animations: {
    //                cell.backgroundColor = taskAddingColour
    //        }, completion: nil /*{(finished:Bool) in self.prepareAndPresentTextField(dateString: selectedTimeBlockDateDescription)}*/
    //        )
    //    }
    
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

