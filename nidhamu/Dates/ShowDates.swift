// ShowDates        ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension CollectionVC {
    
    func sweepLoginInterval(cell: CustomCell, column: Int, row: Int, layout: CustomFlowLayout) -> Bool {
        springForwardExtraHour = 0.0; fallBackExtraHour = 0.0
        
        var dstShift = TimeInterval(0)
        
        let roundedLastLoginRow = Calendar.current.component(.hour, from: lastLoginDate) / timeBlockSize  ///; print("last login row: \(roundedLastLoginRow)")
        let year = Calendar.current.component(.year, from: lastLoginDate)
        let month = Calendar.current.component(.month, from: lastLoginDate)
        let day = Calendar.current.component(.day, from: lastLoginDate)
        
        if timeBlockSize == 1 {timeBlockRoundedLastLogin = lastLoginDate}
        else {
            timeBlockRoundedLastLogin = makeDateFrom(year: year, month: month, day: day, hr: roundedLastLoginRow * timeBlockSize, min: 0, sec: 0)
        }
        
        let tz = NSTimeZone.local
        
        if !(tz.isDaylightSavingTime(for: lastLoginDate))
            && tz.isDaylightSavingTime(for: Date()) {
            springForwardExtraHour = -1
        }
        
        if tz.isDaylightSavingTime(for: lastLoginDate)
            && !(tz.isDaylightSavingTime(for: Date())) {
            fallBackExtraHour = 1
        }
        
        dstShift = (dstOffset + springForwardExtraHour + fallBackExtraHour) * TimeInterval(3600)
        let oneWeekAgo = truncateMins(cell.cellDate) - TimeInterval(86400 * 7)      /// * truncate only the cell's cell-date-- not the large time interval term
        //if (layout.cols - 1, layout.rows - 1) == (column, row) {print("dst shift = \(dstShift)")}
        return oneWeekAgo.isBetween(timeBlockRoundedLastLogin + dstShift, and: truncateMins(Date() + dstShift))
    }
    
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
    }
    
    func showNowCell(_ cell: CustomCell, column: Int, row: Int, forSpringForward: Bool) {
        if tasksAtIndexPath[TimeBlock(values:(column, row))] == nil {
            cell.titleLabel.text = showTimeInTitleLabels(Date())
        }                                                                           ///;print("verified now cell @ [\(column),\(row)]")
    }
    
    func showDateInTitleLabels(date: Date, cell: CustomCell) {  /// for testing
        cell.titleLabel.text = (formattedDateString(date, roundedDown: false, showYear: true,
                                                    prefix: "", suffix: "", dateFormat: .monthAndDay))
    }
    
    func showTimeInTitleLabels(_ date: Date) -> String {
        return formattedDateString(date, roundedDown: false, showYear: false, prefix: "", suffix: "", dateFormat: .hourAndMinute)
    }
}

