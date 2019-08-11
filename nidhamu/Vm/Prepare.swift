// Prepare          ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension CustomFlowLayout {
    
    override func prepare() {                                                                   //print(".", terminator: "")
        
        checkOrientation()
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
        
        if embeddedInNavController {
            if previousOrientation != currentOrientation {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                    topVC.re_Reload__PossiblyAfterRe_Presenting(vc: topVC)
                }
                
                classifierVC.view.removeFromSuperview()                                         //; print("removed popup")
                if classifierViewDisplayed {classifierViewDisplayed = false}
            }
            else {
                if topVC.vcType == .hours {                                                     //print("prepare()") //, top vc \(top VC.vcType)...
                    processCurrentDate()                                                        //; print("process date from prepare")
                }
            }
            
            if topVC.vcType == .hours {
                topVC.rePresentTextField()                                                      //; print("re-presented text field from prepare()")
            }
        }
    }
}

