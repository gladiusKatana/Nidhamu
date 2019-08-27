// TapPopup         ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension PopupMenuVC {
    
    override func collectionView(_ collectionView: UICollectionView,
                                 didSelectItemAt indexPath: IndexPath) {                                //print("selected popup cell")
        
        let layout = downcastLayout!; let row = indexPath.item; let column = indexPath.section
        
        if row >= layout.lockedHeaderRows && column >= layout.lockedHeaderSections {
            let currentColumn = pathsToProcess.first![0]; let currentRow = pathsToProcess.first![1]     // ie, current item path being marked
            
            if let eventsOfBlockBeingTagged = eventsAtIndexPath[TimeBlock(values:(currentColumn, currentRow))] { // writing to the dictionary
                
                eventsOfBlockBeingTagged[eventIndex].eventStatus = EventStatus(rawValue: row - 1)!
                
                //print("marked eventsOfTimeBlockBeingTagged[\(eventIndex)] as \(eventsOfBlockBeingTagged[eventIndex].eventStatus)")
                
                eventsOfBlockBeingTagged[eventIndex].eventDate = eventsOfBlockBeingTagged[eventIndex].eventDate + TimeInterval(86400 * 7)
                
            } else {print("no item")}
            
            if eventIndex < eventsInBlockToBeProcessed {eventIndex += 1}
            if eventsInBlockToBeProcessed > 0 {eventsInBlockToBeProcessed -= 1}
            
            if eventsInBlockToBeProcessed == 0 {
                pathsToProcess.removeFirst()
                eventArraysToProcess.removeFirst()
                
                eventIndex = 0
                if !eventArraysToProcess.isEmpty {
                    eventsInBlockToBeProcessed = eventArraysToProcess.first!.count
                }
                else {eventsInBlockToBeProcessed = 0}
            }
            
            //print("block events remaining now: \(eventsInBlockToBeProcessed)\n"); print("now paths to process: \(pathsToProcess)")
            
            classifierVC.view.removeFromSuperview()                                                       //; print("----------------removed popup")
            classifierViewDisplayed = false
            
//            DispatchQueue.main.asyncAfter(deadline: .now()) {   //+ 0.05                                 //print("selected popup cell")
                timetableVC.tagEventsSinceLastLogin(layout: timetableVC.downcastLayout!)
            
                
                if pathsToProcess.isEmpty { timetableVC.reloadCV()
                    defaultSaveData(showDate: false) //;print("✔︎tagged events *to process: events's \(eventArraysToProcess) paths \(pathsToProcess)")
                    defaultLoadData(showDate: false)
//                    timetableVC.animateCellColourBack(cell: cell, delay: 2, duration: 10)
                }
//            }
            
        } else {print("selected header")}
    }
}

