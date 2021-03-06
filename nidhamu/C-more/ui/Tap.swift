// Tap              ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension CollectionVC {
    
    override func collectionView(_ collectionView: UICollectionView,
                                 didSelectItemAt indexPath: IndexPath) {              //print("tapped cell")
        
        let layout = downcastLayout!;  let row = indexPath.item;  let column = indexPath.section
        if row >= layout.lockedHeaderRows && column >= layout.lockedHeaderSections {
            
            let cell = collectionView.cellForItem(at: indexPath) as! CustomCell
            //print(formattedDateString(cell.cellDate, roundedDown: false, showYear: true, prefix: "selected cell date: ", suffix: "", dateFormat: .fullDay))
            
            switch viewControllerType {
            case .timetable:
                selectedCellDate = cell.cellDate + TimeInterval(3600 * timeBlockSize) ///for task deadline: = start of next time block after tb tapped
                selectedTimeBlockPath = [column, row]                       //; print("selected time block path \(selectedTimeBlockPath)")
                timeBlock = TimeBlock(values:(column, row))
                
                if tasksAtIndexPath[timeBlock] == nil || textFieldDisplayed {
                    cell.backgroundColor = taskAddingColour
                    setTaskFieldPlaceholder()
                    if textFieldDisplayed {presentTextFieldAndReload(after: 0, forTaskAtRow: nil)}
                    else {presentTextFieldAndReload(after: 0.05, forTaskAtRow: nil)}
                } else {
                    if let tasks = tasksAtIndexPath[timeBlock] {
                        taskListVC.downcastLayout!.rows = tasks.count + minTaskListRows// ; for task in tasks {print("*\(task.taskDescription)")}
                    }
                    gotoView(vc: taskListVC)
                }
                
            case .taskList:
                if tasksAtIndexPath[timeBlock] != nil && taskIsDeletable {
                    tasksAtIndexPath[timeBlock]!.remove(at: row - taskListOffset)
                    
                    if tasksAtIndexPath[timeBlock]!.isEmpty {
                        tasksAtIndexPath.remove(at: tasksAtIndexPath.index(forKey: timeBlock)!)
                    }
                    
                    if let tasks = tasksAtIndexPath[timeBlock] {
                        taskListVC.downcastLayout!.rows = tasks.count == 0 ? minTaskListRows : tasks.count + minTaskListRows}
                    reloadCV()
                    reloadLock = false
                    timetableVC.reloadCV()
                    taskIsDeletable = false ///; print("taskDescriptionArrays: \(taskDescriptionArrays)") ///print("timeBlockPaths: \(timeBlockPaths)")
                    setNavBarTitle(customString: nil)
                } else {
                    setTaskFieldPlaceholder()
                    if !textFieldDisplayed {presentTextFieldAndReload(after: 0, forTaskAtRow: nil)}
                }
                
            case .archive:          if archiveTasks.count > 0 {presentEmail()} ///sendArchiveAsCsv()
            case .deferralDates:
                cell.backgroundColor = taskAddingColour
                guard let firstPathToProcess = indexPathsToProcess.first else {print("no paths to process... ..."); return}
                let clm = firstPathToProcess[0];  let rw = firstPathToProcess[1] /// components of path of current item being marked
                
                taskTaggingViewController.updateBlockProcessingVariables(column: clm, row: rw,
                                                                         taskWillShowUpNextWeek: false, selectedStatus: .done)
                DispatchQueue.main.asyncAfter(deadline: .now()) {//now() + 0.25
                    deferralPath = [column, row]
                    self.gotoView(vc: timetableVC)  //; print("******************should be highlighting: \(earliestTaskAddress)")
                }
                
            default: print("unrecognized collection view type's cell selected")}
        }///else {print("selected navbar-embeddd vc's header")}
    }
}


/*
 /*if previousTimeBlockPathSelected == defaultPathOutOfView {
 previousTimeBlockPathSelected = selectedTimeBlockPath
 
 ///setNavBarTitle(customString: " Add a Task (Tap Done to quit)")                                                               // may not use.  Gives User too much extra stuff to look at?
 animateTimeBlockTappedToAddTask(cell: cell)                                 /// may not use. Looks nice; slows User down a little bit?
 
 DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
 self.prepareAndPresentTextField()
 }
 } else {
 
 } ///see (*) re. animation-logic, below
 */
 */


/*if row >= 18 {
 if !textFieldDisplayed {presentTextField(after: 1, dateString: selectedTimeBlockDateDescription)}
 else {presentTextField(after: 0, dateString: selectedTimeBlockDateDescription)}
 } else {presentTextField(after: 0, dateString: selectedTimeBlockDateDescription)}*/

