// AddPopup         ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension CollectionVC {
    
    func presentPopupViewToTagTasks(column: Int, row: Int) {               //print("-----------------")//print("presenting popup")
        
        if currentOrientation == "portrait" {AppUtility.lockOrientation(.portrait, andRotateTo: .portrait)}
        if currentOrientation == "landscape" {AppUtility.lockOrientation(.landscape, andRotateTo: .landscapeRight)}
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
            if !classifierViewDisplayed {
                
                let layout = self.downcastLayout!;                          let widthMultiplier = CGFloat(2)
                let cellWidth = layout.widthPlusSpace;                      let cellHeight = layout.heightPlusSpace
                let popupMenuLayout = taskTaggingViewController.downcastLayout!
                popupMenuLayout.cellWidth = cellWidth * widthMultiplier;    popupMenuLayout.cellHeight = cellHeight
                
                let cols = CGFloat(popupMenuLayout.cols)
                var x = cellWidth * CGFloat(column + 1)
                var y = CGFloat(navBarHeight + statusBarHeight) + cellHeight * CGFloat(row)
                let wid = cellWidth * cols * widthMultiplier
                
                if column >= 6 {x = cellWidth * CGFloat(column - 2)}
                if row > 22 {y = CGFloat(navBarHeight + statusBarHeight) + cellHeight * CGFloat(row)}
                
                let popupCollectionViewFrame = CGRect(x: x, y: y, width: wid, height: cellHeight * 5)
                taskTaggingViewController.downcastLayout?.customFrame = popupCollectionViewFrame
                taskTaggingViewController.collectionView.frame = popupCollectionViewFrame
                
                let hscale = timetableVC.downcastLayout!.autoFitHeightScale!     //* make sure this is extensible (ie,  if column >= 6 )
                taskTaggingViewController.collectionView?.scrollIndicatorInsets = UIEdgeInsets(top: taskTaggingViewController.downcastLayout!.cellHeight! * hscale,
                                                                                  left: 0, bottom: 0, right: 0)
                taskTaggingViewController.collectionView?.scrollToItem(at: IndexPath(row: 0, section: 0), at: .bottom, animated: false)
                taskTaggingViewController.collectionView.isUserInteractionEnabled = true
                
                let switchViewHeight = cellHeight * 4 //taskRecurringSwitchView.popupSwitch.frame.height + cellHeight * 2
                taskRecurringSwitchView = PopupSwitchView(frame:
                    CGRect(x: x, y: y + popupCollectionViewFrame.height,
                           width: wid, height: switchViewHeight))           ; taskRecurringSwitchView.backgroundColor = popupMenuLightGray
                
                timetableVC.view.addSubview(taskTaggingViewController.view)              //; print("----------------adding popup")
                timetableVC.view.addSubview(taskRecurringSwitchView)       //; print("adding switch")
                
                taskTaggingViewController.becomeFirstResponder()
                classifierViewDisplayed = true
                taskTaggingViewController.collectionView.reloadData()
                
                taskTaggingViewController.keepScrollIndicatorsVisible()
                self.addBorderAroundTimeBlockCurrentlyBeingMarked()
            }
        }
    }
}

