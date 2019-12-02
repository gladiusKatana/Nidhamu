// CellDates        ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension CollectionVC { /// probably will refactor this whole file soon
    
    func setHourlyCellDates(cell: CustomCell, column: Int, row: Int, layout: CustomFlowLayout, looping: Bool, withColours: Bool) {
//        cell.cellDate = setCellDate(baseDate: Date(), cellOffset: layout.lockedHeaderRows - row, cell: cell,
//                                    column: column, row: row, layout: layout, looping: looping, withColours: withColours)
        
//        if ![2, 3, 4].contains(row) {
            let offset = (row < layout.lockedHeaderRows) ? layout.lockedHeaderRows - row : 0
        
            cell.cellDate = setCellDate(baseDate: Date(), cellOffset: offset,
                                        cell: cell, column: column, row: row, layout: layout, looping: looping, withColours: withColours)
            
            if row >= layout.lockedHeaderRows && viewControllerType != .deferralDates {
                showKeyTimeBlockDates(cell: cell)
            }
            
            if viewControllerType != .deferralDates {processTasksBasedOnLoginInterval(cell: cell, column: column, row: row, layout: layout)}
//        }
//        else {
//            setupHeaderDateLabels(cell: cell, column: column, row: row, layout: layout, looping: looping, withColours: withColours)
//        }
        
        if [column, row] == selectedTimeBlockPath {
            if textFieldDisplayed {
                cell.backgroundColor = taskAddingColour
                cell.titleLabel.text = showTimeInTitleLabels(cell.cellDate)
            }
        }
        
//        if [2, 3].contains(row) {
//            //showDateInTitleLabels(date: cell.cellDate, cell: cell)
//            //cell.titleLabel.text = showTimeInTitleLabels(cell.cellDate)
//
//            if row == 3 && column == nowColumn {
//                let lastWeekDate = setCellDate(baseDate: Date() - TimeInterval(86400 * 7), cellOffset: layout.lockedHeaderRows - row, cell: cell,
//                                               column: column, row: row, layout: layout, looping: looping, withColours: withColours)
//                cell.cellDate = lastWeekDate
//                showDateInTitleLabels(date: cell.cellDate, cell: cell)
//                cell.titleLabel.text = showTimeInTitleLabels(cell.cellDate)
//            }
//        }
//        else {
//
//        }
        
        if row == 3 && column == nowColumn {
            
            let tz = NSTimeZone.local
            let dt = cell.cellDate
            let dtPlusFour = dt + TimeInterval(3600 * 4)
            let springForwardHeaderShift = tz.isDaylightSavingTime(for: dtPlusFour) ? 1.0 : 0
            
            cell.cellDate = setCellDate(baseDate: Date() - TimeInterval(86400 * 7) + TimeInterval(3600 * springForwardHeaderShift), cellOffset: offset,
                                        cell: cell, column: column, row: row, layout: layout, looping: looping, withColours: withColours)
            ///print("at \(column),\(row); dstHeaderShift = \(springForwardHeaderShift)")
        }
        
        if row == 3 && column >= nowColumn
            || row == 2 && column <= nowColumn
        {
            //cell.titleLabel.text = showTimeInTitleLabels(cell.cellDate)
            showDateInTitleLabels(date: cell.cellDate, cell: cell)
        }
        
        if row > layout.lockedHeaderRows - 1
        {
            cell.titleLabel.text = showTimeInTitleLabels(cell.cellDate)
            //showDateInTitleLabels(date: cell.cellDate, cell: cell)
        }
        
    }
    
    
//    func setupHeaderDateLabels(cell: CustomCell, column: Int, row: Int, layout: CustomFlowLayout, looping: Bool, withColours: Bool) {
//        if row == 2 {
//            cell.cellDate = setCellDate(baseDate: Date(), cellOffset: 3, cell: cell,
//                                        column: column, row: row, layout: layout, looping: looping, withColours: withColours)
//            if column <= nowColumn {
//                cell.backgroundColor = lastWeekColour
//                if nowRow == 5 { /// if current time is in the 12am time-block, there are no next-week cells above the now-cell on this day-column
//                    if column == nowColumn{cell.backgroundColor = cellDefaultColour}
//                    else {showDateInTitleLabels(date: cell.cellDate , cell: cell)}
//                }
//                else {showDateInTitleLabels(date: cell.cellDate , cell: cell)}
//            }
//            else {cell.backgroundColor = cellDefaultColour}
//        }
//
//        else if row == 3 {
//            if column < nowColumn {cell.backgroundColor = lastWeekColour}
//            else {                 cell.backgroundColor = cellDefaultColour
//                if column == nowColumn {
////                    let lastWeekDate = Date() - TimeInterval(86400 * 7)
////                    cell.cellDate = setCellDate(baseDate: lastWeekDate, cellOffset: 2, cell: cell,
////                                                column: column, row: row, layout: layout, looping: looping, withColours: withColours)
//                    let lastWeekDate = setCellDate(baseDate: Date() - TimeInterval(86400 * 7), cellOffset: layout.lockedHeaderRows - row, cell: cell,
//                                                                    column: column, row: row, layout: layout, looping: looping, withColours: withColours)
//                    cell.cellDate = lastWeekDate
//                    showDateInTitleLabels(date: cell.cellDate, cell: cell)
//                } else {
//                    if column > nowColumn {
////                        cell.cellDate = setCellDate(baseDate: Date(), cellOffset: 2, cell: cell,
////                                                    column: column, row: row, layout: layout, looping: looping, withColours: withColours)
//                        showDateInTitleLabels(date: cell.cellDate, cell: cell)
//                    }
//                }
//            }
//        }
//        else if row == 4 {} /// row 3 is covered by the general formula on line 8; this is just to exclude it from the else{}
//    }
    
}

