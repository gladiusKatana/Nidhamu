// Prepare          ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension CustomFlowLayout {
    
    override func prepare() {                                                               //print(".", terminator: "")
        
        checkOrientation()
        
//        if reloadForKeyboardRotation {
//            previousOrientation = currentOrientation // ! this assumes reload-count will always reach 2 when rotating (test over time)
//        }
        
        if previousOrientation == currentOrientation {
            if textFieldDisplayed {
                if firstReloadForKeyboard {
                    resizeAndReloadForKeyboard()
                    firstReloadForKeyboard = false
                }
//                if reloadForKeyboardRotation {
//                    resizeAndReloadForKeyboard()
//                    //reloadForKeyboardRotation = false
//                }                                                                           //else {print("nr")}
            }
        }
        
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
        textFieldY = CGFloat(navBarHeight + statusBarHeight - statusBarDelta)               //; print("textFieldY = \(textFieldY)")
        
        
        if previousOrientation != currentOrientation {
            
            DispatchQueue.main.asyncAfter(deadline: .now()) {
                if eventArraysToProcess.count > 0 {
                    savedTimeBlocksForProcessing = false
                    eventArraysToProcess = []; pathsToProcess = []
                }
                
                if textFieldDisplayed {
                    self.resizeAndReloadForKeyboard()
                    self.calculateSizes()
                    
                    self.cellWidth = self.cellWd; self.cellHeight = self.cellHt
                    self.widthPlusSpace = self.cellWidth! + self.hSpace
                    self.heightPlusSpace = self.cellHeight! + self.vSpace
                }                                                                           //else {print("text field not displayed")}
                
                topVC.rePresentThenReload(vc: topVC)
                
                previousOrientation = currentOrientation //if !textFieldDisplayed {}
            }
        }
        else {
            if topVC.vcType == .hours {                                                     //print("prepare()") //, top vc \(top VC.vcType)...
                processCurrentDate()                                                        //; print("process date from prepare")
            }
        }
        
        
        if topVC.vcType == .hours {timetableVC.rePresentTextField()}
    }
    
    
    func resizeAndReloadForKeyboard() {                                                     //print("r")
        if timetableVC.downcastLayout!.autoFitHScale == 1 {
            if topVC.vcType == .hours {
                //if selectedTimeBlockPath[1] >= 18 {                                       //print("resizing h-scale")
                DispatchQueue.main.asyncAfter(deadline: .now()) {  //+ 0.5// [weak self] in
                    keyboardCellHeightMultiple = Int(keyboardHeight / timetableVC.downcastLayout!.cellHt)
                    
                    //print("\nkeyboard height: \(keyboardHeight) (\(keyboardCellHeightMultiple) cells tall)")
                    
                    let rows = self.rows
                    let gap = CGFloat(5) / (self.cellHt)                                    // extra gap for better aesthetics
                    self.autoFitHScale =
                        (CGFloat(rows - keyboardCellHeightMultiple) - gap) / CGFloat(rows)
                    //print("scale: \(self.autoFitHScale!)")
                    
                    topVC.reloadCV() ///topVC.reloadWithDelay(after: 0) //0.3
                }
                //self.autoFitHScale = 1
                //}
            }                                                                               //; print("[=1]")
        }                                                                                   //print("k")
        else {                                                                              //print("[≠1]")
//            if previousOrientation != currentOrientation {
                reloadsWhileResized += 1                                                    ; print(reloadsWhileResized)
                if reloadsWhileResized == 2 {
                    self.autoFitHScale = 1; reloadsWhileResized = 0//-1
//                    reloadForKeyboardRotation = true
//                    topVC.reloadCV() ///topVC.reloadWithDelay(after: 0) //0.3
//                    ///reloadForKeyboardRotation = false
                    
                    resizeAndReloadForKeyboard()                                            ; print("------------------r \(reloadsWhileResized)")
                }
//            }
        }
    }
}




//override func prepare() {                                                                       //print(".", terminator: "")
//
//        checkOrientation()
//
//        if textFieldDisplayed {
//            if timetableVC.downcastLayout!.autoFitHScale == 1 {
//                if topVC.vcType == .hours {
//                    if selectedTimeBlockPath[1] >= 18 {                                             //print("resizing h-scale")
//                        DispatchQueue.main.asyncAfter(deadline: .now()) {  //+ 0.5// [weak self] in
//                            keyboardCellHeightMultiple = Int(keyboardHeight / timetableVC.downcastLayout!.cellHt)
//
//                            //print("\nkeyboard height: \(keyboardHeight) (\(keyboardCellHeightMultiple) cells tall)")
//
//                            let rows = self.rows
//                            let gap = CGFloat(5) / (self.cellHt)                                    // extra gap for better aesthetics
//                            self.autoFitHScale =
//                                (CGFloat(rows - keyboardCellHeightMultiple) - gap) / CGFloat(rows)
//
//                            //print("scale: \(self.autoFitHScale!)")
//
//                            //topVC.reloadCV() //; print("reloaded after height change\n")
//                            topVC.reloadWithDelay(after: 0) //0.3
//                        }
////                        self.autoFitHScale = 1
//                    }
//                }                                                                                   //; print("[=1]")
//            }                                                                                       //print("k")
//            else {                                                                                  //print("[≠1]")
//                reloadsWhileResized += 1                                                            ; print(reloadsWhileResized)
//                if reloadsWhileResized == 3 {
//                    autoFitHScale = 1; reloadsWhileResized = 0
//                    topVC.reloadCV()                                                                ; print("------------------r")
//                    reloadsWhileResized = -1
//                }
//            }
//        }
//        //else {print("n")}
//
//        calculateSizes()
//
//        cellWidth = cellWd; cellHeight = cellHt
//        widthPlusSpace = cellWidth! + hSpace
//        heightPlusSpace = cellHeight! + vSpace
//
//        var statusBarDelta = 0.0
//        if UIApplication.shared.statusBarFrame.size.height > 20 {
//            statusBarDelta = Double(UIApplication.shared.statusBarFrame.size.height - 20)
//        }
//
//        yOffset = collectionView!.contentOffset.y + CGFloat(navBarHeight + statusBarHeight - statusBarDelta)  //print("yo: \(yOffSet)")
//        xOffSet = collectionView!.contentOffset.x
//        textFieldY = CGFloat(navBarHeight + statusBarHeight - statusBarDelta)                   //; print("textFieldY = \(textFieldY)")
//
//        //if embeddedInNavController {
//        if previousOrientation != currentOrientation {
//
//            DispatchQueue.main.asyncAfter(deadline: .now()) {
//                if eventArraysToProcess.count > 0 {
//                    savedTimeBlocksForProcessing = false
//                    eventArraysToProcess = []; pathsToProcess = []
//                }
//                topVC.rePresentThenReload(vc: topVC)
//            }
//        } else {
//            if topVC.vcType == .hours {                                                     //print("prepare()") //, top vc \(top VC.vcType)...
//                processCurrentDate()                                                        //; print("process date from prepare")
//            }
//        }
//        if topVC.vcType == .hours {timetableVC.rePresentTextField()}
//        //}
//    }
