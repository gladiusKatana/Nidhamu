// AddPopup         ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension CollectionVC {
    
    func presentPopupViewToTagTasks(column: Int, row: Int) {                    ///print("-----------------")//print("presenting popup")
        
        //if currentOrientation == "portrait" {
        AppUtility.lockOrientation(.portrait, andRotateTo: .portrait)
        //}
        //if currentOrientation == "landscape" {AppUtility.lockOrientation(.landscape, andRotateTo: .landscapeRight)}
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
            if !taggingViewDisplayed {
//                print("presenting tagging view, \(indexPathsToProcess.count) path(s) to process")
                let layout = self.downcastLayout!
                let popupMenuLayout = taskTaggingViewController.downcastLayout!
                
                let headerRows = layout.lockedHeaderRows
                let cols = CGFloat(popupMenuLayout.cols)
                
                let widthFactor = CGFloat(2)
                let cellHeight = layout.heightPlusSpace;    let cellWidth = layout.widthPlusSpace;
                popupMenuLayout.cellHeight = cellHeight;    popupMenuLayout.cellWidth = cellWidth * widthFactor
                
                var x = cellWidth * CGFloat(column + 1)
                
                let yO = CGFloat(navBarHeight + statusBarHeight) + cellHeight * CGFloat(headerRows - 1) * headerHeightFactor
                var y = yO + cellHeight * CGFloat(row - headerRows) * cellHeightFactor
                
                if column >= 6 {x = cellWidth * CGFloat(column - 2)}
                if row > 22 {y = CGFloat(navBarHeight + statusBarHeight) + cellHeight * CGFloat(row)}
                
                let heightFactor = timeBlockSize == 1 ? CGFloat(taskTaggingLayout.rows) : cellHeightFactor + headerHeightFactor
                let popupFrameHeight = cellHeight * heightFactor
                let popupCollectionViewFrame = CGRect(x: x, y: y, width: cellWidth * cols * widthFactor, height: popupFrameHeight)
                taskTaggingViewController.downcastLayout?.customFrame = popupCollectionViewFrame
                taskTaggingViewController.collectionView.frame = popupCollectionViewFrame
                
                let hscale = timetableVC.downcastLayout!.autoFitHeightScale!     //* make sure this is extensible (ie,  if column >= 6 )
                taskTaggingViewController.collectionView?.scrollIndicatorInsets =
                    UIEdgeInsets(top: taskTaggingViewController.downcastLayout!.cellHeight! * hscale, left: 0, bottom: 0, right: 0)
                taskTaggingViewController.collectionView?.scrollToItem(at: IndexPath(row: 0, section: 0), at: .bottom, animated: false)
                taskTaggingViewController.collectionView.isUserInteractionEnabled = true
                
                let switchViewHeight = cellHeight * cellHeightFactor / CGFloat(timeBlockSize) * 3
                taskRecurringSwitchView = PopupSwitchView(frame: CGRect(x: x, y: y + popupCollectionViewFrame.height,
                                                                        width: cellWidth * widthFactor, height: switchViewHeight))
                taskRecurringSwitchView.backgroundColor = popupMenuLightGray
                
                timetableVC.view.addSubview(taskTaggingViewController.view)     //; print("----------------adding popup")
                timetableVC.view.addSubview(taskRecurringSwitchView)            //; print("adding switch")
                
//                taskTaggingViewController.becomeFirstResponder()
                taggingViewDisplayed = true
                taskTaggingViewController.collectionView.reloadData()
                
                ///taskTaggingViewController.keepScrollIndicatorsVisible()
                self.addBorderAroundTimeBlockCurrentlyBeingMarked()
                self.reloadCV()                                     //; print("----------------reloading, from presentPopupViewToTagTasks()")
                //pryntTaskTaggingVariables
            }
        }
    }
}

