// Tap              ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension CollectionVC {
    
    override func collectionView(_ collectionView: UICollectionView,
                                 didSelectItemAt indexPath: IndexPath) {                        //print("selected tt cell")
        let cell = collectionView.cellForItem(at: indexPath) as! CustomCell
        let layout = downcastLayout!;       let row = indexPath.item;       let column = indexPath.section
        
        //print("\nselected date (unformatted gmt)  \(cell.cellDate)")
        //print(formattedDateString(cell.cellDate, roundedDown: true, prefix: "                 (formatted)    ", suffix: "", short: false))
        
        if row >= layout.lockedHeaderRows && column >= layout.lockedHeaderSections {
            selectedCellDate = cell.cellDate
            let dateString = formattedDateString(selectedCellDate, roundedDown: true, prefix: "New event on", suffix: "", short: false)
            
            switch vcType {
                
            case .hours:
                
                if !cell.markedForItems { cell.markedForItems = true
                    if selectedTimeBlockPath == defaultPathOffOfView {
                        UIView.animate(withDuration: 1, delay: 0,                               //* will factor/put in Animations.swift
                            usingSpringWithDamping: 1, initialSpringVelocity: 1, options: UIView.AnimationOptions.curveEaseOut, animations: {
                                cell.backgroundColor = eventAddingColour
                        }, completion: nil)
                    }
                    else {
                        DispatchQueue.main.asyncAfter(deadline: .now()) {
                            cell.backgroundColor = eventAddingColour
                            self.reloadCV()
                        }
                    }
                }
                
                selectedTimeBlockPath = [column, row]                               //; print("selected time block path \(selectedTimeBlockPath)")
                timeBlock = TimeBlock(values:(column, row))
                
                if eventsAtIndexPath[timeBlock] == nil {
                    formatAndPresentTextField(dateString: dateString)
                    textFieldDisplayed = true
                }
                else {gotoView(vc: todoListVC)}
                
            case .todoList:
                
                formatAndPresentTextField(dateString: dateString)
                textFieldDisplayed = true
                
            default: print("unrecognized collection view type's cell selected")}
            
        } else {print("selected header")}
    }
}

