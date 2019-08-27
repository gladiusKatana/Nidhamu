// AddPopup         ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension CollectionVC {
    
    func presentPopupViewToTagEvents(column: Int, row: Int) {                   //print("-----------------")//print("presenting popup")
        
//        DispatchQueue.main.asyncAfter(deadline: .now()) {
//            classifierVC.view.removeFromSuperview()                             ; print("----------------removed popup (auto)")
//            classifierViewDisplayed = false
//        }
        
//        classifierVC.view.removeFromSuperview()
//        classifierViewDisplayed = false
        
        if !classifierViewDisplayed {
            
//            DispatchQueue.main.asyncAfter(deadline: .now()) {
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
//            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {  //0.5      //* 0.3s time delay works(ed) stably (thus far) on my iPhone 7
            
//                classifierViewDisplayed = true
            
//                let keyWindow = UIApplication.shared.keyWindow!
//                globalKeyWindow.addSubview(classifierVC.view)                     //; print("----------------added popup")
                
                timetableVC.view.addSubview(classifierVC.view)                      //; print("----------------added popup")
                classifierViewDisplayed = true
                
                classifierVC.collectionView.isUserInteractionEnabled = true
                classifierVC.collectionView.reloadData()
                classifierVC.keepScrollIndicatorsVisible()
            }
        }
        //else {print("menu already displayed")}
    }
}
