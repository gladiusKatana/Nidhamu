// Prepare          ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension CustomFlowLayout {
    
    override func prepare() {                                                               //print(".", terminator: "")
        
        checkOrientation()
        calculateAndResetSizes()
        
        if previousOrientation != currentOrientation {
            previousOrientation = currentOrientation
            
            if eventArraysToProcess.count > 0 {
                savedTimeBlocksForProcessing = false
                eventArraysToProcess = []; pathsToProcess = []
            }
            
            topVC.setupTitleAndPresentViewController(vc: topVC) { () -> () in
                rePresentedVCManually = false
            }
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
        
        var statusBarDelta = 0.0
        if !embeddedInNavController {           //print("setting sizes for popup")
            statusBarDelta = 0
            
            yOffset = classifierVC.collectionView!.contentOffset.y + CGFloat(navBarHeight + statusBarHeight - statusBarDelta)
            xOffSet = classifierVC.collectionView!.contentOffset.x
            textFieldY = CGFloat(navBarHeight + statusBarHeight - statusBarDelta)               //; print("textFieldY = \(textFieldY)")
        }
        else {
            if UIApplication.shared.statusBarFrame.size.height > 20 {
                statusBarDelta = Double(UIApplication.shared.statusBarFrame.size.height - 20)
            }
            
            yOffset = topVC.collectionView!.contentOffset.y + CGFloat(navBarHeight + statusBarHeight - statusBarDelta)  //print("yo: \(yOffSet)")
            xOffSet = topVC.collectionView!.contentOffset.x
            textFieldY = CGFloat(navBarHeight + statusBarHeight - statusBarDelta)               //; print("textFieldY = \(textFieldY)")
        }
    }
}

