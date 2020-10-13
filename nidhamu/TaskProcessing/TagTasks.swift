// TagTasks         ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension CollectionVC {
    
    func tagTasksSinceLastLogin() {                                 //print("tagging blocks (saved timeblocks? \(cached BlocksAndTheirPaths)")
        
        if !indexPathsToProcess.isEmpty {                           /// already (sort of) checked for this, in the caller (but used  taskArraysToProcess )
            
            let column = indexPathsToProcess.first![0]; let row = indexPathsToProcess.first![1] ///; print("presenting popup at (\(column), \(row))")
            
            if let firstTaskArrayToProcess = taskArraysToProcess.first {                        ///if taskArraysToProcess.count > 1 {
                
                if taskIndex < firstTaskArrayToProcess.count {
                    globalTaskIdentifier = "\(firstTaskArrayToProcess[taskIndex].taskDescription)"
                }
                else {print("task index exceeds task array size")}
                
            } else {print("could not cast to task array first item")}
            
            /*} else {globalTaskIdentifier = "\(taskArraysToProcess[0][taskIndex].taskDescription)"}*/
            
            presentPopupViewToTagTasks(column: column, row: row)
            
        } else {                                                    //print("\npaths to process empty\n")
            
            if topVC.viewControllerType != .deferralDates {
                if downcastLayout?.autoFitHeightScale != 1 {
                    downcastLayout?.autoFitHeightScale = 1          //; print("reset hScale to 1 on \(topVC.viewControllerType)")
                }
            }
            ///taskArraysToProcess.removeAll()
        }
    }
}

