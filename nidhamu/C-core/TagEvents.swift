// TagTasks         ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension CollectionVC {
    
    func tagTasksSinceLastLogin() {                            ///print("tagging blocks (saved timeblocks? \(savedTimeBlocksForProcessing)")
        
        if !indexPathsToProcess.isEmpty { // already (sort of) checked for this, in the caller (but used  task ArraysToProcess)
            
            let column = indexPathsToProcess.first![0]; let row = indexPathsToProcess.first![1]   ///; print("presenting popup at (\(column), \(row))")
            
            globalTaskIdentifier = "\(taskArraysToProcess.first![taskIndex].taskDescription)"
            
            presentPopupViewToTagTasks(column: column, row: row)
        }
            
        else {                                                  ///print("\npaths to process empty\n")
            if topVC.viewControllerType != .deferralDates {
                downcastLayout?.autoFitHeightScale = 1              //; print("reset hScale to 1 on \(topVC.vcType)")
            }
            ///taskArraysToProcess.removeAll()
        }
    }
    
}

