// AddPopup         ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension CollectionVC {
    
    func presentPopupViewToTagEvents(column: Int, row: Int) {           //print("-----------------")//print("presenting popup")
        
//        DispatchQueue.main.asyncAfter(deadline: .now()) {
//            classifierVC.view.removeFromSuperview()
//            classifierViewDisplayed = false
//        }
        
        //if !classifierViewDisplayed {
        
        AppUtility.lockOrientation(.portrait)
        
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            let layout = self.downcastLayout!;      let widthMultiplier = CGFloat(2)
            let cellWidth = layout.widthPlusSpace;  let cellHeight = layout.heightPlusSpace
            
            let popupMenuLayout = classifierVC.downcastLayout!
            popupMenuLayout.cellWidth = cellWidth * widthMultiplier;  popupMenuLayout.cellHeight = cellHeight
            
            let cols = CGFloat(popupMenuLayout.cols)
            var x = cellWidth * CGFloat(column + 1)
            var y = CGFloat(navBarHeight + statusBarHeight) + cellHeight * CGFloat(row)
            
            if column >= 6 {x = cellWidth * CGFloat(column - 2)}
            if row > 21 {y = CGFloat(navBarHeight + statusBarHeight) + cellHeight * CGFloat(row)}
            
            let frame = CGRect(x: x, y: y, width: cellWidth * cols * widthMultiplier, height: cellHeight * 5)
            classifierVC.downcastLayout?.customFrame = frame
            classifierVC.collectionView.frame = frame
            
            let hscale = timetableVC.downcastLayout!.autoFitHScale!     //* make sure this is extensible (ie,  if column >= 6 )
            classifierVC.collectionView?.scrollIndicatorInsets = UIEdgeInsets(top: classifierVC.downcastLayout!.cellHeight! * hscale,
                                                                              left: 0, bottom: 0, right: 0)
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            classifierVC.collectionView.isUserInteractionEnabled = true
            
            //timetableVC.view.addSubview(classifierVC.view)            ///; print("----------------added popup")
            globalKeyWindow.addSubview(classifierVC.view)               //; print("----------------added popup")
            
            classifierVC.becomeFirstResponder()
            classifierViewDisplayed = true
            
            classifierVC.collectionView.reloadData()
            classifierVC.keepScrollIndicatorsVisible()
        }
        
        //} else {print("popup menu already displayed")}
    }
}

