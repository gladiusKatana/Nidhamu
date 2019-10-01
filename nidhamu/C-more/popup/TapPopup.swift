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
            
            let col = firstPathToProcess[0];  let rw = firstPathToProcess[1]            /// components of path of current item being marked
            
            if let eventsOfBlockBeingTagged = eventsAtIndexPath[TimeBlock(values:(col, rw))] { /// writing to the dictionary
                
                eventsOfBlockBeingTagged[eventIndex].eventDate = eventsOfBlockBeingTagged[eventIndex].eventDate + TimeInterval(86400 * 7)
                
                /// will save tagged events that are not upcoming or deferred into the archive dictionary eventsAtDate
                
                if selectedEventWillRecur {
                    eventsOfBlockBeingTagged[eventIndex].eventStatus = .upcoming
                }
                else {
                    eventsOfBlockBeingTagged[eventIndex].eventStatus = EventStatus(rawValue: row - 1)!
                    if !([EventStatus.deferred, EventStatus.upcoming].contains(eventsOfBlockBeingTagged[eventIndex].eventStatus)) {
                        eventsAtIndexPath.remove(at: eventsAtIndexPath.index(forKey: TimeBlock(values:(col, rw)))!)
                    }
                } ///; print("marked eventsOfTimeBlockBeingTagged[\(eventIndex)] as \(eventsOfBlockBeingTagged[eventIndex].eventStatus)")
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

