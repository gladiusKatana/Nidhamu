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
            
            let col = firstPathToProcess[0];  let rw = firstPathToProcess[1]                /// components of path of current item being marked
            
            if let eventsOfBlockBeingTagged = eventsAtIndexPath[TimeBlock(values:(col, rw))] { /// writing to the dictionary
                eventsOfBlockBeingTagged[eventIndex].eventStatus = EventStatus(rawValue: row - 1)!
                eventsOfBlockBeingTagged[eventIndex].eventDate = eventsOfBlockBeingTagged[eventIndex].eventDate + TimeInterval(86400 * 7)
                ///print("marked eventsOfTimeBlockBeingTagged[\(eventIndex)] as \(eventsOfBlockBeingTagged[eventIndex].eventStatus)")
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
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                eventRecurringSwitchView.removeFromSuperview()                                  ///; print("removing switch")
                classifierVC.view.removeFromSuperview(); classifierVC.resignFirstResponder()
                classifierViewDisplayed = false                                                 ///print("now paths to process: \(pathsToProcess)")
                defaultSaveData(saveDate: false, showDate: false, pryntEvents: false)
                
                earliestEventAddress = defaultPathOutOfView
                timetableVC.reloadCV()                                                      ///; print("block events remaining now: \(eventsInBlockToBeProcessed)\n")
                timetableVC.tagEventsSinceLastLogin(layout: timetableVC.downcastLayout!)
                if pathsToProcess.isEmpty {self.exitEventTaggingMode()}
            }
            
        } else {print("selected popup menu header")}
    }
}

