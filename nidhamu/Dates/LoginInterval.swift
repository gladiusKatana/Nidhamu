// LoginInterval    ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension CollectionVC {
    
    func processTasksBasedOnLoginInterval(cell: CustomCell, column: Int, row: Int, layout: CustomFlowLayout) {
        
        var dstShift = TimeInterval(0)
        var springForwardExtraHour = 0.0
        var fallBackExtraHour = 0.0
        
        let truncLastLogin = truncateMins(lastLoginDate)
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
        
        let oneWeekAgo = truncateMins(cell.cellDate) - TimeInterval(86400 * 7) /// * truncate only the cell's cell-date-- not the large time interval term
        
        //if (layout.cols - 1, layout.rows - 1) == (column, row) {print("dst shift = \(dstShift)")}
        
        
        if oneWeekAgo.isBetween(truncLastLogin + dstShift, and: truncateMins(Date() + dstShift)) {
            
            //if !cached BlocksAndTheirPaths {    // only needed if doing the animation below
            //if column < nowColumn || (column == nowColumn && row < nowRow) {cell.backgroundColor = .green; cell.cellColour = .green}
            //else {                              // line above is purely for testing purposes
            
            cell.backgroundColor = lastLoginDimOrange; cell.cellColour = lastLoginDimOrange
            
            //}
            //animateCellColourBack(cell: cell, delay: 3, duration: 10)
            //}
            
            ///showDateInTitleLabels(date: oneWeekAgo, cell: cell)   // useful for testing
            
            prepareToProcessTasksSinceLastLogin(cell: cell, column: column, row: row)
        }
    }
}

