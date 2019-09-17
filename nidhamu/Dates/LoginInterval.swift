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
                cell.backgroundColor = niceOrangeLight; cell.cellColour = niceOrangeLight
                //}
                //animateCellColourBack(cell: cell, delay: 3, duration: 10)
                //}
                
                showDateInTitleLabels(date: oneWeekAgo, cell: cell)
                prepareToProcessEventsSinceLastLogin(cell: cell, column: column, row: row)
            }
            
            checkDateStringMatchAndPrintLabel("last login", date: lastLoginDate, cell: cell)
            checkDateStringMatchAndPrintLabel("now", date: Date(), cell: cell)
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
        if let events = eventsAtIndexPath[TimeBlock(values:(column, row))] {
            //cell.backgroundColor = jadeGreen; cell.cellColour = jadeGreen
            
            if !savedTimeBlocksForProcessing {
                if !eventArraysToProcess.contains(events) {eventArraysToProcess.append(events)}         //* see note below
                if !pathsToProcess.contains([column, row]) {pathsToProcess.append([column, row])}
            }
            
            if row >= 19 {thereWillBeARowException = true}
        }
    }
}
/*                                                                                                      * does not catch test case of:
 adding an event, advancing device date setting by 1 week, returning to app (now in event-marking mode), then ...changing your mind... and dismissing app to background again, only to reopen it and resume your event-tagging in a few moments... this test case causes the reload-CV method call that occurs upon resuming the app (even if the date hasn't changed) to sweep over all time blocks, in prepareToProcessEventsSinceLastLogin(:)... which repopulates the events-to-process array unnecessarily.  Current solution should work fine though (see processEventsSinceLastLogin(:) method.  Will monitor this over next few tests.⚔️    )*/

