// AddPopup         ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension CollectionVC {
    
    func presentPopupViewToTagEvents(column: Int, row: Int) {               //print("-----------------")//print("presenting popup")
        
        AppUtility.lockOrientation(.portrait)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
            if !classifierViewDisplayed {
                
                let layout = self.downcastLayout!;                          let widthMultiplier = CGFloat(2)
                let cellWidth = layout.widthPlusSpace;                      let cellHeight = layout.heightPlusSpace
                let popupMenuLayout = classifierVC.downcastLayout!
                popupMenuLayout.cellWidth = cellWidth * widthMultiplier;    popupMenuLayout.cellHeight = cellHeight
                
                let cols = CGFloat(popupMenuLayout.cols)
                var x = cellWidth * CGFloat(column + 1)
                var y = CGFloat(navBarHeight + statusBarHeight) + cellHeight * CGFloat(row)
                let wid = cellWidth * cols * widthMultiplier
                
                if column >= 6 {x = cellWidth * CGFloat(column - 2)}
                if row > 22 {y = CGFloat(navBarHeight + statusBarHeight) + cellHeight * CGFloat(row)}
                
                let popupCollectionViewFrame = CGRect(x: x, y: y, width: wid, height: cellHeight * 5)
                classifierVC.downcastLayout?.customFrame = popupCollectionViewFrame
                classifierVC.collectionView.frame = popupCollectionViewFrame
                
                let hscale = timetableVC.downcastLayout!.autoFitHScale!             //* make sure this is extensible (ie,  if column >= 6 )
                classifierVC.collectionView?.scrollIndicatorInsets = UIEdgeInsets(top: classifierVC.downcastLayout!.cellHeight! * hscale,
                                                                                  left: 0, bottom: 0, right: 0)
                classifierVC.collectionView?.scrollToItem(at: IndexPath(row: 0, section: 0), at: .bottom, animated: false)
                classifierVC.collectionView.isUserInteractionEnabled = true
                
                let switchViewHeight = cellHeight * 4 //eventRecurringSwitchView.popupSwitch.frame.height + cellHeight * 2
                eventRecurringSwitchView = PopupSwitchView(frame:
                    CGRect(x: x, y: y + popupCollectionViewFrame.height,
                           width: wid, height: switchViewHeight))           ; eventRecurringSwitchView.backgroundColor = headerColour
                
                timetableVC.view.addSubview(classifierVC.view)              //; print("----------------adding popup")
                timetableVC.view.addSubview(eventRecurringSwitchView)       //; print("adding switch")
                
                classifierVC.becomeFirstResponder()
                classifierViewDisplayed = true
                classifierVC.collectionView.reloadData()
                
                classifierVC.keepScrollIndicatorsVisible()
                self.addBorderAroundTimeBlockCurrentlyBeingMarked()
            }
        }
    }
}

