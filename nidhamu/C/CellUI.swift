// CellUI           ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension CollectionVC {
    
    func setCellColours (cell: CustomCell, cellIsInHeader: Bool) {
        if cellIsInHeader {
            cell.backgroundColor = headerColour;    cell.layer.borderColor = UIColor.clear.cgColor
            cell.titleLabel.textColor = platinum;   cell.titleLabel.font = defaultTimetableCellFont
        }
        else {
            guard cell.xyCoordinate != selectedTimeBlockPath else {
                cell.backgroundColor = headerColour; return
            }
            cell.backgroundColor = cellDefaultColour; cell.cellColour = cellDefaultColour
            animateCellColourBack(cell:cell, originalColour: cell.cellColour)
            cell.titleLabel.textColor = cellTextDefaultColour
        }
    }
    
    func setTimeAndDayLabels (cell: CustomCell, column: Int, row: Int, layout: CustomFlowLayout) {
        if column == 0 && row > 0 {
            var ampm = ""; if row < 13 {ampm = "am"} else {ampm = "pm"}
            cell.titleLabel.text = "\(hoursOfTheDay[row - 1])\(ampm)"
        }
        else if row == 0 && column > 0 {cell.titleLabel.text = weekdaysAbbreviated[column - 1]}
    }
    
}

