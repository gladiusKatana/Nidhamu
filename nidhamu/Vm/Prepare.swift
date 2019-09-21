// Prepare          ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension CustomFlowLayout {
    
    override func prepare() {                                                               //print(".", terminator: "")

        checkOrientation()
        calculateAndResetSizes()
        
        if previousOrientation != currentOrientation {                                      //print("prepare(rotated to \(currentOrientation)):")
            
            UIApplication.shared.keyWindow!.backgroundColor = iosKeyboardDefaultColourApprox
            
            if textFieldDisplayed {
                if firstPortraitKeyboardPresented && currentOrientation == "portrait" {
                    keyboardHeight = portraitKeyboardHeight                                 // will probably cache these...
//                    textFieldHeight = portraitTextFieldHeight
//                    textFieldHeight = 3 * cellHeight!
                }                                                                           //...device-and-orientation-specific heights...
                if firstLandscapeKeyboardPresented && currentOrientation == "landscape" {   //...inside UserDefaults, saving them for next launch
                    keyboardHeight = landscapeKeyboardHeight
//                    textFieldHeight = landscapeTextFieldHeight
//                    textFieldHeight = 3 * cellHeight!
                }
            }
            
            previousOrientation = currentOrientation
            
            topVC.setupTitleAndPresentViewController(vc: topVC) { () -> () in
                rePresentedVCManually = false
            }
            
        } else {if topVC.vcType == .hours {processCurrentDate()}}
        
        if textFieldDisplayed && topVC.vcType == .hours {topVC.rePresentTextField()}
    }
    
    func calculateAndResetSizes() {
        (cellWidth, cellHeight) = calculateSizes()
        resetDimensionIfSquareCellsEnabled()
        
////        textFieldHeight = 3 * cellHeight!;  textFieldWidth = 6 * cellWidth!
//        if textFieldDisplayed {textFieldHeight = 3 * cellHeight!;  textFieldWidth = 6 * cellWidth!}
//        else {textFieldHeight = 0;  textFieldWidth = 0}
        
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
        
        //textFieldY = CGFloat(navBarHeight + statusBarHeight - delta) // at-top of screen
        textFieldY = UIApplication.shared.keyWindow!.frame.height - keyboardHeight //- textFieldHeight // shows just above keyboard
        //; print("textFieldY = \(textFieldY)")
        
        xOffSet = collectVC.collectionView!.contentOffset.x
    }
}

