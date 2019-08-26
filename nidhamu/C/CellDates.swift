// CellDates        ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension CollectionVC {
    
    func setupHourlyCells(cell: CustomCell, column: Int, row: Int, layout: CustomFlowLayout, looping: Bool, withColours: Bool) {

        cell.titleLabel.font = defaultTimetableCellFont
        
        if row == 1 {
            let displayCellDate = setDisplayCellDate(baseDate: Date(), cellOffset: 2, cell: cell,
                                                     column: column, row: row, layout: layout, looping: looping, withColours: withColours)
            if column <= nowColumn {showDateInTitleLabels(date: displayCellDate, cell: cell)}
        }
        else if row == 2 {
            if column == nowColumn {
                let lastWeekDate = Date() - TimeInterval(86400 * 7)
                let displayCellDate = setDisplayCellDate(baseDate: lastWeekDate, cellOffset: 2, cell: cell,
                                                         column: column, row: row, layout: layout, looping: looping, withColours: withColours)
                showDateInTitleLabels(date: displayCellDate, cell: cell)
            }
            if column > nowColumn {
                let displayCellDate = setDisplayCellDate(baseDate: Date(), cellOffset: 2, cell: cell,
                                                         column: column, row: row, layout: layout, looping: looping, withColours: withColours)
                showDateInTitleLabels(date: displayCellDate, cell: cell)
            }
        }
        else {
            cell.cellDate = setDisplayCellDate(baseDate: Date(), cellOffset: 0,
                                                 cell: cell, column: column, row: row, layout: layout, looping: looping, withColours: withColours)
            processEventBasedOnDateRange(cell: cell, column: column, row: row, layout: layout)
//            showDateInTitleLabels(date: cell.cellDate, cell: cell)
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
            if withColours
                && ![1,2].contains(row) {
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
}


/*func showNowCell(cell: CustomCell, column: Int, row: Int) {
 if row == nowRow && column == nowColumn { print("now-cell is at [\(column), \(row)]")}
 //presentPopupViewToMarkEvents(column: column, row: row) //! // testing popup window; not the typical condition under which it pops up
 }*/
