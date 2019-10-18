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
            let clm = firstPathToProcess[0];  let rw = firstPathToProcess[1]    /// components of path of current item being marked
            var eventWillShowUpNextWeek = false
            
            if let eventsOfBlockBeingTagged = eventsAtIndexPath[TimeBlock(values:(clm, rw))] {  /// writing to the dictionary
                
                let selectedStatus = EventStatus(rawValue: row)
                let eventBeingTagged = eventsOfBlockBeingTagged[eventIndex]
                eventsOfBlockBeingTagged[eventIndex].eventStatus = selectedStatus!
                
                if [EventStatus.deferred, EventStatus.upcoming].contains(selectedStatus) {
                    eventWillShowUpNextWeek = true
                    //eventsOfBlockBeingTagged[eventIndex].eventDate += TimeInterval(86400 * 7)
                }
                
                if !eventWillShowUpNextWeek {
                    addToArchives(eventBeingTagged)
                }
                
                if eventIndex < eventsInBlockToBeProcessed {eventIndex += 1}
                if eventsInBlockToBeProcessed > 0 {eventsInBlockToBeProcessed -= 1}
                
                if eventsInBlockToBeProcessed == 0 {
                    pathsToProcess.removeFirst(); eventArraysToProcess.removeFirst()
                    if !eventWillShowUpNextWeek {
                        eventsAtIndexPath.remove(at: eventsAtIndexPath.index(forKey: TimeBlock(values:(clm, rw)))!)
                    }
                    eventIndex = 0
                    
                    if !eventArraysToProcess.isEmpty {
                        eventsInBlockToBeProcessed = eventArraysToProcess.first!.count
                    }
                    else {eventsInBlockToBeProcessed = 0}
                }
                dismissPopupMenuAndSave()
            }
            
        } else {print("selected popup menu header")}
    }
}

