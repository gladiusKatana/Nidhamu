// Prepare          ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension CustomFlowLayout {
    
    override func prepare() {                                                               //print("◆", terminator: "")
        
        checkOrientation()
        resetKeyboardHeight()
        calculateAndResetSizes()
        
        if previousOrientation != currentOrientation {                                      //print("prepare(rotated to \(currentOrientation)):")
            previousOrientation = currentOrientation
            
            topVC.setupTitleAndPresentViewController(vc: topVC) { () -> () in
                topVC.reloadCV() /// only really useful for cell font size readjustment upon rotations / other layout scaling changes
            }
            
        } else {if topVC.viewControllerType == .timetable {processCurrentDate()}}
        
        if textFieldDisplayed {
            topVC.rePresentTextField()
            if topVC.viewControllerType == .taskList {topVC.reloadCollectionViewAfterDelay(0)}
        }
    }
    
    func calculateAndResetSizes() {
        (cellWidth, cellHeight) = calculateSizes(); resetDimensionIfSquareCellsEnabled()
        widthPlusSpace = cellWidth! + hSpace;       heightPlusSpace = cellHeight! + vSpace
        currentCellWidth = cellWidth;               currentCellHeight = cellHeight
        
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
