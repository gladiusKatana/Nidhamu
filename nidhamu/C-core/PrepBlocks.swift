// PrepBlocks       ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension CollectionVC {
    
    func prepareToProcessEventsSinceLastLogin(cell: CustomCell, column: Int, row: Int) {
        if let events = eventsAtIndexPath[TimeBlock(values:(column, row))] { ///cell.backgroundColor = jadeGreen; cell.cellColour = jadeGreen
            if !savedBlocksAndPathsForProcessing {
                
                if !pathsToProcess.contains([column, row]) {
                    pathsToProcess.append([column, row])                //; print("appending path \([column, row])")
                }
                ///else {print("path array-of-arrays already contains path: \([column, row])")}
                
                /*if !eventArraysToProcess.contains(events) {
                 eventArraysToProcess.append(events)
                 }*/
                
                var eventDescriptions = [String]()
                for event in events {eventDescriptions.append(event.eventDescription)}
                
                if !eventDescriptionsToProcess.contains(eventDescriptions) {
                    eventDescriptionsToProcess.append(eventDescriptions)    //; print("appending descriptions \(eventDescriptions)")
                    eventArraysToProcess.append(events)
                }
                ///else {print("event array-of-arrays already contains events: \(events)")}
            }
            if row >= 21 {thereWillBeARowException = true}              /// corresponds to the row whose cellDates are at 4pm
        }
    }
    
    func processTimeBlocksSinceLastLogin(layout: CustomFlowLayout) {
        if vcType == .hours {
            if eventArraysToProcess.count > 0 {
                
                if !savedBlocksAndPathsForProcessing {
                    
                    pathsToProcess = pathsToProcess.sorted(by: {lastEventFromPath($0).eventDate < lastEventFromPath($1).eventDate})
                    eventArraysToProcess = eventArraysToProcess.sorted(by: {$0.last!.eventDate < $1.last!.eventDate})
                    
                    eventsInBlockToBeProcessed = eventArraysToProcess.first!.count
                    
                    print("paths to process: \(pathsToProcess)")
                    print("events to process: \(eventDescriptionsToProcess)")
                    
                    savedBlocksAndPathsForProcessing = true
                    
                    if thereWillBeARowException {
                        let gap = CGFloat(5) / (self.downcastLayout!.cellHeight!)           // extra gap for better aesthetics
                        downcastLayout?.autoFitHScale =
                            CGFloat(layout.rows) / (CGFloat(layout.rows + 8) + gap)         // popup window is 9 cells tall
                        
                        reloadWithDelay(after: 0)                                           //; print("reloaded for size adjustment")
                        
                        let count = pathsToProcess.count
                        
                        if count >= 2                   /// * row 21 = 4pm
                            && pathsToProcess[count - 2][1] < 21 {  /// if 2nd-last index path to process requires resizing (since cells can be swept over...
                            classifierVC.removePopupMenuAndSwitch() /// ...repeatedly, within 1 session (eg user could leave timetable open for multiple hours, it just auto-updates)
                        }
                        
                        thereWillBeARowException = false
                    }
                    
                    tagEventsSinceLastLogin()       ///; print(".\(eventArraysToProcess.count) blocks remaining now; \(eventsInBlockToBeProcessed) events; tag #\(eventIndex + 1)\n")
                }
                
            } else {DispatchQueue.main.asyncAfter(deadline: .now() + 1) {AppUtility.lockOrientation(.all)}}
        }
    }
}

