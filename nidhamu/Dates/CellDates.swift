// CellDates        ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension CollectionVC {
    
    func setHourlyCellDates(cell: CustomCell, column: Int, row: Int, layout: CustomFlowLayout, looping: Bool, withColours: Bool) {
        cell.cellDate = setCellDate(baseDate: Date(), cellOffset: layout.lockedHeaderRows - row, cell: cell,
                                    column: column, row: row, layout: layout, looping: looping, withColours: withColours)
        
        if [2, 3, 4].contains(row) {
            setupHeaderDateLabels(cell: cell, column: column, row: row, layout: layout, looping: looping, withColours: withColours)
        }
        else {
            cell.cellDate = setCellDate(baseDate: Date(), cellOffset: 0,
                                        cell: cell, column: column, row: row, layout: layout, looping: looping, withColours: withColours)
            
            if vcType != .deferralDates {processEventsBasedOnLoginInterval(cell: cell, column: column, row: row, layout: layout)}
            
            if vcType == .deferralDates {showTimeInTitleLabels(cell: cell)}
        }
        
        if row >= layout.lockedHeaderRows && vcType != .deferralDates {
            showKeyTimeBlockDates(cell: cell)
        }
        
        if [column, row] == selectedTimeBlockPath {
            if textFieldDisplayed {
                cell.backgroundColor = eventAddingColour
                showTimeInTitleLabels(cell: cell)
            }
        }
    }
    
    func setupHeaderDateLabels(cell: CustomCell, column: Int, row: Int, layout: CustomFlowLayout, looping: Bool, withColours: Bool) {
        if row == 2 {
            cell.cellDate = setCellDate(baseDate: Date(), cellOffset: 3, cell: cell,
                                        column: column, row: row, layout: layout, looping: looping, withColours: withColours)
            if column <= nowColumn {
                cell.backgroundColor = lastWeekColour
                if nowRow == 5 { /// if current time is in the 12am time-block, there are no next-week cells above the now-cell on this day-column
                    if column == nowColumn{cell.backgroundColor = cellDefaultColour}
                    else {showDateInTitleLabels(date: cell.cellDate , cell: cell)}
                }
                else {showDateInTitleLabels(date: cell.cellDate , cell: cell)}
            }
            else {cell.backgroundColor = cellDefaultColour}
        }
            
        else if row == 3 {
            if column < nowColumn {cell.backgroundColor = lastWeekColour}
            else {                 cell.backgroundColor = cellDefaultColour
                if column == nowColumn {
                    let lastWeekDate = Date() - TimeInterval(86400 * 7)
                    cell.cellDate = setCellDate(baseDate: lastWeekDate, cellOffset: 2, cell: cell,
                                                column: column, row: row, layout: layout, looping: looping, withColours: withColours)
                    showDateInTitleLabels(date: cell.cellDate, cell: cell)
                } else {
                    if column > nowColumn {
                        cell.cellDate = setCellDate(baseDate: Date(), cellOffset: 2, cell: cell,
                                                    column: column, row: row, layout: layout, looping: looping, withColours: withColours)
                        showDateInTitleLabels(date: cell.cellDate, cell: cell)
                    }
                }
            }
        }
        else if row == 4 {} /// row 3 is covered by the general formula on line 8; this is just to exclude it from the else{}
    }
}

