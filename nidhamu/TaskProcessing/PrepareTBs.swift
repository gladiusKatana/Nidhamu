// PrepareTBs       ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit ///TBs = Time Blocks

extension CollectionVC {
    
    func prepareToProcessTasksSinceLastLogin(cell: CustomCell, column: Int, row: Int) {
        
        if let tasks = tasksAtIndexPath[TimeBlock(values:(column, row))] {              ///cell.backgroundColor = jadeGreen; cell.cellColour = jadeGreen
            
            if !cachedBlocksAndTheirPaths {
                
                var nonDeferredTasks = [SimpleTask]()
                var taskDescriptions = [String]()
                
                for task in tasks {
                    
                    let deadlineIsWithinLoginDateSweep = sweepLoginInterval(dateToCheck: task.deadline, forTaskDeadline: true,
                                                                            column: nil, row: nil, layout: nil)
                    
                    //print("time block @ (\(column),\(row)), task: \(task.taskDescription), \(deadlineIsWithinLoginDateSweep)")
                    
                    if deadlineIsWithinLoginDateSweep {
                        if !indexPathsToProcess.contains([column, row]) {indexPathsToProcess.append([column, row])}
                        ///else {print("path array-of-arrays already contains path: \([column, row])")}
                        
                        nonDeferredTasks.append(task)
                        taskDescriptions.append(task.taskDescription)
                    }
                }
                
                if !taskDescriptionsToProcess.contains(taskDescriptions)
                    && !taskDescriptions.isEmpty && !nonDeferredTasks.isEmpty
                {
                    taskDescriptionsToProcess.append(taskDescriptions)                  //; print("appending descriptions \(taskDescriptions)")
                    taskArraysToProcess.append(nonDeferredTasks)
                } ///else {print("task array-of-arrays already contains tasks: \(tasks)")}
                
            }
            
            ///else {print("already cached time blocks and their paths")}
            
            if row >= 24 && timeBlockSize == 1      /// this is the row whose task deadlines are in the 7pm time block
                || row >= 8 && timeBlockSize == 6   /// this is the row whose task deadlines are in the "Evening" time block
            {
                thereWillBeARowException = true
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            if indexPathsToProcess.isEmpty {
                UIView.animate(
                    withDuration: 7, delay: 0,
                    usingSpringWithDamping: 1, initialSpringVelocity: 0, options: UIView.AnimationOptions.curveEaseIn, animations: {
                        cell.backgroundColor = lastWeekColour
                }, completion: {(finished:Bool) in
                    if !taglessSavingFlag {
                        defaultSaveData(saveDate: true, resetLastLogin: false, showDate: false, pryntTasks: true)
                        print("\n(autosaved)\n")
                        wakeupDateReset(withReload: false)
                        taglessSavingFlag = true
                    }
                }
                )
            }
        }
        
    }
}

