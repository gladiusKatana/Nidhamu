// LoginInterval    ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension CollectionVC {
    
    func processEventsBasedOnLoginInterval(cell: CustomCell, column: Int, row: Int, layout: CustomFlowLayout) {
        
        let oneWeekAgo = truncateMinutesOfDate(cell.cellDate - TimeInterval(86400 * 7))
        
        if oneWeekAgo >= truncateMinutesOfDate(lastLoginDate) && oneWeekAgo < truncateMinutesOfDate(Date()) { //     ...ie, not rounded
            
            //if !saved TimeBlocksForProcessing { // this conditional would only be needed if doing the animation below
            //if column < nowColumn || (column == nowColumn && row < nowRow) {cell.backgroundColor = .green; cell.cellColour = .green}
            //else { // the  if  on the line above is purely for testing purposes
            cell.backgroundColor = orangeForBlocksSinceLastLogin; cell.cellColour = orangeForBlocksSinceLastLogin
            //}
            //animateCellColourBack(cell: cell, delay: 3, duration: 10)
            //}
            
            ///showDateInTitleLabels(date: oneWeekAgo, cell: cell)   // useful for testing
            prepareToProcessEventsSinceLastLogin(cell: cell, column: column, row: row)
        }
        
        checkDateStringMatchAndPrintLabel("last login", date: lastLoginDate, cell: cell, withBorder: false)
        
        if row == earliestEventAddress[1] && column == earliestEventAddress[0] {
            cell.layer.borderColor = UIColor.white.cgColor                                              //; print("highlighted cell white")
        }
        
    }
    
    func checkDateStringMatchAndPrintLabel(_ label: String, date: Date, cell: CustomCell, withBorder: Bool) {
        let truncatedDate = truncateMinutesOfDate(date)
        if Calendar.current.component(.hour, from: cell.cellDate) == Calendar.current.component(.hour, from: truncatedDate)
            && Calendar.current.component(.weekday, from: cell.cellDate) == Calendar.current.component(.weekday, from: truncatedDate) {
            cell.titleLabel.text = label
            cell.titleLabel.font = UIFont.systemFont(ofSize: 8, weight: .ultraLight)
            if withBorder{cell.layer.borderColor = UIColor.black.cgColor}
        }
    }
    
    func prepareToProcessEventsSinceLastLogin(cell: CustomCell, column: Int, row: Int) {
        if let events = eventsAtIndexPath[TimeBlock(values:(column, row))] { ///cell.backgroundColor = jadeGreen; cell.cellColour = jadeGreen
            if !savedTimeBlocksForProcessing {
                if !eventArraysToProcess.contains(events) {eventArraysToProcess.append(events)}
                ///else {print("event array-of-arrays already contains events: \(events)")}
                
                if !pathsToProcess.contains([column, row]) {pathsToProcess.append([column, row])}
                ///else {print("path array-of-arrays already contains path: \([column, row])")}
            }
            if row >= 19 {thereWillBeARowException = true}
        }
    }
}

