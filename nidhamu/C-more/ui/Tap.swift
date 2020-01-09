// Tap              ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension CollectionVC {
    
    override func collectionView(_ collectionView: UICollectionView,
                                 didSelectItemAt indexPath: IndexPath) {                            ///print("tapped tt cell")
        
        let layout = downcastLayout!;  let row = indexPath.item;  let column = indexPath.section
        let headers = layout.lockedHeaderRows
        
        if row >= headers && column >= layout.lockedHeaderSections {
            
            let cell = collectionView.cellForItem(at: indexPath) as! CustomCell
            ///print(formattedDateString(cell.cellDate, roundedDown: false, showYear: true, prefix: "selected cell date: ", suffix: "", dateFormat: .fullDay))
            ///print(formattedDateString(selectedCellDate, roundedDown: false, showYear: true, prefix: "future task deadline: ", suffix: "", dateFormat: .fullDay))
            
            selectedCellDate = cell.cellDate
            
            if timeBlockSize > 1 && row >= headers {                                /// truncates HOUR of cell dates, when multi-hour-length time blocks are enabled
                let timeBlockStartHr = (row - headers) * timeBlockSize
                let hrsIntoCurrentBlock = Calendar.current.component(.hour, from: selectedCellDate) - timeBlockStartHr
                if  hrsIntoCurrentBlock > 0 {selectedCellDate = selectedCellDate - TimeInterval(3600 * hrsIntoCurrentBlock)}
            }
            
            selectedCellDate = truncateMins(selectedCellDate) + TimeInterval(3600 * 6) /// for task deadline: final minute of tapped time block
            
            switch viewControllerType {
            case .timetable:
                
                selectedTimeBlockPath = [column, row]                                               ///; print("selected time block path \(selectedTimeBlockPath)")
                timeBlock = TimeBlock(values:(column, row))
                
                if tasksAtIndexPath[timeBlock] == nil || textFieldDisplayed {
                    
                    DispatchQueue.main.asyncAfter(deadline: .now()) {
                        cell.titleLabel.text = formattedDateString(selectedCellDate, roundedDown: false, showYear: false, prefix: "", suffix: "", dateFormat: .hourAndMinute)
                        cell.backgroundColor = taskAddingColour
                        self.reloadCV()
                        self.prepareAndPresentTextField()
                    }
                    /**/
                } else {
                    if let tasks = tasksAtIndexPath[timeBlock] {taskListVC.downcastLayout!.rows = tasks.count}
                    gotoView(vc: taskListVC)
                }
                
            case .taskList:         prepareAndPresentTextField()
            case .archive:          presentEmail() ///sendArchiveAsCsv()
            case .deferralDates:
                deferralPath = [column, row]
                cell.backgroundColor = taskAddingColour
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
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
