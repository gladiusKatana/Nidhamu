// PrepBlocks       ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension CollectionVC {
    
    func processTimeBlocksSinceLastLogin(layout: CustomFlowLayout) {
        
        if vcType == .hours {
            
            if eventArraysToProcess.count > 0 { //* or, could have used paths ToProcess.count > 0
                
                if !savedTimeBlocksForProcessing {
                    eventsInBlockToBeProcessed = eventArraysToProcess.first!.count
                    
                    //print("\n*eventsInBlock \(eventsInBlockToBeProcessed)")
                    //print("events left (initial): \(eventsInBlockToBeProcessed)\n")
                    //print("paths to process: \(pathsToProcess)")
                    
                    pathsToProcess = pathsToProcess.sorted(by: {lastEventFromPath($0).eventDate < lastEventFromPath($1).eventDate})
                    
                    eventArraysToProcess = eventArraysToProcess.sorted(by: {$0.last!.eventDate < $1.last!.eventDate})
                    
                    savedTimeBlocksForProcessing = true
                    
                    tagEventsSinceLastLogin(layout: layout)
                    
                    if thereWillBeARowException {
                        let gap = CGFloat(5) / (self.downcastLayout!.cellHeight!)           // extra gap for better aesthetics
                        downcastLayout?.autoFitHScale =
                            CGFloat(layout.rows) / (CGFloat(layout.rows + 8) + gap)         // popup window is 8 cells tall
                        
                        reloadWithDelay(after: 0) //; print("reloaded for size adjustment")
                        
                        classifierVC.removePopupMenuAndSwitch()
                    }
                }
            }
                
            else {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    AppUtility.lockOrientation(.all)
                }
            }
        }
    }
}

