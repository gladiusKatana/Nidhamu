// ShowDates        ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension CollectionVC {
    
    func showKeyTimeBlockDates(cell: CustomCell, layout: CustomFlowLayout) {
        
        let column = cell.xyCoordinate[0];  let row = cell.xyCoordinate[1]          /// for now: could also just pass in row & column from caller
        
        if row == earliestTaskAddress[1] && column == earliestTaskAddress[0] {
            cell.layer.borderColor = UIColor.white.cgColor                          //; print("highlighted cell white")
            if let tasks = tasksAtIndexPath[TimeBlock(values:(column, row))], tasks.count > 1 {
                cell.titleLabel.text = "(\(taskIndex + 1)/\(tasks.count))"          ///= "(\(tasks.count - tasksInBlockToBeProcessed + 1)/\(tasks.count))"
                cell.titleLabel.font = defaultTimetableCellFont
            }
            else {cell.titleLabel.text = globalTaskIdentifier}                      /// when evets.count == 1, can just use previously set task's description via this var
        }
//        else {
//            let cellWeekday = Calendar.current.component(.weekday, from: cell.cellDate)
//            let cellHour = Calendar.current.component(.hour, from: cell.cellDate)
//
//            let thisWeekday = Calendar.current.component(.weekday, from: Date())
//            let thisHour = Calendar.current.component(.hour, from: Date())
//
//            let lastLoginWeek = Calendar.current.component(.weekday, from: lastLoginDate)
//            let lastLoginHour = Calendar.current.component(.hour, from: lastLoginDate)
//
//            switch (cellWeekday, cellHour) {
//
//            case (thisWeekday, thisHour) :
//                var nowString = showTimeInTitleLabels(cell.cellDate)
//                if truncateMinutesOf(cell.cellDate) == truncateMinutesOf(springForwardDate)
//                    && ((column, row) == (nowColumn, nowRow + 1))
//                {
//                    nowString = "-"
//                }
//                pryntConditionalKeyDateID(nowString, cell: cell, row: row, column: column)     ///;print("verified now cell @ [\(column),\(row)]")
//
//                cell.backgroundColor = subtleBlue ///cell.layer.borderColor = graySeven.cgColor
//
//            case (lastLoginWeek, lastLoginHour):  ///break
//                pryntConditionalKeyDateID("Last login", cell: cell, row: row, column: column)
//                ///cell.titleLabel.font = UIFont.systemFont(ofSize: 9, weight: .ultraLight) ///; cell.backgroundColor = lastLoginDimOrange
//
//            default: break
//            }
//        }
    }
    
    func showNowCell(_ cell: CustomCell, column: Int, row: Int, forSpringForward: Bool) {
        let nowString = showTimeInTitleLabels(Date())
        pryntConditionalKeyDateID(nowString, cell: cell, row: row, column: column)     ///;print("verified now cell @ [\(column),\(row)]")
    }
    
    func pryntConditionalKeyDateID(_ id: String, cell: CustomCell, row: Int, column: Int) {
        if tasksAtIndexPath[TimeBlock(values:(column, row))] == nil {
            cell.titleLabel.text = id
        }
    }
    
    func showDateInTitleLabels(date: Date, cell: CustomCell) {  /// for testing
        cell.titleLabel.text = (formattedDateString(date, roundedDown: false, showYear: true,
                                                    prefix: "", suffix: "", dateFormat: .monthAndDay))
    }
    
    func showTimeInTitleLabels(_ date: Date) -> String {
        return formattedDateString(date, roundedDown: true, showYear: false, prefix: "", suffix: "", dateFormat: .timeOnly)
    }
}

