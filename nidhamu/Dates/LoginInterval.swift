// LoginInterval    ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

//var dstShift = TimeInterval(0)

extension CollectionVC {
    
    func processTasksBasedOnLoginInterval(cell: CustomCell, column: Int, row: Int, layout: CustomFlowLayout) {
        
        let oneWeekAgo = truncateMinutesOf(cell.cellDate) - TimeInterval(86400 * 7)     /// Note, truncate ONLY the cell's cell-date-- not the large time interval term
        var dstShift = TimeInterval(0)
        
        let truncDate = truncateMinutesOf(Date());  let truncLastLogin = truncateMinutesOf(lastLoginDate)
        let truncFallBack = truncateMinutesOf(fallBackDate)
        let truncSpringForward = truncateMinutesOf(springForwardDate)
        ///let truncPrevSpringForward = truncateMinutesOf(previousSpringForwardDate) //+ TimeInterval(3600)
        
        
        if truncDate == truncFallBack {
            dstShift = TimeInterval(3600)
        }
            
        else if truncLastLogin < truncFallBack && truncDate < truncFallBack {
            if truncLastLogin < truncateMinutesOf(previousFallBackDate) {
                dstShift = 0
                previousFallBackDate = fallBackDate /// by this time the fall-back date has been reset
            }
            else {dstShift = TimeInterval(3600)}
        }
            
        else {dstShift = TimeInterval(0)                                                        ; print("dst interval undefined")}
        
        
//        if truncLastLogin < truncSpringForward && truncDate <= truncSpringForward {
//            if truncLastLogin < truncateMinutesOf(previousSpringForwardDate) {
//                dstShift = TimeInterval(-3600)
////                previousSpringForwardDate = springForwardDate
//            }
//            else {dstShift = TimeInterval(3600)}
//        }
//
//        else {dstShift = TimeInterval(-3601)}
        
        
//        if truncLastLogin < truncPrevSpringForward && truncDate < truncPrevSpringForward {
//            dstShift = TimeInterval(-3600)
//        }
//        else {dstShift = TimeInterval(3600)}
        
        
        if (layout.cols - 1, layout.rows - 1) == (column, row) {print("dst shift = \(dstShift)")}
        
        if oneWeekAgo.isBetween(truncLastLogin + dstShift, and: truncateMinutesOf(Date() + dstShift)) {
            
            //print("login interval sweep [\(column),\(row)] (dst shift \(dstShift); dst offset = \(dstOffset))")
            
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

