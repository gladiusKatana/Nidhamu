// TapPopup         ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension PopupMenuVC {
    
    override func collectionView(_ collectionView: UICollectionView,
                                 didSelectItemAt indexPath: IndexPath) {
        
        let cell = collectionView.cellForItem(at: indexPath) as! CustomCell
        cell.backgroundColor = taskAddingColour
        
        let layout = downcastLayout!; let row = indexPath.item; let column = indexPath.section
        
        if row >= layout.lockedHeaderRows && column >= layout.lockedHeaderSections {
            
            guard let firstPathToProcess = indexPathsToProcess.first else {print("no paths to process... even though popup was presented"); return}
            
            let clm = firstPathToProcess[0];  let rw = firstPathToProcess[1]    /// components of path of current item being marked
            var taskWillShowUpNextWeek = false
            
            if let tasksOfBlockBeingTagged = tasksAtIndexPath[TimeBlock(values:(clm, rw))] {  /// writing to the dictionary
                
                let selectedStatus = TaskStatus(rawValue: row)
                let taskBeingTagged = tasksOfBlockBeingTagged[taskIndex]
                
                tasksOfBlockBeingTagged[taskIndex].taskStatus = selectedStatus! ///; print("tagged as: \(casename)\n")
                
                if [TaskStatus.upcoming].contains(selectedStatus)
                    || selectedTaskWillRecur {
                    taskWillShowUpNextWeek = true
                }
                
                if taskWillShowUpNextWeek {
                    if selectedTaskWillRecur {
                        addToArchives(taskBeingTagged)
                        taskBeingTagged.deadline += TimeInterval(86400 * 7)
                    }
                } else {
                    addToArchives(taskBeingTagged)
                }
                
                if selectedStatus == .deferred { /// if task is deferred, but also marked recurring, recurring has no additional effect: task shows up just once next week, not twice
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                        timetableVC.setNavBarTitle(customString: nil) /// call it on any of the CollectionVCs
                        
                        tempRescalingBool = true
                        deferralVC.downcastLayout?.autoFitHeightScale = timetableVC.downcastLayout?.autoFitHeightScale
                        /// print("rescaled to \(deferralVC.downcastLayout?.autoFitHeightScale), tt scale is \(timetableVC.downcastLayout?.autoFitHeightScale)")
                        timetableVC.gotoView(vc: deferralVC)
                        tempRescalingBool = false
                        deferredDescription = globalTaskIdentifier
                    }
                }
                
                updateBlockProcessingVariables(column: clm, row: rw, taskWillShowUpNextWeek: taskWillShowUpNextWeek, selectedStatus: selectedStatus!)
            } else {print("no task in dictionary at that index path")}
        } else {print("selected popup menu header")}
    }
}

