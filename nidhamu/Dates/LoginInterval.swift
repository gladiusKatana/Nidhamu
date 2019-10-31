// LoginInterval    ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension CollectionVC {
    
    func processTasksBasedOnLoginInterval(cell: CustomCell, column: Int, row: Int, layout: CustomFlowLayout) {
        
        let oneWeekAgo = truncateMinutesOf(cell.cellDate - TimeInterval(86400 * 7))
        
        if oneWeekAgo >= truncateMinutesOf(lastLoginDate)
            && oneWeekAgo < truncateMinutesOf(Date())
        {
            
            
            //            if !cached BlocksAndTheirPaths {    // this conditional would only be needed if doing the animation below
            //            if column < nowColumn || (column == nowColumn && row < nowRow) {cell.backgroundColor = .green; cell.cellColour = .green}
            //            else {                              // the  if  on the line above is purely for testing purposes
            
            
            cell.backgroundColor = orangeForBlocksSinceLastLogin; cell.cellColour = orangeForBlocksSinceLastLogin
            cell.titleLabel.font = defaultTimetableCellFont
            
            
            //            }
            //            animateCellColourBack(cell: cell, delay: 3, duration: 10)
            //            }
            
            ///showDateInTitleLabels(date: oneWeekAgo, cell: cell)   // useful for testing
            
            
            prepareToProcessTasksSinceLastLogin(cell: cell, column: column, row: row)
            
        }
        
    }
    
}

