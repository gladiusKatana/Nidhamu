// CellDates        ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension CollectionVC { /// probably will refactor this whole file soon
    
    func setHourlyCellDates(cell: CustomCell, column: Int, row: Int, layout: CustomFlowLayout, looping: Bool, withColours: Bool) {
        
        let offset = (row < layout.lockedHeaderRows) ? layout.lockedHeaderRows - row : 0
        var cellDateIsNextWeek = false; var cellDateIsLastLogin = false
        
        (cell.cellDate, cellDateIsNextWeek, cellDateIsLastLogin) = setCellDate(baseDate: Date(), cellOffset: offset,
                                                                               cell: cell, column: column, row: row, layout: layout, looping: looping, withColours: withColours)
        if row >= layout.lockedHeaderRows {
            
            if [column, row] == selectedTimeBlockPath && textFieldDisplayed {
                cell.backgroundColor = taskAddingColour
                cell.titleLabel.text = showTimeInTitleLabels(cell.cellDate)
            } else {
                let cellDateIsBetweenLogins = sweepLoginInterval(cell: cell, column: column, row: row, layout: layout)
                if truncateMins(cell.cellDate) == truncateMins(Date())
                    || row == nowRow && column == nowColumn         /// these 2 conditionals are equivalent but the latter is calculated faster
                {
                    cell.backgroundColor = subtleBlue
                    showNowCell(cell, column: column, row: row, forSpringForward: false)
                    
                    if truncateMins(Date()) == truncateMins(springForwardDate) && (column, row) == (nowColumn, nowRow + 1) {
                        cell.titleLabel.text = "-"
                    }
                } else {
                    if cellDateIsBetweenLogins {
                        if cellDateIsLastLogin {
                            cell.titleLabel.text = "last login"; cell.titleLabel.font = UIFont.systemFont(ofSize: 9, weight: .ultraLight)
                        }
                        cell.backgroundColor = lastLoginDimOrange; cell.cellColour = lastLoginDimOrange
                        
                        prepareToProcessTasksSinceLastLogin(cell: cell, column: column, row: row)
                    } else {
                        if cellDateIsNextWeek {cell.backgroundColor = lastWeekColour; cell.cellColour = lastWeekColour}
                        else {cell.backgroundColor = cellDefaultColour;  cell.cellColour = cellDefaultColour}
                    }
                }
                
                if viewControllerType != .deferralDates {
                    showKeyTimeBlockDates(cell: cell, layout: layout)
                }
            }
        } else {
            if row == 3 && column == nowColumn {
                let tz = NSTimeZone.local
                let dstPlusFour = cell.cellDate + TimeInterval(3600 * 4)
                let springForwardHeaderShift = tz.isDaylightSavingTime(for: dstPlusFour) ? 1.0 : 0
                
                (cell.cellDate, cellDateIsNextWeek, cellDateIsLastLogin) = setCellDate(baseDate: Date() - TimeInterval(86400 * 7) + TimeInterval(3600 * springForwardHeaderShift), cellOffset: offset, cell: cell, column: column, row: row, layout: layout, looping: looping, withColours: withColours)                        ///print("at \(column),\(row); dstHeaderShift = \(springForwardHeaderShift)")
            }
            
            if row == 2 {
                if column <= nowColumn {
                    if !(nowRow == layout.lockedHeaderRows && column == nowColumn) {
                        showDateInTitleLabels(date: cell.cellDate, cell: cell)
                        cell.backgroundColor = lastWeekColour
                    } else {cell.backgroundColor = cellDefaultColour}
                } else {cell.backgroundColor = cellDefaultColour}
            }
            
            if row == 3 {
                if column >= nowColumn {
                    showDateInTitleLabels(date: cell.cellDate, cell: cell)
                    cell.backgroundColor = cellDefaultColour
                }
                else {cell.backgroundColor = lastWeekColour}
            }
            
            ///if row == 4 {cell.backgroundColor = .orange} /// so that it isn't white (indistinguishable from what might be below it: having no cell at that position)
        }
        
        //        if row > layout.lockedHeaderRows - 1 {
        //cell.titleLabel.text = showTimeInTitleLabels(cell.cellDate) //; showDateInTitleLabels(date: cell.cellDate, cell: cell)
        //cell.titleLabel.text = "\(dstOffset)"
        //        }
    }
}

