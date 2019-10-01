// TapPopup         ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension PopupMenuVC {
    
    override func collectionView(_ collectionView: UICollectionView,
                                 didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! CustomCell
        let layout = downcastLayout!; let row = indexPath.item; let column = indexPath.section
        cell.backgroundColor = eventAddingColour
        
        if row >= layout.lockedHeaderRows && column >= layout.lockedHeaderSections {
            
            guard let firstPathToProcess = pathsToProcess.first else { print("no paths to process... even though popup was presented"); return}
            let cl = firstPathToProcess[0];  let rw = firstPathToProcess[1]    /// components of path of current item being marked
            
            if let eventsOfBlockBeingTagged = eventsAtIndexPath[TimeBlock(values:(cl, rw))] {  /// writing to the dictionary
                
                let selectedStatus = EventStatus(rawValue: row - 1)
                eventsOfBlockBeingTagged[eventIndex].eventStatus = selectedStatus!
                
                if [EventStatus.deferred, EventStatus.upcoming].contains(selectedStatus)
                    || selectedEventWillRecur
                {
                    ///eventsOfBlockBeingTagged[eventIndex].eventStatus = .upcoming
                    eventsOfBlockBeingTagged[eventIndex].eventDate += TimeInterval(86400 * 7)
                }
                else {
                    let (year, monthInt, _, _ , day, _, _, hour, _, _) = getChosenDateComponents(eventsOfBlockBeingTagged[eventIndex].eventDate, roundedDown: false)
                    let archiveBlockToAdd = ArchiveBlock(values: (year, monthInt, day, hour))
                    
                    if eventsAtDate[archiveBlockToAdd] != nil {
                        eventsAtDate[archiveBlockToAdd]!.append(eventsOfBlockBeingTagged[eventIndex])
                    } else {
                        eventsAtDate[archiveBlockToAdd] = [eventsOfBlockBeingTagged[eventIndex]]
                    }
                    
                    let archives = eventsAtDate.values.count                    ///; print("archive count: \(archives)")
                    archiveVC.downcastLayout!.rows = archives
                    
                    eventsAtIndexPath.remove(at: eventsAtIndexPath.index(forKey: TimeBlock(values:(cl, rw)))!)
                }
            }
            
            if eventIndex < eventsInBlockToBeProcessed {eventIndex += 1}
            if eventsInBlockToBeProcessed > 0 {eventsInBlockToBeProcessed -= 1}
            
            if eventsInBlockToBeProcessed == 0 {
                pathsToProcess.removeFirst(); eventArraysToProcess.removeFirst()
                eventIndex = 0
                if !eventArraysToProcess.isEmpty {
                    eventsInBlockToBeProcessed = eventArraysToProcess.first!.count
                } else {eventsInBlockToBeProcessed = 0}
            }
            
            dismissPopupMenuAndSave()
        } else {print("selected popup menu header")}
    }
}

