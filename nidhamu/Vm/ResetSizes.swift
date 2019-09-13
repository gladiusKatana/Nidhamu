// ResetSizes       ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension CustomFlowLayout {
    
    func calculateAndResetSizes() {
        calculateSizes()
        
        cellWidth = cellWd; cellHeight = cellHt
        widthPlusSpace = cellWidth! + hSpace
        heightPlusSpace = cellHeight! + vSpace
    }
    
    
    func resizeAndReloadForKeyboard() {
        if timetableVC.downcastLayout!.autoFitHScale == 1 {
            ///if selectedTimeBlockPath[1] >= 18 {                                                 // keeping this commented out (for now), for logic & ui consistency
            if topVC.vcType == .hours {
                DispatchQueue.main.asyncAfter(deadline: .now()) {  //+ 0.5// [weak self] in
                    keyboardCellHeightMultiple = Int(keyboardHeight / timetableVC.downcastLayout!.cellHt)
                    
                    //print("\nkeyboard height: \(keyboardHeight) (\(keyboardCellHeightMultiple) cells tall)")
                    
                    let rows = self.rows
                    let gap = CGFloat(5) / (self.cellHt)        /// extra gap for better aesthetics
                    
                    self.autoFitHScale =
                        (CGFloat(rows - keyboardCellHeightMultiple) - gap) / CGFloat(rows)      //print("scale: \(self.autoFitHScale!)")
                    
                    topVC.reloadCV() ///topVC.reloadWithDelay(after: 0) //0.3
                }
            }                                                                                   //; print("[=1]")
            ///}
        }                                                                                       //print("k")
        else {                                                                                  //print("[≠1]")
            reloadsWhileResized += 1                                                            //; print(reloadsWhileResized)
            if reloadsWhileResized == 2 {
                self.autoFitHScale = 1; reloadsWhileResized = 0//-1
                resizeAndReloadForKeyboard()                                                    //; print("------------r \(reloadsWhileResized)")
            }
        }
    }
}

