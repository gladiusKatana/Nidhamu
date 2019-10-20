// Tap              ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension CollectionVC {
    
    override func collectionView(_ collectionView: UICollectionView,
                                 didSelectItemAt indexPath: IndexPath) {                            ///print("tapped tt cell")
        
        let layout = downcastLayout!;  let row = indexPath.item;  let column = indexPath.section
        if row >= layout.lockedHeaderRows && column >= layout.lockedHeaderSections {
            
            let cell = collectionView.cellForItem(at: indexPath) as! CustomCell
            ///print(formattedDateString(cell.cellDate, roundedDown: false, showYear: true, prefix: "block: ", suffix: "", dateFormat: .fullDay)) //("\nselected date (unformatted gmt)  \(cell.cellDate)")
            
            selectedCellDate = cell.cellDate                                                                                        //➕
            selectedTimeBlockDateDescription = formattedDateString(selectedCellDate, roundedDown: true, showYear: false, prefix: " Add an Event", suffix: "", dateFormat: .fullDayShortForm) // ! probably needs smaller font on iPhone SEs in portrait
            
            switch vcType {
            case .hours:
                
                selectedTimeBlockPath = [column, row]                                               ///; print("selected time block path \(selectedTimeBlockPath)")
                timeBlock = TimeBlock(values:(column, row))
                
                if eventsAtIndexPath[timeBlock] == nil || textFieldDisplayed {
                    
                    if previousTimeBlockPathSelected == defaultPathOutOfView {
                        previousTimeBlockPathSelected = selectedTimeBlockPath
                        
                        ///setNavBarTitle(customString: " Add an Event (Tap Done to quit)")                                                           // may not use.  Gives User too much extra stuff to look at?
                        animateTimeBlockTappedToAddEvent(cell: cell)                                /// may not use. Looks nice; slows User down a little bit?
                        showTimeInTitleLabels(cell: cell)
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                            self.prepareAndPresentTextField(dateString: selectedTimeBlockDateDescription)
                        }
                    }
                    else {
                        cell.backgroundColor = eventAddingColour
                        prepareAndPresentTextField(dateString: selectedTimeBlockDateDescription)
                    }
                    ///see (*) re. animation-logic, below
                } else {
                    if let events = eventsAtIndexPath[timeBlock] {todoListVC.downcastLayout!.rows = events.count}
                    gotoView(vc: todoListVC)
                }
                
            case .todoList:         prepareAndPresentTextField(dateString: selectedTimeBlockDateDescription)
            case .archive:          presentEmail() ///sendArchiveAsCsv()
            case .deferralDates:
                
                deferralPath = [column, row]
                cell.backgroundColor = eventAddingColour
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
