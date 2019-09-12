// TapPopup         ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension PopupMenuVC {
    
    override func collectionView(_ collectionView: UICollectionView,
                                 didSelectItemAt indexPath: IndexPath) {
        
        let cell = collectionView.cellForItem(at: indexPath) as! CustomCell                     ; cell.backgroundColor = eventAddingColour
        let layout = downcastLayout!; let row = indexPath.item; let column = indexPath.section
        
        if row >= layout.lockedHeaderRows && column >= layout.lockedHeaderSections {
            
            guard let firstPathToProcess = pathsToProcess.first else { print("no paths to process... even though popup menu was presented"); return}
            let currentColumn = firstPathToProcess[0]; let currentRow = firstPathToProcess[1] // components of path of current item being marked
            
            if let eventsOfBlockBeingTagged = eventsAtIndexPath[TimeBlock(values:(currentColumn, currentRow))] {    // writing to the dictionary
                
                eventsOfBlockBeingTagged[eventIndex].eventStatus = EventStatus(rawValue: row - 1)!
                eventsOfBlockBeingTagged[eventIndex].eventDate = eventsOfBlockBeingTagged[eventIndex].eventDate + TimeInterval(86400 * 7)
                
                //print("marked eventsOfTimeBlockBeingTagged[\(eventIndex)] as \(eventsOfBlockBeingTagged[eventIndex].eventStatus)")
                
            } else {print("no item")}
            
            if eventIndex < eventsInBlockToBeProcessed {eventIndex += 1}
            if eventsInBlockToBeProcessed > 0 {eventsInBlockToBeProcessed -= 1}
            
            if eventsInBlockToBeProcessed == 0 {
                pathsToProcess.removeFirst(); eventArraysToProcess.removeFirst()
                
                eventIndex = 0
                if !eventArraysToProcess.isEmpty {
                    eventsInBlockToBeProcessed = eventArraysToProcess.first!.count
                }
                else {eventsInBlockToBeProcessed = 0}
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                classifierVC.view.removeFromSuperview()                 //; print("                removing popup")
                eventRecurringSwitchView.removeFromSuperview()          //; print("removing switch")
                
                classifierViewDisplayed = false                         //print("now paths to process: \(pathsToProcess)")
                classifierVC.resignFirstResponder()
                
                DispatchQueue.main.asyncAfter(deadline: .now()) {
                    timetableVC.reloadCV()                              //; print("block events remaining now: \(eventsInBlockToBeProcessed)\n")
                    timetableVC.tagEventsSinceLastLogin(layout: timetableVC.downcastLayout!)
                }
                
                if pathsToProcess.isEmpty {                             // when done tagging events since the last login
                    defaultSaveData(showDate: false, printEvents: true)
                    defaultLoadData(showDate: false)
                    AppUtility.lockOrientation(.all)                    //; print("rotated back")
                    thereWillBeARowException = false
                }
            }
        } else {print("selected header")}
    }
}

