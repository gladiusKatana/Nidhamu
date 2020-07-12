// ProcessTBs       ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit ///TBs = Time Blocks

extension CollectionVC {
    
    func processTasksSinceLastLogin(layout: CustomFlowLayout) {
        
        guard viewControllerType == .timetable,
            !cachedBlocksAndTheirPaths else {
                return
        }
        
        guard taskArraysToProcess.count > 0 else {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { /// 1/2 second after you finish tagging tasks, screen becomes rotatable again
                AppUtility.lockOrientation(.all)
            }
            return
        }
        
        if indexPathsToProcess.count > 1 && taskArraysToProcess.count > 1 {
            indexPathsToProcess = indexPathsToProcess.sorted(by: {lastTaskFromPath($0).deadline < lastTaskFromPath($1).deadline})
            taskArraysToProcess = taskArraysToProcess.sorted(by: {$0.last!.deadline < $1.last!.deadline})
        }
        
        tasksInBlockToBeProcessed = taskArraysToProcess.first!.count
        cachedBlocksAndTheirPaths = true
        
        if thereWillBeARowException { /// if any time-blocks are near/at screen bottom, timetable will shrink to accomodate wizard (window beside task's cell)
            
            let heightMinusBars = globalWindow.frame.height - CGFloat(navBarHeight + statusBarHeight)
            let cellHeight = layout.heightPlusSpace
            let extraRowspaceFromPopup = timeBlockSize == 1 ? CGFloat(7) : CGFloat(3)
            let heightDenominator = heightMinusBars + cellHeight * cellHeightFactor / CGFloat(timeBlockSize) * extraRowspaceFromPopup
            layout.autoFitHeightScale = heightMinusBars / heightDenominator
            
            reloadCollectionViewAfterDelay(0)
            
            let paths = indexPathsToProcess.count
            if paths >= 2                         /* row 21 = 4pm*/
                && indexPathsToProcess[paths - 2] [1] < 21 {    /// ie if 2nd-last time block to process requires resizing (cells could be swept over repeatedly...
                taskTaggingViewController.dismissTaggingWizard()///...within 1 session. (user could leave timetable open for many hours -- it just auto-updates)
            }
            
            thereWillBeARowException = false
        }
        
        tagTasksSinceLastLogin()///; print("\(taskArraysToProcess.count) blocks remaining now, and \(tasksInBlockToBeProcessed) tasks remaining (tag #\(taskIndex + 1))\n")
    }
}

