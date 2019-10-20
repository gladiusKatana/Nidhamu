// TagEvents        ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension CollectionVC {
    
    func tagEventsSinceLastLogin() {                            ///print("tagging blocks (saved timeblocks? \(savedTimeBlocksForProcessing)")
        
        if !pathsToProcess.isEmpty { // already (sort of) checked for this, in the caller (but used  event ArraysToProcess)
            
            let column = pathsToProcess.first![0]; let row = pathsToProcess.first![1]   ///; print("presenting popup at (\(column), \(row))")
            
            globalEventIdentifier = "\(eventArraysToProcess.first![eventIndex].eventDescription)"
            
            presentPopupViewToTagEvents(column: column, row: row)
        }
            
        else {                                                  ///print("\npaths to process empty\n")
            if topVC.vcType != .deferralDates {
                downcastLayout?.autoFitHScale = 1              //; print("reset hScale to 1 on \(topVC.vcType)")
            }
            ///eventArraysToProcess.removeAll()
        }
    }
    
}

