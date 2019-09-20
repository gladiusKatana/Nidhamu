// LoginInterval    ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension CollectionVC {
    
    func processEventsBasedOnLoginInterval(cell: CustomCell, column: Int, row: Int, layout: CustomFlowLayout) {
        
        if [column, row] == selectedTimeBlockPath /*&& eventsAtIndexPath[TimeBlock(values:(column, row))] == nil*/ {
            if textFieldDisplayed {cell.backgroundColor = eventAddingColour}
        } else {
            let oneWeekAgo = truncateMinutesOfDate(cell.cellDate - TimeInterval(86400 * 7)) // since cell-dates are based off of Date()...
            if oneWeekAgo >= truncateMinutesOfDate(lastLoginDate) && oneWeekAgo < truncateMinutesOfDate(Date()) { //     ...ie, not rounded
                
                //if !saved TimeBlocksForProcessing { // this conditional would only be needed if doing the animation below
                //if column < nowColumn || (column == nowColumn && row < nowRow) {cell.backgroundColor = .green; cell.cellColour = .green}
                //else { // the  if  on the line above is purely for testing purposes
                cell.backgroundColor = orangeForBlocksSinceLastLogin; cell.cellColour = orangeForBlocksSinceLastLogin
                //}
                //animateCellColourBack(cell: cell, delay: 3, duration: 10)
                //}
                
                showDateInTitleLabels(date: oneWeekAgo, cell: cell)
                prepareToProcessEventsSinceLastLogin(cell: cell, column: column, row: row)
            }
            
            checkDateStringMatchAndPrintLabel("last login", date: lastLoginDate, cell: cell)
            checkDateStringMatchAndPrintLabel("now", date: Date(), cell: cell)
            
            if row == earliestEventAddress[1] && column == earliestEventAddress[0] {
                cell.layer.borderColor = UIColor.white.cgColor; cell.layer.borderWidth = 2      //; print("highlighted cell white")
            } else {cell.layer.borderColor = UIColor.clear.cgColor}
        }
    }
    
    func checkDateStringMatchAndPrintLabel(_ label: String, date: Date, cell: CustomCell) {
        let truncatedDate = truncateMinutesOfDate(date)
        if Calendar.current.component(.hour, from: cell.cellDate) == Calendar.current.component(.hour, from: truncatedDate)
            && Calendar.current.component(.weekday, from: cell.cellDate) == Calendar.current.component(.weekday, from: truncatedDate) {
            cell.titleLabel.text = label
            cell.titleLabel.font = UIFont.systemFont(ofSize: 8, weight: .ultraLight)
        }
    }
    
    func prepareToProcessEventsSinceLastLogin(cell: CustomCell, column: Int, row: Int) {
        if let events = eventsAtIndexPath[TimeBlock(values:(column, row))] { ///cell.backgroundColor = jadeGreen; cell.cellColour = jadeGreen
            
            if !savedTimeBlocksForProcessing {
                if !eventArraysToProcess.contains(events) {eventArraysToProcess.append(events)}
                if !pathsToProcess.contains([column, row]) {pathsToProcess.append([column, row])}
            }
            
            if row >= 19 {thereWillBeARowException = true}
        }
    }
}

