// CellDates        ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension CollectionVC { /// probably will refactor this whole file soon
    
    func setHourlyCellDates(cell: CustomCell, column: Int, row: Int, layout: CustomFlowLayout, looping: Bool, withColours: Bool) {
        
        guard viewControllerType != .archive else {return}
        
        let offset = (row < layout.lockedHeaderRows) ? layout.lockedHeaderRows - row : 0
        var cellDateIsNextWeek = false; var cellDateIsLastLogin = false
        
        (cell.cellDate, cellDateIsNextWeek, cellDateIsLastLogin) = setCellDate(baseDate: Date(), cellOffset: offset,
                                                                               cell: cell, column: column, row: row, layout: layout, looping: looping, withColours: withColours)
        if row >= layout.lockedHeaderRows {
            
            if [column, row] == selectedTimeBlockPath && textFieldDisplayed {
                if viewControllerType != .deferralDates {cell.backgroundColor = taskAddingColour} //; cell.titleLabel.text = "+"
            } else {
                if viewControllerType == .timetable {
                    let cellDateIsBetweenLogins = sweepLoginInterval(dateToCheck: cell.cellDate, forTaskDeadline: false,
                                                                     column: column, row: row, layout: layout)
                    if //truncateMins(cell.cellDate) == truncateMins(Date())
                        //||
                        row == nowRow && column == nowColumn         /// these 2 conditionals are equivalent but the latter is calculated faster
                    {
                        cell.backgroundColor = cellDefaultColour; cell.cellColour = cellDefaultColour
                        cell.layer.borderColor = grayFour.cgColor; cell.layer.borderWidth = 3
                        showNowCell(cell, column: column, row: row, forSpringForward: false)
                        
                        if truncateMins(Date()) == truncateMins(springForwardDate) && (column, row) == (nowColumn, nowRow + 1) {
                            cell.titleLabel.text = "-"
                        }
                    } else {
                        if cellDateIsBetweenLogins {
                            if cellDateIsLastLogin {cell.titleLabel.text = "\n  last\n  login"}
                            cell.backgroundColor = dimOrange
                            prepareToProcessTasksSinceLastLogin(cell: cell, column: column, row: row)
                        } else {setCellColourBasedOnWeek(cell: cell, cellDateIsNextWeek: cellDateIsNextWeek)}
                    }
                    
                    if viewControllerType != .deferralDates {
                        showKeyTimeBlockDates(cell: cell, layout: layout)
                    }
                } else {setCellColourBasedOnWeek(cell: cell, cellDateIsNextWeek: cellDateIsNextWeek)}
            }
        } else {
            if row == 3 && column == nowColumn {
                let tz = NSTimeZone.local
                let dstPlusFour = cell.cellDate + TimeInterval(3600 * 4)
                let springForwardHeaderShift = tz.isDaylightSavingTime(for: dstPlusFour) ? 1.0 : 0
                
                (cell.cellDate, cellDateIsNextWeek, cellDateIsLastLogin) = setCellDate(baseDate: Date() - TimeInterval(86400 * 7) + TimeInterval(3600 * springForwardHeaderShift), cellOffset: offset, cell: cell, column: column, row: row, layout: layout, looping: looping, withColours: withColours)    //; print("at \(column),\(row); dstHeaderShift = \(springForwardHeaderShift)")
            }
            
            if row == 2 {
                if column <= nowColumn {
                    if !(nowRow == layout.lockedHeaderRows && column == nowColumn) {
                        showDateInTitleLabels(date: cell.cellDate, cell: cell)
                        cell.backgroundColor = greyoutForTimeBlocksPassedThisWeek; cell.cellColour = greyoutForTimeBlocksPassedThisWeek
                    } else {cell.backgroundColor = cellDefaultColour; cell.cellColour = cellDefaultColour}
                } else {cell.backgroundColor = cellDefaultColour; cell.cellColour = cellDefaultColour}
            }
            
            if row == 3 {
                if column >= nowColumn {
                    showDateInTitleLabels(date: cell.cellDate, cell: cell)
                    cell.backgroundColor = cellDefaultColour; cell.cellColour = cellDefaultColour
                }
                else {cell.backgroundColor = greyoutForTimeBlocksPassedThisWeek; cell.cellColour = greyoutForTimeBlocksPassedThisWeek}
            }
            
            ///if row == 4 {cell.backgroundColor = .orange} /// so that it isn't white (indistinguishable from what might be below it: no cell at that position)
        }
        
        //        if row > layout.lockedHeaderRows - 1 {
        //            cell.titleLabel.text = showTimeInTitleLabels(cell.cellDate)
        //            showDateInTitleLabels(date: cell.cellDate, cell: cell)
        //            cell.titleLabel.text = "\(dstOffset)"
        //        }
    }
    
    func setCellColourBasedOnWeek(cell: CustomCell, cellDateIsNextWeek: Bool) {
        if cellDateIsNextWeek {cell.backgroundColor = greyoutForTimeBlocksPassedThisWeek; cell.cellColour = greyoutForTimeBlocksPassedThisWeek}
        else {cell.backgroundColor = cellDefaultColour;  cell.cellColour = cellDefaultColour}
    }
}

