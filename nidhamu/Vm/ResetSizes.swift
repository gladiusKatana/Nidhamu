// ResetSizes       ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

var keyboardScalor = CGFloat(1)

extension CustomFlowLayout {
    
    func calculateAndResetSizes() {
        
//        if textFieldDisplayed {
//            if previousOrientation == currentOrientation && firstReloadForKeyboard
//                || previousOrientation != currentOrientation
//            {
//                resizeAndReloadForKeyboard()
//                firstReloadForKeyboard = false
//            }
//        }
        
        (cellWidth, cellHeight) = calculateSizes()
        
        resetDimensionIfSquareCellsEnabled()
        widthPlusSpace = cellWidth! + hSpace
        heightPlusSpace = cellHeight! + vSpace
    }
    
//    func resizeAndReloadForKeyboard() {
//        ///if timetableVC.downcastLayout!.autoFitHScale == 1 {
//        if keyboardScalor == 1 {
//            ///if selectedTimeBlockPath[1] >= 18 {                                                 // keeping this commented out (for now), for logic & ui consistency
//
//            if topVC.vcType == .hours {
//                DispatchQueue.main.asyncAfter(deadline: .now()) {  //+ 0.5// [weak self] in
//                    let keyboardCellHeightMultiple = Int(keyboardHeight / timetableVC.downcastLayout!.cellHeight!)
//
//                    //print("\nkeyboard height: \(keyboardHeight) (\(keyboardCellHeightMultiple) cells tall)")
//
//                    let gap = CGFloat(5) / (self.cellHeight!)        /// extra gap for better aesthetics
//
//                    keyboardScalor =
//                        (CGFloat(self.rows - keyboardCellHeightMultiple) - gap) / CGFloat(self.rows) //print("scale: \(self.autoFitHScale!)")
//
//                   topVC.reloadCV() ///topVC.reloadWithDelay(after: 0) //0.3
//                }
//
//            }                                                                                   //; print("[=1]")
//
//            ///}
//
//        } else {                                                                                //print("[≠1]")
//            reloadsWhileResized += 1                                                //; print(reloadsWhileResized)//; print(reloadsWhileResized)
//            if reloadsWhileResized == 1 {
//
//                //self.autoFitHScale = 1
//                keyboardScalor = 1
//
//                reloadsWhileResized = 0//-1
//                resizeAndReloadForKeyboard()                                                    //; print("------------r \(reloadsWhileResized)")
//            }
//        }
//        ///}
//    }
}

