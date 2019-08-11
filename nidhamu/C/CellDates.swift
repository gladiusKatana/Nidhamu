// CellDates        ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension CollectionVC {
    
    func setupHourlyCells(cell: CustomCell, column: Int, row: Int, layout: CustomFlowLayout, looping: Bool, withColours: Bool) {
        
        let hoursFromNow = TimeInterval(3600 * (row - nowRow))
        let daysFromNow = TimeInterval(86400 * (column - nowColumn))
        var weekAheadInt = 0
        
        if looping {weekAheadInt = setCellWeek(cell: cell, column: column, row: row, layout: layout, withColours: withColours)}
        let potentialWeekAhead = TimeInterval(86400 * 7 * weekAheadInt)
        cell.titleLabel.font = defaultTimetableCellFont
        
        if row == 1 {
            let displayCellDate = Date() + hoursFromNow + daysFromNow + potentialWeekAhead + TimeInterval(3600)
            showDateInTitleLabels(date: displayCellDate, cell: cell)
        }
        else {
            cell.cellDate = Date() + hoursFromNow + daysFromNow + potentialWeekAhead // dates not actually rounded: just displayed rounded sometimes
            processEventBasedOnDateRange(cell: cell, column: column, row: row, layout: layout)
            //showDateInTitleLabels(date: cell.cellDate, cell: cell)
        }
        
        if let earliestEventAddress = pathsToProcess.first {
            if row == earliestEventAddress[1] && column == earliestEventAddress[0] {
                cell.layer.borderColor = UIColor.white.cgColor
                cell.layer.borderWidth = 2
            } else {cell.layer.borderColor = UIColor.clear.cgColor}
        } else {cell.layer.borderColor = UIColor.clear.cgColor}
    }
    
    func setCellWeek(cell: CustomCell, column: Int, row: Int, layout: CustomFlowLayout, withColours: Bool) -> Int {
        var weekAhead = 0
        
        if column < nowColumn || column == nowColumn && row < nowRow {
            if withColours && row != 1 {
                cell.backgroundColor = lastWeekColour; cell.cellColour = lastWeekColour
            }
            weekAhead = 1
        }
        return weekAhead
    }
    
    func showDateInTitleLabels(date: Date, cell: CustomCell) {
        let mo = monthsAbbreviated[Calendar.current.component(.month, from: date) - 1]
        let dy = Calendar.current.component(.day, from: date)
        cell.titleLabel.text = "\(mo) \(dy)"
    }
    
    /*func showNowCell(cell: CustomCell, column: Int, row: Int) {
     if row == nowRow && column == nowColumn { print("now-cell is at [\(column), \(row)]")}
     //presentPopupViewToMarkEvents(column: column, row: row) //! // testing popup window; not the typical condition under which it pops up
     }*/
}
