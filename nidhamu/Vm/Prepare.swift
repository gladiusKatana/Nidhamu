// Prepare          ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension CustomFlowLayout {
    
    override func prepare() {                                                               //print(".", terminator: "")
        
        checkOrientation()
        calculateAndResetSizes()
        
        if previousOrientation != currentOrientation {                                      //print("prepare(rotated to \(currentOrientation)):")
            
            if textFieldDisplayed {
                UIApplication.shared.keyWindow!.backgroundColor = iosKeyboardDefaultColourApprox
                if firstPortraitKeyboardPresented && currentOrientation == "portrait" {
                    keyboardHeight = portraitKeyboardHeight                                 // will probably cache these...
                }                                                                           //...device-and-orientation-specific heights...
                if firstLandscapeKeyboardPresented && currentOrientation == "landscape" {   //...inside UserDefaults, saving them for next launch
                    keyboardHeight = landscapeKeyboardHeight
                }
            }
            
            previousOrientation = currentOrientation
            
            topVC.setupTitleAndPresentViewController(vc: topVC) { () -> () in
                rePresentedVCManually = false
                //topVC.reloadCV()
            }
            
        } else {if topVC.vcType == .hours {processCurrentDate()}}
        
        if textFieldDisplayed {
            topVC.rePresentTextField()
            if topVC.vcType == .todoList {
                DispatchQueue.main.asyncAfter(deadline: .now()) {topVC.reloadCV()}
            }
        }
    }
    
    func calculateAndResetSizes() {
        (cellWidth, cellHeight) = calculateSizes(); resetDimensionIfSquareCellsEnabled()
        widthPlusSpace = cellWidth! + hSpace;       heightPlusSpace = cellHeight! + vSpace
        
        if !embeddedInNavController {compensateForNavigationAndStatusBars(forCollectionVC: classifierVC, withDelta: 0)}
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
        textFieldY = UIApplication.shared.keyWindow!.frame.height - keyboardHeight //- textFieldHeight // shows just above keyboard
        xOffSet = collectVC.collectionView!.contentOffset.x
    }
}

