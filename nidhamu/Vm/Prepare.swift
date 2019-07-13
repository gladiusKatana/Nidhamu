//  Prepare.swift
//  nidhamu  ∙  1st commit July. 08, 2019  ∙  Created by Garth Snyder, aka gladiusKatana ⚔️
import UIKit

extension CustomFlowLayout {
    
    override func prepare() {
        
        calculateSizes()
        cellWidth = cellWd; cellHeight = cellHt
        
        widthPlusSpace = cellWidth! + hSpace
        heightPlusSpace = cellHeight! + vSpace
        
        var statusBarDelta = 0.0
        if UIApplication.shared.statusBarFrame.size.height > 20 {
            statusBarDelta = Double(UIApplication.shared.statusBarFrame.size.height - 20)
        }
        
        yOffset = collectionView!.contentOffset.y + CGFloat(navBarHeight + statusBarHeight - statusBarDelta)    //print("yo: \(yOffSet)")
        xOffSet = collectionView!.contentOffset.x
        textFieldY = CGFloat(navBarHeight + statusBarHeight - statusBarDelta)               //; print("textFieldY = \(textFieldY)")
        
        checkOrientation()
        
        print("---------------------prepare \(topVC.vcType)-cv")
        //print("---------------------prepare \(topVC.vcType)-cv)    \n                     cell width: \(cellWidth!)\n                     nav bar height: \(navBarHeight)")
        
        if previousOrientation != currentOrientation {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) { //0.2
                topVC.reloadAfterVCIsPossiblyPresentedAgainFromCallToPrepare(vc: topVC)
            }
        }
        else {
            if topVC.vcType == .hours {
                processCurrentDate()                                                        //; print("process date from prepare")
            }
        }
        
        if topVC.vcType == .hours {
            topVC.rePresentTextField()
        }
    }
}

