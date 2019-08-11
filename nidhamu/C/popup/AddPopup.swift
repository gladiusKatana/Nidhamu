// ShowPopup        ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension CollectionVC {
    
    func presentPopupViewToMarkEvents(column: Int, row: Int) {                   //print("-----------------")//print("presenting popup")
        
        if !classifierViewDisplayed {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {              //* 0.3s time delay works(ed) stably (thus far) on my iPhone 7
                
                classifierVC.view.removeFromSuperview()
                
                let layout = self.downcastLayout!;      let widthMultiplier = CGFloat(2)
                let cellWidth = layout.widthPlusSpace;  let cellHeight = layout.heightPlusSpace
                
                let classifierLayout = classifierVC.downcastLayout!
                classifierLayout.cellWidth = cellWidth * widthMultiplier;  classifierLayout.cellHeight = cellHeight
                
                let cols = CGFloat(classifierLayout.cols)
                var x = cellWidth * CGFloat(column + 1)
                var y = CGFloat(navBarHeight + statusBarHeight) + cellHeight * CGFloat(row)
                
                if column >= 6 {x = cellWidth * CGFloat(column - 2)}
                if row > 21 {y = CGFloat(navBarHeight + statusBarHeight) + cellHeight * CGFloat(row)}
                
                let frame = CGRect(x: x, y: y, width: cellWidth * cols * widthMultiplier, height: cellHeight * 5)
                classifierVC.downcastLayout?.customFrame = frame
                classifierVC.collectionView.frame = frame
                
                let hscale = timetableVC.downcastLayout!.autoFitHScale!           //* make sure this is extensible (ie,  if column >= 6 )
                classifierVC.collectionView?.scrollIndicatorInsets = UIEdgeInsets(top: classifierVC.downcastLayout!.cellHeight! * hscale,
                                                                                  left: 0, bottom: 0, right: 0)
                let keyWindow = UIApplication.shared.keyWindow!
                keyWindow.addSubview(classifierVC.view)                           //; print("----------------added popup")
                
                classifierViewDisplayed = true
                classifierVC.collectionView.isUserInteractionEnabled = true
                classifierVC.collectionView.reloadData()
                classifierVC.keepScrollIndicatorsVisible()
            }
        }
    }
}

