// Prepare          ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension CustomFlowLayout {
    
    override func prepare() {                                                               //print(".", terminator: "")
        
        checkOrientation()
        calculateAndResetSizes()
        
        if previousOrientation != currentOrientation {
            previousOrientation = currentOrientation
            
//            if eventArraysToProcess.count > 0 {
//                saved TimeBlocksForProcessing = false
//                eventArraysToProcess = []; pathsToProcess = []
//            }
            
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
        
        if !embeddedInNavController {           //print("setting sizes for popup")
            compensateForNavigationAndStatusBars(forCollectionVC: classifierVC, withDelta: 0)
        }
        else {
            var statusBarDelta = 0.0
            if UIApplication.shared.statusBarFrame.size.height > 20 {
                statusBarDelta = Double(UIApplication.shared.statusBarFrame.size.height - 20)
            }
            compensateForNavigationAndStatusBars(forCollectionVC: topVC, withDelta: statusBarDelta)
        }
    }
    
    func compensateForNavigationAndStatusBars(forCollectionVC collectVC: UICollectionViewController, withDelta delta: Double) {
        yOffset = collectVC.collectionView!.contentOffset.y + CGFloat(navBarHeight + statusBarHeight - delta)  //print("yo: \(yOffSet)")
        textFieldY = CGFloat(navBarHeight + statusBarHeight - delta)               //; print("textFieldY = \(textFieldY)")
        xOffSet = collectVC.collectionView!.contentOffset.x
    }
}

