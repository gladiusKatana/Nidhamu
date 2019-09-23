// Tap              ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension CollectionVC {
    
    override func collectionView(_ collectionView: UICollectionView,
                                 didSelectItemAt indexPath: IndexPath) {                            //print("tapped tt cell")
        
        let layout = downcastLayout!;  let row = indexPath.item;  let column = indexPath.section
        if row >= layout.lockedHeaderRows && column >= layout.lockedHeaderSections {
            
            let cell = collectionView.cellForItem(at: indexPath) as! CustomCell
            ///print("\nselected date (unformatted gmt)  \(cell.cellDate)")     ///print(formattedDateString(cell.cellDate, roundedDown: false, prefix: "                 (formatted)    ", suffix: "", short: false))
            
            selectedCellDate = cell.cellDate                                                                                        //➕
            selectedTimeBlockDateDescription = formattedDateString(selectedCellDate, roundedDown: true, showYear: false, prefix: " Add an Event", suffix: "", dateFormat: .fullDayShortForm) // ! probably needs smaller font on iPhone SEs in portrait
            
            switch vcType {
            case .hours:
                
                selectedTimeBlockPath = [column, row]                           //; print("selected time block path \(selectedTimeBlockPath)")
                timeBlock = TimeBlock(values:(column, row))
                
                if eventsAtIndexPath[timeBlock] == nil || textFieldDisplayed {
                    
                    ///see (1) re. animations, below
                    
                    cell.backgroundColor = eventAddingColour
                    
                    prepareAndPresentTextField(dateString: selectedTimeBlockDateDescription)
                    
                    ///see (2) re. animation-logic, below
                    
                } else {
                    rePresentedVCManually = true
                    gotoView(vc: todoListVC)
                }
                
            case .todoList:     prepareAndPresentTextField(dateString: selectedTimeBlockDateDescription)
            default: print("unrecognized collection view type's cell selected")}
            
            //reload CV()
            
        }///else {print("selected navbar-embeddd vc's header")}
    }
}

//(1)

/*if previousTimeBlockPathSelected == defaultPathOutOfView {
 previousTimeBlockPathSelected = selectedTimeBlockPath
 DispatchQueue.main.asyncAfter(deadline: .now()) {
 UIView.animate(withDuration: 1, delay: 0,                                      //! factor/put in Animations.swift
 usingSpringWithDamping: 1, initialSpringVelocity: 1, options: UIView.AnimationOptions.curveLinear, animations: {
 cell.backgroundColor = eventAddingColour
 }, completion: nil)
 }
 } else {*/ //not sure if will keep this animation: looks nice, but slows the user down, which might outweight the aesthetics
///setNavBarTitle(customString: " Add an Event (Tap Done to quit)") // also not sure if will keep this. Gives the user too much extra stuff to look at, probably


//(2)

/*if row >= 18 {
 if !textFieldDisplayed {presentTextField(after: 1, dateString: selectedTimeBlockDateDescription)}
 else {presentTextField(after: 0, dateString: selectedTimeBlockDateDescription)}
 } else {presentTextField(after: 0, dateString: selectedTimeBlockDateDescription)}*/
