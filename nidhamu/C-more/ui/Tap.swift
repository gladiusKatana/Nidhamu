// Tap              ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension CollectionVC {
    
    override func collectionView(_ collectionView: UICollectionView,
                                 didSelectItemAt indexPath: IndexPath) {                ///print("tapped tt cell")
        
        let layout = downcastLayout!;  let row = indexPath.item;  let column = indexPath.section
        
        if row >= layout.lockedHeaderRows && column >= layout.lockedHeaderSections {
            
            let cell = collectionView.cellForItem(at: indexPath) as! CustomCell
            ///print(formattedDateString(cell.cellDate, roundedDown: false, showYear: true, prefix: "selected cell date: ", suffix: "", dateFormat: .fullDay))
            ///print(formattedDateString(selectedCellDate, roundedDown: false, showYear: true, prefix: "future task deadline: ", suffix: "", dateFormat: .fullDay))
            
            switch viewControllerType {
            case .timetable:
                
                selectedCellDate = cell.cellDate + TimeInterval(3600 * timeBlockSize)   ///for task deadline: = start of the next time block after the one tapped
                
                selectedTimeBlockPath = [column, row]                                   ///; print("selected time block path \(selectedTimeBlockPath)")
                timeBlock = TimeBlock(values:(column, row))
                
                if tasksAtIndexPath[timeBlock] == nil || textFieldDisplayed {
                    DispatchQueue.main.asyncAfter(deadline: .now()) {
                        cell.backgroundColor = taskAddingColour                                                     //** refactor ?
                        self.prepareAndPresentTextField()
                        self.reloadCV()
                    } /**/
                } else {
                    if let tasks = tasksAtIndexPath[timeBlock] {taskListVC.downcastLayout!.rows = tasks.count}      //** refactor
                    gotoView(vc: taskListVC)
                }
                
            case .taskList:
                if tasksAtIndexPath[timeBlock] != nil && taskIsDeletable {
                    tasksAtIndexPath[timeBlock]!.remove(at: row)
                    
                    if tasksAtIndexPath[timeBlock]!.isEmpty {
                        tasksAtIndexPath.remove(at: tasksAtIndexPath.index(forKey: timeBlock)!)
                    }
                    
                    if let tasks = tasksAtIndexPath[timeBlock] {taskListVC.downcastLayout!.rows = tasks.count == 0 ? 1 : tasks.count}
                    reloadCV()
                    
                    timetableVC.collectionView.reloadData()
                    taskIsDeletable = false
                    print("taskDescriptionArrays: \(taskDescriptionArrays)")
                    print("timeBlockPaths: \(timeBlockPaths)")
                }
                else {
                    DispatchQueue.main.asyncAfter(deadline: .now()) {
                        self.prepareAndPresentTextField()
                        self.reloadCV()
                    }
                }
                
            case .archive:          presentEmail() ///sendArchiveAsCsv()
            case .deferralDates:
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                    deferralPath = [column, row]
                    cell.backgroundColor = cell.cellColour
                    self.gotoView(vc: timetableVC)
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
