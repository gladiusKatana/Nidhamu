// LoginInterval    ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension CollectionVC {
    
    func processEventsBasedOnLoginInterval(cell: CustomCell, column: Int, row: Int, layout: CustomFlowLayout) {
        
        if [column, row] == selectedTimeBlockPath /*&& eventsAtIndexPath[TimeBlock(values:(column, row))] == nil*/ {
            if textFieldDisplayed {cell.backgroundColor = eventAddingColour}
        }
        else {
            let oneWeekAgo = truncateMinutesOfDate(cell.cellDate - TimeInterval(86400 * 7)) // since cells' cell-dates are based off of Date()...
            if oneWeekAgo >= truncateMinutesOfDate(lastLoggedInDate) && oneWeekAgo < truncateMinutesOfDate(Date()) { //     ...ie, not rounded
                
                //if !savedTimeBlocksForProcessing { // this conditional would only be needed if doing the animation below
                cell.backgroundColor = niceOrangeLight  //; cell.cellColour = niceOrangeLight
                //animateCellColourBack(cell: cell, delay: 3, duration: 10)
                //}
                
                if formattedDateString(lastLoggedInDate, roundedDown: true, prefix: "", suffix: "", dateFormat: .hourlyTimeBlock)
                    == formattedDateString(cell.cellDate, roundedDown: true, prefix: "", suffix: "", dateFormat: .hourlyTimeBlock) {
                    cell.titleLabel.text = "last login"
                    cell.titleLabel.font = UIFont.systemFont(ofSize: 8, weight: .ultraLight)
                }
                
                prepareToProcessEventsSinceLastLogin(cell: cell, column: column, row: row)
            }
            
            if Calendar.current.component(.hour, from: Date()) == Calendar.current.component(.hour, from: cell.cellDate)
            && Calendar.current.component(.weekday, from: Date()) == Calendar.current.component(.weekday, from: cell.cellDate) {
                cell.titleLabel.text = "now"    //; print("now-cell: [\(column), \(row)]")
                //cell.titleLabel.font = UIFont.systemFont(ofSize: 8, weight: .ultraLight)
            }
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
