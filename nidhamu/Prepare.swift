// Prepare          ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension CustomFlowLayout {
    
    override func prepare() {                                                                   //print(".", terminator: "")
        
        checkOrientation()/**/
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
        
//        if previousOrientation != currentOrientation {
////            if classifierViewDisplayed {
//            
////                DispatchQueue.main.asyncAfter(deadline: .now()) {
//                
//                    classifierVC.view.removeFromSuperview()
//                    classifierViewDisplayed = false
//                    print("-----------------removed popup from prepare  added?\(classifierViewDisplayed)")
//                    
//                    let hscale = timetableVC.downcastLayout!.autoFitHScale!
//                    classifierVC.collectionView?.scrollIndicatorInsets = UIEdgeInsets(top: classifierVC.downcastLayout!.cellHeight! * hscale,
//                                                                                      left: 0, bottom: 0, right: 0)
//                    topVC.view.addSubview(classifierVC.view)
////                    classifierViewDisplayed = true
//                    print("-----------------re-added popup from prepare  added?\(classifierViewDisplayed)")
//                    
////                }
////            }
//        }
        
        
//        else {                                                                                   ///print("prepare()-popup")
////            if previousOrientation != currentOrientation {
//
//                if classifierViewDisplayed {                                                     ///print("prepare()-classifier")
////                    DispatchQueue.main.asyncAfter(deadline: .now()) {
//                        //timetableVC.resignFirstResponder()
//                        //classifierVC.becomeFirstResponder()
//
//                        classifierVC.view.removeFromSuperview()         ; print("-------------------------removed popup from prepare")
//
//                        let hscale = timetableVC.downcastLayout!.autoFitHScale!
//                        classifierVC.collectionView?.scrollIndicatorInsets = UIEdgeInsets(top: classifierVC.downcastLayout!.cellHeight! * hscale,
//                                                                                          left: 0, bottom: 0, right: 0)
//
//                        topVC.view.addSubview(classifierVC.view)        ; print("-------------------------re-added popup from prepare")
////                        timetableVC.popupReload()
////                    }
//                    classifierViewDisplayed = false
//                }
////            }
//        }
        
    }
}

/*
 if lastActiveOrientation == "landscape" && autorotateFromBackgroundThenForeground {     //print("(prepare()) can go back to landscape")
 AppUtility.lockOrientation(.landscapeRight, andRotateTo: .landscapeRight)
 autorotateFromBackgroundThenForeground = true
 }
 */

