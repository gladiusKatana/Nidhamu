// MLCellSetup      ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension CollectionVC {
    
    func multiLineCellSetup(cell: CustomCell, indexPath: IndexPath) -> CustomCell {
        
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
                
                getCellContents(cell: cell, column: column, row: row, layout: customLayout)
                
                if row == customLayout.rows - 1 && column == customLayout.cols - 1 {
                    processTasksSinceLastLogin(layout: customLayout) /// called on the FINAL cell dequeued
                }
            }
        }
        
        resetTitleLabel(cell: cell, row: row, col: column, layout: customLayout)
        testForCellBannerNotification(cell, row: row, col: column, notificationColour: nil, notificationText: nil)
        return cell
    }
}

