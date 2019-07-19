// CellTap          ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension CollectionVC {
    
    override func collectionView(_ collectionView: UICollectionView,
                                 didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! CustomCell
        let layout = downcastLayout!
        let row = indexPath.item;   let column = indexPath.section
        
        /*if indexPath.item >= layout.lockedHeaderRows && indexPath.section >= layout.lockedHeaderSections {
            print("\nselected date (unformatted gmt)  \(cell.cellDate)")
            print(formattedDateString(cell.cellDate, roundedDown: true, prefix: "                 (formatted)    ", suffix: "", short: false))
        }*/
        
        if row >= layout.lockedHeaderRows && column >= layout.lockedHeaderSections {
            selectedCellDate = cell.cellDate
            let dateString = formattedDateString(selectedCellDate, roundedDown: true, prefix: "New event on", suffix: "", short: false)
            
            if vcType == .hours {
                selectedTimeBlockPath = [column, row]                               //; print("selected time block path \(selectedTimeBlockPath)")
                timeBlock = TimeBlock(values:(column, row))
                
                previousSelectedTimeBlockPath = [column, row]
                previousTimeBlock = TimeBlock(values:(column, row))
                
                if eventsAtIndexPath[timeBlock] == nil {
                    formatAndPresentTextField(layout: layout, dateString: dateString)
                    textFieldDisplayed = true
                }
                else {gotoView(vc: todoListVC)}
                
                if !cell.markedForItems {
                    UIView.animate(withDuration: 1, delay: 0, // will factor/put in Animations.swift
                        usingSpringWithDamping: 1, initialSpringVelocity: 1, options: UIView.AnimationOptions.curveEaseOut, animations: {
                            cell.backgroundColor = headerColour
                    }, completion: nil)
                    cell.markedForItems = true
                }
            }
            else if vcType == .todoList {
                formatAndPresentTextField(layout: layout, dateString: dateString)
                textFieldDisplayed = true
            }
            else {print("unrecognized collection view type's cell selected")}
        } else {print("selected header")}
    }
}

