// Tap              ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension CollectionVC {
    
    override func collectionView(_ collectionView: UICollectionView,
                                 didSelectItemAt indexPath: IndexPath) {                            ///print("tapped tt cell")
        
        let layout = downcastLayout!;  let row = indexPath.item;  let column = indexPath.section
        if row >= layout.lockedHeaderRows && column >= layout.lockedHeaderSections {
            
            let cell = collectionView.cellForItem(at: indexPath) as! CustomCell
            print(formattedDateString(cell.cellDate, roundedDown: false, showYear: true, prefix: "date: ", suffix: "", dateFormat: .fullDay))
            
            selectedCellDate = cell.cellDate
            selectedTimeBlockDateDescription = formattedDateString(selectedCellDate, roundedDown: true, showYear: false, prefix: " Add a Task", suffix: "", dateFormat: .fullDayShortForm)                          // ! probably needs smaller font on iPhone SE in portrait
            
            switch viewControllerType {
            case .timetable:
                
                selectedTimeBlockPath = [column, row]                                               ///; print("selected time block path \(selectedTimeBlockPath)")
                timeBlock = TimeBlock(values:(column, row))
                
                if tasksAtIndexPath[timeBlock] == nil || textFieldDisplayed {
                    
                    if previousTimeBlockPathSelected == defaultPathOutOfView {
                        previousTimeBlockPathSelected = selectedTimeBlockPath
                        
                        ///setNavBarTitle(customString: " Add a Task (Tap Done to quit)")                                                               // may not use.  Gives User too much extra stuff to look at?
                        animateTimeBlockTappedToAddTask(cell: cell)                                 /// may not use. Looks nice; slows User down a little bit?
                        cell.titleLabel.text = showTimeInTitleLabels(cell.cellDate)
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                            self.prepareAndPresentTextField(dateString: selectedTimeBlockDateDescription)
                        }
                    } else {
                        cell.backgroundColor = taskAddingColour
                        prepareAndPresentTextField(dateString: selectedTimeBlockDateDescription)
                    } ///see (*) re. animation-logic, below
                } else {
                    if let tasks = tasksAtIndexPath[timeBlock] {taskListVC.downcastLayout!.rows = tasks.count}
                    gotoView(vc: taskListVC)
                }
                
            case .taskList:         prepareAndPresentTextField(dateString: selectedTimeBlockDateDescription)
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

//(*)

/*if row >= 18 {
 if !textFieldDisplayed {presentTextField(after: 1, dateString: selectedTimeBlockDateDescription)}
 else {presentTextField(after: 0, dateString: selectedTimeBlockDateDescription)}
 } else {presentTextField(after: 0, dateString: selectedTimeBlockDateDescription)}*/

