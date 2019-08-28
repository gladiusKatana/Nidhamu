// CellUI           ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension CollectionVC {
    
    func setDefaultColours (cell: CustomCell, layout: CustomFlowLayout, cellIsInHeader: Bool) {
        
        if cellIsInHeader
            || self.vcType == .hours
            && (1 ..< layout.lockedHeaderRows).contains(cell.xyCoordinate[1])
        {
            cell.backgroundColor = headerColour;                //cell.layer.borderColor = UIColor.clear.cgColor
            cell.titleLabel.font = defaultTimetableCellFont;    cell.titleLabel.textColor = headerTextDefaultColour
        }
        else {
            cell.backgroundColor = cellDefaultColour;  cell.cellColour = cellDefaultColour
            cell.titleLabel.textColor = cellTextDefaultColour
            //animateCellColourBack(cell:cell, originalColour: cell.cellColour) //*
        }
    }
    
    func setTimeAndDayLabels (cell: CustomCell, column: Int, row: Int, layout: CustomFlowLayout) {
        
        let headerRows = layout.lockedHeaderRows
        
        if column == 0
            && row > (headerRows - 1)
            && row < layout.rows {
            
            var ampm = ""
            
            if row < 13 {
                ampm = "am"
            }
            else {
                ampm = "pm"
            }
            
            cell.titleLabel.text = "\(hoursOfTheDay[row - headerRows])\(ampm)"
        }
            
        else if row == 0 && column > 0 {
            cell.titleLabel.text = weekdaysAbbreviated[column - 1]
        }
            
        else {} // empty on purpose; this is the only time this is done in this program, haha
    }
}

