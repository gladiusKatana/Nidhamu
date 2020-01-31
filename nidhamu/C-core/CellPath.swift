// CellPath         ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension CollectionVC {
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath)
        -> UICollectionViewCell {
            
            if viewControllerType == .timetable {
                if (0...1).contains(indexPath.row) {return registerAndReturnRightCell(collectionView, at: indexPath)}/// cell w/ text & constraints left-aligned
                else {return registerAndReturnCell(collectionView, at: indexPath)}
            } else {return registerAndReturnCell(collectionView, at: indexPath)}
    }
    
    func doRestOfCellProcessing(cell: CustomCell, indexPath: IndexPath) -> CustomCell {
        let customLayout = downcastLayout!
        let row = indexPath.item;                       let column = indexPath.section;
        let headerRows = customLayout.lockedHeaderRows; let headerSections = customLayout.lockedHeaderSections
        var fontSize = 0
        cell.xyCoordinate = [column, row]
        
        if viewControllerType == .timetable || viewControllerType == .deferralDates {
            if currentOrientation == "landscape" {
                if textFieldDisplayed{fontSize = 7} else {fontSize = 9}
                cell.titleLabel.font = UIFont.systemFont(ofSize: CGFloat(fontSize), weight: .ultraLight)
            }
        }
        
        if column < headerSections {
            cell.backgroundColor = headerColour
            
            if row >= headerRows {                                              /// time-of-day labels
                
                if timeBlockSize == 1 {
                    var ampm = ""
                    if row < headerRows + 12 {ampm = "am"}
                    else {ampm = "pm"}
                    cell.titleLabel.text = "\(amPmHours[row - headerRows])\(ampm)"
                }
                else {cell.titleLabel.text = dayQuarters[row - headerRows]}
                
                if timeBlockSize == 1 && textFieldDisplayed && currentOrientation == "landscape" {fontSize = 7} else {fontSize = 11} 
                cell.titleLabel.font = UIFont.systemFont(ofSize: CGFloat(fontSize), weight: .light)
            }
        }
        else {
            if row < headerRows {
                cell.backgroundColor = headerColour
                if row == 4 && viewControllerType == .timetable
                    || row == 4  && viewControllerType == .deferralDates {
                    cell.titleLabel.text = headerWeekdayTitles[column - 1]
                    
                    if textFieldDisplayed && currentOrientation == "landscape" {fontSize = 7} else {fontSize = 12}
                    cell.titleLabel.font = UIFont.systemFont(ofSize: CGFloat(fontSize), weight: .light)
                }
            }
            
            if row >= (headerRows - 3) { /// since cell dates are set in the 3 rows above the cell representing 12am (the first non-header cell)
                timeBlockDateSetup(cell: cell, column: column, row: row, layout: customLayout)
                
                if row == customLayout.rows - 1 && column == customLayout.cols - 1 {          /// so it's called on the FINAL cell dequeued
                    processTimeBlocksSinceLastLogin(layout: customLayout)
                }
            }
        }
        
        if viewControllerType == .archive {cell.backgroundColor = defaultColour}
        
        return cell
    }
}

///For cell title label text truncation
/*if row == 5 && column == 1 {
 if viewControllerType == .hours {findAverageLetterWidthWithCellLabelFont(cell: cell)} /// done here so it's only called once, but can access a cell
 }*/

