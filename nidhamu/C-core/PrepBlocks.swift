// PrepBlocks       ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension CollectionVC {
    
    func prepareToProcessEventsSinceLastLogin(cell: CustomCell, column: Int, row: Int) {
        
        if let events = eventsAtIndexPath[TimeBlock(values:(column, row))] { ///cell.backgroundColor = jadeGreen; cell.cellColour = jadeGreen
            
            if !savedTimeBlocksForProcessing {
                if !eventArraysToProcess.contains(events) {eventArraysToProcess.append(events)}
                ///else {print("event array-of-arrays already contains events: \(events)")}
                
                if !pathsToProcess.contains([column, row]) {pathsToProcess.append([column, row])}
                ///else {print("path array-of-arrays already contains path: \([column, row])")}
            }
            
            if row >= 21 {thereWillBeARowException = true} /// corresponds to the row whose cellDates are at 4pm
        }
    }
    
    func processTimeBlocksSinceLastLogin(layout: CustomFlowLayout) {
        if vcType == .hours {
            if eventArraysToProcess.count > 0 { //* or, could have used paths ToProcess.count > 0
                if !savedTimeBlocksForProcessing {
                    eventsInBlockToBeProcessed = eventArraysToProcess.first!.count
                    
                    ///print("\n*eventsInBlock \(eventsInBlockToBeProcessed)")
                    ///print("events left (initial): \(eventsInBlockToBeProcessed)\n")
                    ///print("paths to process: \(pathsToProcess)")
                    
                    pathsToProcess = pathsToProcess.sorted(by: {lastEventFromPath($0).eventDate < lastEventFromPath($1).eventDate})
                    eventArraysToProcess = eventArraysToProcess.sorted(by: {$0.last!.eventDate < $1.last!.eventDate})
                    savedTimeBlocksForProcessing = true
                    
                    if thereWillBeARowException {
                        let gap = CGFloat(5) / (self.downcastLayout!.cellHeight!)           // extra gap for better aesthetics
                        downcastLayout?.autoFitHScale =
                            CGFloat(layout.rows) / (CGFloat(layout.rows + 8) + gap)         // popup window is 8 cells tall
                        
                        reloadWithDelay(after: 0)                                           //; print("reloaded for size adjustment")
                        ///classifierVC.removePopupMenuAndSwitch()
                    }
                    
                    tagEventsSinceLastLogin(layout: layout)
                }
            } else {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {AppUtility.lockOrientation(.all)}
            }
        }
    }
}

