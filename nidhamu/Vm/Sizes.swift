// Sizes            ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension CustomFlowLayout {
    
    override var collectionViewContentSize: CGSize {                                        //print("size = \(contentSize)")
        let w = CGFloat(cols) * widthPlusSpace
        let h = CGFloat(rows) * heightPlusSpace
        return CGSize(width: w, height: h)
    }
    
    func calculateSizes() -> (CGFloat, CGFloat) {                                           //print("resizing cells")
        var cellWd = CGFloat(0); var cellHt = CGFloat(0)
        
        statusBarHeight = Double(UIApplication.shared.statusBarFrame.size.height)           //; print("status bar: \(statusBarHeight)")
        navBarHeight = Double((navController?.navigationBar.frame.height)!)                 //; print("nav bar: \(navBarHeight)")
        
        var frame: CGRect
        if embeddedInNavController {
            frame = globalKeyWindow.frame
        }
        else {                                  //* In this app, the popup's frame is initialized by presentPopupViewToMarkEvents() anyway
            if let safeFrame = customFrame {
                frame = safeFrame
            } else {
                frame = nilCatcherFrame         //;print("\n\nit's the nil catcher frame, rows \(rows)")
            }                                   //* default frame is overridden anyway (see above comment); hence its initialization with all 0's
        }
        
        let autofitWidth = CGFloat(frame.width) / CGFloat(cols) - hSpace
        let autoFitHeight = CGFloat(Double(frame.height - keyboardHeight) - navBarHeight - statusBarHeight) / CGFloat(rows) - vSpace
        
        switch cellDimensionsMode {
            
        case .widthAndHeightHardcoded:  cellWd = cellWidth!;    cellHt = cellHeight! //* keyboardScalor
        case .widthHardcoded:           cellWd = cellWidth!;    cellHt = autoFitHeight * autoFitHScale! //* keyboardScalor
        case .heightHardcoded:          cellWd = autofitWidth * autoFitWScale!;     cellHt = cellHeight! //* keyboardScalor
        case .neitherHardcoded:         cellWd = autofitWidth * autoFitWScale!;     cellHt = autoFitHeight * autoFitHScale! //* keyboardScalor
            
        }
        
        return (cellWd, cellHt)
    }
}

