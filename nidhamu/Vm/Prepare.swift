// Prepare          ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension CustomFlowLayout {
    
    override func prepare() {                                                               print(".", terminator: "")
        
        checkOrientation()

        calculateAndResetSizes()
        //keyboardScalor = 1
        
        var statusBarDelta = 0.0
        if UIApplication.shared.statusBarFrame.size.height > 20 {
            statusBarDelta = Double(UIApplication.shared.statusBarFrame.size.height - 20)
        }
        
        yOffset = collectionView!.contentOffset.y + CGFloat(navBarHeight + statusBarHeight - statusBarDelta)  //print("yo: \(yOffSet)")
        xOffSet = collectionView!.contentOffset.x
        textFieldY = CGFloat(navBarHeight + statusBarHeight - statusBarDelta)               //; print("textFieldY = \(textFieldY)")
        
        if previousOrientation != currentOrientation {
            //keyboardHeight = 0
            
//            DispatchQueue.main.asyncAfter(deadline: .now()) {
                
                if eventArraysToProcess.count > 0 {
                    savedTimeBlocksForProcessing = false
                    eventArraysToProcess = []; pathsToProcess = []
                }                                                                           //else {print("text field not displayed")}
                
                topVC.rePresentThenReload(vc: topVC)
                previousOrientation = currentOrientation ///if !textFieldDisplayed {}
//            }
        }
        else {
            if topVC.vcType == .hours {processCurrentDate()}
        }
        
        if topVC.vcType == .hours {topVC.rePresentTextField()}

    }
    
        func calculateAndResetSizes() {
            (cellWidth, cellHeight) = calculateSizes()
            
            resetDimensionIfSquareCellsEnabled()
            widthPlusSpace = cellWidth! + hSpace
            heightPlusSpace = cellHeight! + vSpace
        }
}

