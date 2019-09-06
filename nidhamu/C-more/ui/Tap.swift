// Tap              ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension CollectionVC {
    
    override func collectionView(_ collectionView: UICollectionView,
                                 didSelectItemAt indexPath: IndexPath) {                        //print("selected tt cell")
        let cell = collectionView.cellForItem(at: indexPath) as! CustomCell
        let layout = downcastLayout!;       let row = indexPath.item;       let column = indexPath.section
        
        //print("\nselected date (unformatted gmt)  \(cell.cellDate)")
        //print(formattedDateString(cell.cellDate, roundedDown: false, prefix: "                 (formatted)    ", suffix: "", short: false))
        
        if row >= layout.lockedHeaderRows && column >= layout.lockedHeaderSections {
            selectedCellDate = cell.cellDate
            let dateString = formattedDateString(selectedCellDate, roundedDown: true, prefix: "New event on", suffix: "", short: false)
            
            switch vcType {
                
            case .hours:
                
                if selectedTimeBlockPath == defaultPathOutOfView {  print("animating..")
                    UIView.animate(withDuration: 2, delay: 0,                               //! factor/put in Animations.swift
                        usingSpringWithDamping: 1, initialSpringVelocity: 1, options: UIView.AnimationOptions.curveLinear, animations: {
                            cell.backgroundColor = eventAddingColour
                    }, completion: nil) //{ (finished:Bool) in self.populateOrOpenTimeBlock(column: column, row: row, dateString: dateString)}
                }
                else {
                    cell.backgroundColor = eventAddingColour
                    reloadCV()
                }
                
                populateOrOpenTimeBlock(column: column, row: row, dateString: dateString, layout: layout)
                
            case .todoList:
                
                formatAndPresentTextField(dateString: dateString)
                textFieldDisplayed = true
                
            default: print("unrecognized collection view type's cell selected")}
            
        } else {print("selected header")}
    }
    
    
    func populateOrOpenTimeBlock(column: Int, row: Int, dateString: String, layout: CustomFlowLayout) {
        selectedTimeBlockPath = [column, row]       //; print("selected time block path \(selectedTimeBlockPath)")
        timeBlock = TimeBlock(values:(column, row))
        
        if eventsAtIndexPath[timeBlock] == nil {
            if row >= 18 {                               let gap = CGFloat(5) // extra gap for better aesthetics
                downcastLayout?.autoFitHScale = CGFloat(18 - gap / downcastLayout!.cellHeight!) / CGFloat(layout.rows)
                reloadWithDelay(after: 0)
            }
            
            self.formatAndPresentTextField(dateString: dateString)
            textFieldDisplayed = true
        }
        else {self.gotoView(vc: todoListVC)}
    }
}

