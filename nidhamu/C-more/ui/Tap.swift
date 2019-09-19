// Tap              ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension CollectionVC {
    
    override func collectionView(_ collectionView: UICollectionView,
                                 didSelectItemAt indexPath: IndexPath) {                            //print("tapped tt cell")
        let layout = downcastLayout!;                                   let row = indexPath.item;   let column = indexPath.section
        if row >= layout.lockedHeaderRows && column >= layout.lockedHeaderSections {
            
            let cell = collectionView.cellForItem(at: indexPath) as! CustomCell
            ///print("\nselected date (unformatted gmt)  \(cell.cellDate)")     ///print(formattedDateString(cell.cellDate, roundedDown: false, prefix: "                 (formatted)    ", suffix: "", short: false))
            
            selectedCellDate = cell.cellDate
            let selectedTimeBlockDateDescription = formattedDateString(selectedCellDate, roundedDown: true, showYear: false,
                                                                       prefix: "New event on", suffix: "", dateFormat: .fullDayShortForm)
            switch vcType {
            case .hours:
                
                selectedTimeBlockPath = [column, row]       //; print("selected time block path \(selectedTimeBlockPath)")
                timeBlock = TimeBlock(values:(column, row))
                
                if eventsAtIndexPath[timeBlock] == nil || textFieldDisplayed {
                    /*if previousTimeBlockPathSelected == defaultPathOutOfView {
                     previousTimeBlockPathSelected = selectedTimeBlockPath
                     DispatchQueue.main.asyncAfter(deadline: .now()) {
                     UIView.animate(withDuration: 1, delay: 0,                                      //! factor/put in Animations.swift
                     usingSpringWithDamping: 1, initialSpringVelocity: 1, options: UIView.AnimationOptions.curveLinear, animations: {
                     cell.backgroundColor = eventAddingColour
                     }, completion: nil)
                     }
                     }
                     else {*/
                    
                    cell.backgroundColor = eventAddingColour
                    reloadCV()
                    presentTextField(after: 0, dateString: selectedTimeBlockDateDescription)
                    
                    /*if row >= 18 {
                     if !textFieldDisplayed {presentTextField(after: 1, dateString: selectedTimeBlockDateDescription)}
                     else {presentTextField(after: 0, dateString: selectedTimeBlockDateDescription)}
                     } else {presentTextField(after: 0, dateString: selectedTimeBlockDateDescription)}*/
                    
                } else { rePresentedVCManually = true
                    gotoView(vc: todoListVC)
                }
            case .todoList:
                formatAndPresentTextField(dateString: selectedTimeBlockDateDescription)
            default: print("unrecognized collection view type's cell selected")}
        } ///else {print("selected header")}
    }
}

