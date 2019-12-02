// CellDates        ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension CollectionVC { /// probably will refactor this whole file soon
    
    func setHourlyCellDates(cell: CustomCell, column: Int, row: Int, layout: CustomFlowLayout, looping: Bool, withColours: Bool) {
        
        let offset = (row < layout.lockedHeaderRows) ? layout.lockedHeaderRows - row : 0
        
        cell.cellDate = setCellDate(baseDate: Date(), cellOffset: offset,
                                    cell: cell, column: column, row: row, layout: layout, looping: looping, withColours: withColours)
        
        if row >= layout.lockedHeaderRows && viewControllerType != .deferralDates {
            showKeyTimeBlockDates(cell: cell)
            if viewControllerType != .deferralDates {processTasksBasedOnLoginInterval(cell: cell, column: column, row: row, layout: layout)}
        }
        
        if [column, row] == selectedTimeBlockPath {
            if textFieldDisplayed {
                cell.backgroundColor = taskAddingColour
                //cell.titleLabel.text = showTimeInTitleLabels(cell.cellDate)
            }
        }
        
        if row == 3 && column == nowColumn {
            let tz = NSTimeZone.local
            let dstPlusFour = cell.cellDate + TimeInterval(3600 * 4)
            let springForwardHeaderShift = tz.isDaylightSavingTime(for: dstPlusFour) ? 1.0 : 0
            
            cell.cellDate = setCellDate(baseDate: Date() - TimeInterval(86400 * 7) + TimeInterval(3600 * springForwardHeaderShift), cellOffset: offset, cell: cell, column: column, row: row, layout: layout, looping: looping, withColours: withColours)
            ///print("at \(column),\(row); dstHeaderShift = \(springForwardHeaderShift)")
        }
        
        if row == 2 && column <= nowColumn
            || row == 3 && column >= nowColumn
        {
            //cell.titleLabel.text = showTimeInTitleLabels(cell.cellDate)
            showDateInTitleLabels(date: cell.cellDate, cell: cell)
            
            if row == 2 && column <= nowColumn {cell.backgroundColor = lastWeekColour}
            else if row == 3 && column >= nowColumn {cell.backgroundColor = cellDefaultColour}
            else {}
        }
        
        //        if row > layout.lockedHeaderRows - 1 {
        //            //cell.titleLabel.text = showTimeInTitleLabels(cell.cellDate)
        //            //showDateInTitleLabels(date: cell.cellDate, cell: cell)
        //        }
    }
}

