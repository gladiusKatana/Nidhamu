// Prepare          ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension CustomFlowLayout {
    
    override func prepare() {                                                                       //print(".", terminator: "")
        
        checkOrientation()
        
        if textFieldDisplayed {
            if timetableVC.downcastLayout!.autoFitHScale == 1 {             //if !reloadedFromKeyboardResize { reloadedFromKeyboardResize = true
                if topVC.vcType == .hours {
                    if selectedTimeBlockPath[1] >= 18 {                                             //print("resizing h-scale")
                        DispatchQueue.main.asyncAfter(deadline: .now()) {  //+ 0.5// [weak self] in
                            keyboardCellHeightMultiple = Int(keyboardHeight / timetableVC.downcastLayout!.cellHt)
                            
                            //print("\nkeyboard height: \(keyboardHeight) (\(keyboardCellHeightMultiple) cells tall)")
                            
                            let rows = self.rows
                            let gap = CGFloat(5) / (self.cellHt)                                    // extra gap for better aesthetics
                            self.autoFitHScale =
                                (CGFloat(rows - keyboardCellHeightMultiple) - gap) / CGFloat(rows)
                            
                            //print("scale: \(self.autoFitHScale!)")
                            
                            //topVC.reloadCV() //; print("reloaded after height change\n")
                            topVC.reloadWithDelay(after: 0) //0.3
                        }
                        self.autoFitHScale = 1                                                      //; print("k[1]")
                    }
                }
            }                                                                                       //print("k")
        }
        //else {print("n")}
        
        calculateSizes()
        
        cellWidth = cellWd; cellHeight = cellHt
        widthPlusSpace = cellWidth! + hSpace
        heightPlusSpace = cellHeight! + vSpace
        
        var statusBarDelta = 0.0
        if UIApplication.shared.statusBarFrame.size.height > 20 {
            statusBarDelta = Double(UIApplication.shared.statusBarFrame.size.height - 20)
        }
        
        yOffset = collectionView!.contentOffset.y + CGFloat(navBarHeight + statusBarHeight - statusBarDelta)  //print("yo: \(yOffSet)")
        xOffSet = collectionView!.contentOffset.x
        textFieldY = CGFloat(navBarHeight + statusBarHeight - statusBarDelta)                   //; print("textFieldY = \(textFieldY)")
        
        //        if embeddedInNavController {
        
        if previousOrientation != currentOrientation {
            
            DispatchQueue.main.asyncAfter(deadline: .now()) {
                
                if eventArraysToProcess.count > 0 {
                    savedTimeBlocksForProcessing = false
                    eventArraysToProcess = []; pathsToProcess = []
                }
                topVC.rePresentThenReload(vc: topVC)
            }
        } else {
            if topVC.vcType == .hours {                                                     //print("prepare()") //, top vc \(top VC.vcType)...
                processCurrentDate()                                                        //; print("process date from prepare")
            }
        }
        if topVC.vcType == .hours {timetableVC.rePresentTextField()}
        //        }
    }
}

