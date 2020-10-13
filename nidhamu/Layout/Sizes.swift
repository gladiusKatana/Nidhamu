// Sizes            ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension CustomFlowLayout {
    
    override var collectionViewContentSize: CGSize {                            //print("size = \(contentSize)")
        let w = CGFloat(cols) * widthPlusSpace
        let h = CGFloat(rows) * heightPlusSpace
        return CGSize(width: w, height: h)
    }
    
    func calculateSizes() -> (CGFloat, CGFloat) {                               //print("resizing cells")
        
        var cellWd = CGFloat(0); var cellHt = CGFloat(0)
        navBarHeight = Double((navController?.navigationBar.frame.height)!)     //; print("nav bar: \(navBarHeight)")
        statusBarHeight = Double((globalWindow.windowScene?.statusBarManager!.statusBarFrame)!.height)///Double(UIApplication.shared.statusBarFrame.size.height)
        
        var frame: CGRect
        if embeddedInNavController {
            frame = globalWindow.frame
        }
        else {
            if let safeFrame = customFrame {
                frame = safeFrame
            } else {
                frame = zeroFrame                                               //;print("\n\nit's the nil catcher frame, rows \(rows)")
            } //* default frame is overridden anyway (see above comment); hence its initialization with all 0's
        }
        
        let del = modelName == "iPhone12,5" ? CGFloat(85 - 30) : CGFloat(0)
        let gap = CGFloat(7) /// extra gap for better aesthetics
        let barsHeight = navBarHeight + statusBarHeight
        
        let autofitWidth = frame.width / CGFloat(cols) - hSpace
        let h = frame.height - keyboardHeight - del/*- textFieldHeight*/ - gap
        let autoFitHeight = (h - CGFloat(barsHeight)) / CGFloat(rows) - vSpace
        
        switch cellDimensionsMode {
        case .widthAndHeightHardcoded:  cellWd = cellWidth!;                        cellHt = cellHeight!
        case .widthHardcoded:           cellWd = cellWidth!;                        cellHt = autoFitHeight * autoFitHeightScale!
        case .heightHardcoded:          cellWd = autofitWidth * autoFitWScale!;     cellHt = cellHeight!
        case .neitherHardcoded:         cellWd = autofitWidth * autoFitWScale!;     cellHt = autoFitHeight * autoFitHeightScale!
        }
        
        return (cellWd, cellHt)
    }
}

