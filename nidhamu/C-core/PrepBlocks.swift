// PrepBlocks       ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension CollectionVC {
    
    func prepareToProcessTasksSinceLastLogin(cell: CustomCell, column: Int, row: Int) {
        if let tasks = tasksAtIndexPath[TimeBlock(values:(column, row))] {              ///cell.backgroundColor = jadeGreen; cell.cellColour = jadeGreen
            if !cachedBlocksAndTheirPaths {
                
                if !indexPathsToProcess.contains([column, row]) {indexPathsToProcess.append([column, row])} ///; print("appending path \([column, row])")
                ///else {print("path array-of-arrays already contains path: \([column, row])")}
                
                var taskDescriptions = [String]()
                for task in tasks {taskDescriptions.append(task.taskDescription)}
                
                if !taskDescriptionsToProcess.contains(taskDescriptions) {
                    taskDescriptionsToProcess.append(taskDescriptions)                  //; print("appending descriptions \(taskDescriptions)")
                    taskArraysToProcess.append(tasks)
                } ///else {print("task array-of-arrays already contains tasks: \(tasks)")}
            }
            if row >= 24 && timeBlockSize == 1      /// this is the row whose task deadlines are in the 7pm time block
                || row >= 8 && timeBlockSize == 6   /// this is the row whose task deadlines are in the "Evening" time block
            {
                thereWillBeARowException = true
            }
        }
    }
    
    func processTimeBlocksSinceLastLogin(layout: CustomFlowLayout) {
        guard viewControllerType == .timetable,
            !cachedBlocksAndTheirPaths else {
                return
        }
        
        guard taskArraysToProcess.count > 0 else {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { // 1/2 second after you finish tagging tasks, screen becomes rotatable again
                AppUtility.lockOrientation(.all)
            }
            return
        }
        
        indexPathsToProcess = indexPathsToProcess.sorted(by: {lastTaskFromPath($0).deadline < lastTaskFromPath($1).deadline})
        taskArraysToProcess = taskArraysToProcess.sorted(by: {$0.last!.deadline < $1.last!.deadline})
        
        tasksInBlockToBeProcessed = taskArraysToProcess.first!.count
        cachedBlocksAndTheirPaths = true
        
        if thereWillBeARowException {                               /// if any time-blocks are >= 4pm, timetable will need to shrink to accomodate wizard (window beside cell)
            let heightMinusBars = globalWindow.frame.height - CGFloat(navBarHeight + statusBarHeight)
            let cellHeight = layout.heightPlusSpace
            let extraRowspaceFromPopup = timeBlockSize == 1 ? CGFloat(7) : CGFloat(3)
            let heightDenominator = heightMinusBars + cellHeight * cellHeightFactor / CGFloat(timeBlockSize) * extraRowspaceFromPopup
            layout.autoFitHeightScale = heightMinusBars / heightDenominator
            
            reloadCollectionViewAfterDelay(0)
            
            let paths = indexPathsToProcess.count
            if paths >= 2                        /* row 21 = 4pm*/
                && indexPathsToProcess[paths - 2] [1] < 21 {        /// ie, if second-last time block to process requires resizing (since cells could be swept over repeatedly...
                taskTaggingViewController.dismissTaggingWizard()    /// ...within 1 session. (eg, user could leave timetable open for many hours -- it just automatically updates)
            }
            thereWillBeARowException = false
        }
        
        tagTasksSinceLastLogin()            ///; print("\(taskArraysToProcess.count) blocks remaining now, and \(tasksInBlockToBeProcessed) tasks remaining (tag #\(taskIndex + 1))\n")
    }
}

