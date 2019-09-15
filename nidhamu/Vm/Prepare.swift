// Prepare          ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension CustomFlowLayout {
    
    override func prepare() {                                                               print(".", terminator: "")
        
        checkOrientation()
        
        if previousOrientation == currentOrientation {
            if textFieldDisplayed {
                if firstReloadForKeyboard {
                    resizeAndReloadForKeyboard()
                    firstReloadForKeyboard = false
                }
            }
        }
        
        calculateAndResetSizes()
        
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
                    self.calculateAndResetSizes()
                }                                                                           //else {print("text field not displayed")}
                
//                topVC.rePresentThenReload(vc: topVC)  // not needed (anymore) for cell auto-fitting, but makes for visually smoother rotations
                previousOrientation = currentOrientation ///if !textFieldDisplayed {}
            }
        }
        else {if topVC.vcType == .hours {processCurrentDate()}}
        
        if topVC.vcType == .hours {timetableVC.rePresentTextField()}
    }
}

