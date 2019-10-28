// Prepare          ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension CustomFlowLayout {
    
    override func prepare() {                                                               //print(".", terminator: "")
        
        checkOrientation()
        resetKeyboardHeight()
        calculateAndResetSizes()
        
        if previousOrientation != currentOrientation {                                      //print("prepare(rotated to \(currentOrientation)):")
            
            if textFieldDisplayed {
                globalWindow.backgroundColor = iosKeyboardDefaultColourApprox
                backgroundVC.view.backgroundColor = globalWindow.backgroundColor
            }
            
            previousOrientation = currentOrientation
            
            topVC.setupTitleAndPresentViewController(vc: topVC) { () -> () in
                ///(empty; may remove the completion handler from this method)
            }
            
        } else {if topVC.vcType == .hours {processCurrentDate()}}
        
        if textFieldDisplayed {
            topVC.rePresentTextField()
            if topVC.vcType == .todoList {topVC.reloadWithDelay(after: 0)}
        }
    }
    
    func calculateAndResetSizes() {
        (cellWidth, cellHeight) = calculateSizes(); resetDimensionIfSquareCellsEnabled()
        widthPlusSpace = cellWidth! + hSpace;       heightPlusSpace = cellHeight! + vSpace
        
        if !embeddedInNavController {compensateForNavigationAndStatusBars(forCollectionVC: taskTaggingViewController, withDelta: 0)}
        else {
            var statusBarDelta = 0.0
            let statusBarTestHeight = (globalWindow.windowScene?.statusBarManager!.statusBarFrame)!.height
            if statusBarTestHeight > 20 {
                statusBarDelta = Double(statusBarTestHeight - 20)
            }
            
            compensateForNavigationAndStatusBars(forCollectionVC: topVC, withDelta: statusBarDelta)
        }
    }
    
    func compensateForNavigationAndStatusBars(forCollectionVC collectVC: UICollectionViewController, withDelta delta: Double) {
        yOffset = collectVC.collectionView!.contentOffset.y + CGFloat(navBarHeight + statusBarHeight - delta)  //print("yo: \(yOffSet)")
        textFieldY = globalWindow.frame.height - keyboardHeight //- textFieldHeight // shows just above keyboard
        xOffSet = collectVC.collectionView!.contentOffset.x
    }
}

