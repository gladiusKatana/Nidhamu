// Sizes            ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension CustomFlowLayout {
    
    override var collectionViewContentSize: CGSize {                                    //print("size = \(contentSize)")
        let w = CGFloat(cols) * widthPlusSpace
        let h = CGFloat(rows) * heightPlusSpace
        return CGSize(width: w, height: h)
    }
    
    func calculateSizes() -> (CGFloat, CGFloat) {                                       //print("resizing cells")
        
        var cellWd = CGFloat(0); var cellHt = CGFloat(0)
        navBarHeight = Double((navController?.navigationBar.frame.height)!)             //; print("nav bar: \(navBarHeight)")
        statusBarHeight = Double((globalWindow.windowScene?.statusBarManager!.statusBarFrame)!.height)///Double(UIApplication.shared.statusBarFrame.size.height)
        
        var frame: CGRect
        if embeddedInNavController {
            frame = globalWindow.frame
        }
        else {
            if let safeFrame = customFrame {
                frame = safeFrame
            } else {
                frame = zeroFrame                                                       //;print("\n\nit's the nil catcher frame, rows \(rows)")
            } //* default frame is overridden anyway (see above comment); hence its initialization with all 0's
        }
        
        let gap = CGFloat(1) /// extra gap for better aesthetics
        let autofitWidth = CGFloat(frame.width) / CGFloat(cols) - hSpace
        let barsHeight = navBarHeight + statusBarHeight
        let autoFitHeight = CGFloat(Double(frame.height - keyboardHeight /*- textFieldHeight*/ - gap) - barsHeight) / CGFloat(rows) - vSpace
        
        switch cellDimensionsMode {
        case .widthAndHeightHardcoded:  cellWd = cellWidth!;                        cellHt = cellHeight!
        case .widthHardcoded:           cellWd = cellWidth!;                        cellHt = autoFitHeight * autoFitHeightScale!
        case .heightHardcoded:          cellWd = autofitWidth * autoFitWScale!;     cellHt = cellHeight!
        case .neitherHardcoded:         cellWd = autofitWidth * autoFitWScale!;     cellHt = autoFitHeight * autoFitHeightScale!
        }
        
        return (cellWd, cellHt)
    }
}

