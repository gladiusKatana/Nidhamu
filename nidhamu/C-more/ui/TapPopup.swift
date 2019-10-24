// TapPopup         ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension PopupMenuVC {
    
    override func collectionView(_ collectionView: UICollectionView,
                                 didSelectItemAt indexPath: IndexPath) {
        
        let cell = collectionView.cellForItem(at: indexPath) as! CustomCell
        let layout = downcastLayout!; let row = indexPath.item; let column = indexPath.section
        cell.backgroundColor = eventAddingColour
        
        if row >= layout.lockedHeaderRows && column >= layout.lockedHeaderSections {
            
            guard let firstPathToProcess = pathsToProcess.first else {print("no paths to process... even though popup was presented"); return}
            
            let clm = firstPathToProcess[0];  let rw = firstPathToProcess[1]    /// components of path of current item being marked
            var eventWillShowUpNextWeek = false
            
            if let eventsOfBlockBeingTagged = eventsAtIndexPath[TimeBlock(values:(clm, rw))] {  /// writing to the dictionary
                
                let selectedStatus = EventStatus(rawValue: row)
                let eventBeingTagged = eventsOfBlockBeingTagged[eventIndex]
                
                eventsOfBlockBeingTagged[eventIndex].eventStatus = selectedStatus!
                
                if [EventStatus.deferred, EventStatus.upcoming].contains(selectedStatus) {
                    eventWillShowUpNextWeek = true
                }
                
                if !eventWillShowUpNextWeek {addToArchives(eventBeingTagged)}
                else {
                    if selectedStatus == .deferred {
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                            timetableVC.setNavBarTitle(customString: nil) /// call it on any of the CollectionVCs
                            
                            tempGotoAnimationBool = true
                            deferralVC.downcastLayout?.autoFitHScale = timetableVC.downcastLayout?.autoFitHScale
                            ///print("rescaled to \(deferralVC.downcastLayout?.autoFitHScale), tt scale is \(timetableVC.downcastLayout?.autoFitHScale)")
                            timetableVC.gotoView(vc: deferralVC)
                            tempGotoAnimationBool = false
                            
                            eventsAtIndexPath.remove(at: eventsAtIndexPath.index(forKey: TimeBlock(values:(clm, rw)))!)
                            deferredDescription = globalEventIdentifier
                        }
                    }
                }
                
                updateBlockProcessingVariables(column: clm, row: rw, eventWillShowUpNextWeek: eventWillShowUpNextWeek)
                ///dismissPopupMenuAndSave()
            }
        } else {print("selected popup menu header")}
    }
}

