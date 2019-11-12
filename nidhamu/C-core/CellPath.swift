// CellPath         ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension CollectionVC {
    
    override func collectionView(_ collectionView: UICollectionView,
                                 cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if viewControllerType == .timetable {
            if indexPath.row == 0 {return registerAndReturnLeftCell(collectionView, at: indexPath)} /// cell with text (and title label constraints) left-aligned
            else {return registerAndReturnCell(collectionView, at: indexPath)}
        } else {return registerAndReturnCell(collectionView, at: indexPath)}
    }
    
    func doRestOfCellProcessing(cell: CustomCell, indexPath: IndexPath) -> CustomCell {
        let customLayout = downcastLayout!
        let row = indexPath.item;                       let column = indexPath.section;
        let headerRows = customLayout.lockedHeaderRows; let headerSections = customLayout.lockedHeaderSections
        
        cell.xyCoordinate = [column, row]
        
        if viewControllerType == .timetable || viewControllerType == .deferralDates {
            if currentOrientation == "landscape" {
                var size = 0
                if textFieldDisplayed{size = 7} else {size = 8}
                cell.titleLabel.font = UIFont.systemFont(ofSize: CGFloat(size), weight: .ultraLight)
            }
        }
        
        if column < headerSections {
            cell.backgroundColor = headerColour
            
            if row > headerRows - 1 {                                           // time-of-day labels
                var ampm = ""
                if row < headerRows + 12 {ampm = "am"}
                else {ampm = "pm"}
                cell.titleLabel.text = "\(amPmHours[row - headerRows])\(ampm)"
            }
        }
        else {
            if row < headerRows {
                cell.backgroundColor = headerColour
                if row == 1 && viewControllerType == .timetable || row == 4  && viewControllerType == .deferralDates {
                    cell.titleLabel.text = headerWeekdayTitles[column - 1]
                }
                if (2 ... headerRows - 1).contains(row) {
                    timeBlockDateSetup(cell: cell, column: column, row: row, layout: customLayout)
                }
            } else {
                cell.backgroundColor = cellDefaultColour;  cell.cellColour = cellDefaultColour
                timeBlockDateSetup(cell: cell, column: column, row: row, layout: customLayout)
                /**/
                
                if row == customLayout.rows - 1 && column == customLayout.cols - 1 {          /// so it's called on the FINAL cell dequeued
                    processTimeBlocksSinceLastLogin(layout: customLayout)
                }
                
//                if row == customLayout.lockedHeaderRows && column == customLayout.lockedHeaderSections {
//                    if nowRow >= 7 {fellBack = false}
//                }
            }
        }
        
        if viewControllerType == .archive {cell.backgroundColor = .white}
        
        return cell
    }
}

///For cell title label text truncation
/*if row == 5 && column == 1 {
 if viewControllerType == .hours {findAverageLetterWidthWithCellLabelFont(cell: cell)} /// done here so it's only called once, but can access a cell
 }*/
