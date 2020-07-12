// LoginInterval    ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension CollectionVC {
    
    func sweepLoginInterval(dateToCheck: Date, forEventDeadline: Bool,
                            column: Int?, row: Int?, layout: CustomFlowLayout?) -> Bool { /// last 3 parameters only used for print near method bottom
        
        springForwardExtraHour = 0.0; fallBackExtraHour = 0.0
        
        var dstShift = TimeInterval(0)
        let roundedLastLoginRow = Calendar.current.component(.hour, from: lastLoginDate) / timeBlockSize
        let year = Calendar.current.component(.year, from: lastLoginDate)                 ///; print("last login row: \(roundedLastLoginRow)")
        let month = Calendar.current.component(.month, from: lastLoginDate)
        let day = Calendar.current.component(.day, from: lastLoginDate)
        
        //if timeBlockSize == 1 {timeBlockRoundedLastLogin = lastLoginDate} else {
        timeBlockRoundedLastLogin = makeDateFrom(year: year, month: month, day: day, hr: roundedLastLoginRow * timeBlockSize, min: 0, sec: 0)
        //}
        
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
        
        let weekOffset = forEventDeadline ? 0 : TimeInterval(86400 * 7)
        let oneWeekAgo = truncateMins(dateToCheck) - weekOffset     /// * truncate only the cell's cell-date-- not the large time interval term
        
        let lowerDateBound = timeBlockRoundedLastLogin + dstShift
        let upperDateBound = truncateMins(Date() + dstShift)        /// could round current date too (based on time block size, as with last login date);...
        /// entire commented block of code below is for printing                                                                           ///... should not change logic
        /*let deadlineBoolString = forEventDeadline ? " (for event deadline)" : ""
         let upperDateBoundString = formattedDateString(upperDateBound, roundedDown: false,
         showYear: false, prefix: "", suffix: "", dateFormat: .fullDayShortFormNoDots)
         let lowerDateBoundString = formattedDateString(lowerDateBound, roundedDown: false, showYear: false, prefix: "", suffix: "", dateFormat: .fullDayShortFormNoDots)
         
         if let layout = layout, let row = row, let column = column {
         if (layout.cols - 1, layout.rows - 1) == (column, row) && lowerDateBoundString != upperDateBoundString {
         print("\nsweeping date interval\(deadlineBoolString),\nbetween & including:\(lowerDateBoundString) & \(upperDateBoundString)")
         }
         } else {print("\nsweeping date interval\(deadlineBoolString),\nbetween & including:\(lowerDateBoundString) & \(upperDateBoundString)")}*/
        return oneWeekAgo.isBetween(lowerDateBound, and: upperDateBound)
    }
}

