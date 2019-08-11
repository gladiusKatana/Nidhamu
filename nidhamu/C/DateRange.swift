// DateRange        ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension CollectionVC {
    
    func processEventBasedOnDateRange(cell: CustomCell, column: Int, row: Int, layout: CustomFlowLayout) {
        
        if [column, row] == selectedTimeBlockPath && eventsAtIndexPath[TimeBlock(values:(column, row))] == nil {
            if textFieldDisplayed {cell.backgroundColor = eventAddingColour}
        }
        else {
            let oneWeekAgo = cell.cellDate - TimeInterval(86400 * 7)
            
            if oneWeekAgo >= lastLoggedInDate && oneWeekAgo <= Date() - TimeInterval(3600) {            // stops 1 time block short of the now-cell
                
                cell.backgroundColor = niceOrangeLight                                                  //* shows momentarily after launch...
                cell.cellColour = niceOrangeLight                                                       //  ... on ipad mini 4, landscape
                
                if formattedDateString(lastLoggedInDate, roundedDown: true, prefix: "", suffix: "", short: true)
                    == formattedDateString(cell.cellDate, roundedDown: true, prefix: "", suffix: "", short: true) {
                    cell.titleLabel.text = "last login"
                    cell.titleLabel.font = UIFont.systemFont(ofSize: 8, weight: .ultraLight)
                }
                prepareToProcessEventsSinceLastLogin(cell: cell, column: column, row: row)
            }
            
            if formattedDateString(Date(), roundedDown: true, prefix: "", suffix: "", short: true)
                == formattedDateString(cell.cellDate, roundedDown: true, prefix: "", suffix: "", short: true) {
                cell.titleLabel.text = "now"                                                            //; print("now-cell: [\(column), \(row)]")
                cell.titleLabel.font = UIFont.systemFont(ofSize: 8, weight: .ultraLight)
            }
        }
    }
    
    func prepareToProcessEventsSinceLastLogin(cell: CustomCell, column: Int, row: Int) {
        if let events = eventsAtIndexPath[TimeBlock(values:(column, row))] {
            //cell.backgroundColor = jadeGreen; cell.cellColour = jadeGreen
            
            if !savedTimeBlocksForProcessing {
                if !eventArraysToProcess.contains(events) {eventArraysToProcess.append(events)}         //* see note below
                if !pathsToProcess.contains([column, row]) {
                    pathsToProcess.append([column, row])
                }
            }
            if row > 21 {
                thereWillBeARowException = true
            }
        }
    }
}
/*                                                                                                      * does not catch test case of:
 adding an event, advancing device date setting by 1 week, returning to app (now in event-marking mode), then ...changing your mind... and dismissing app to background again, only to reopen it and resume your event-tagging in a few moments... this test case causes the reload-CV method call that occurs upon resuming the app (even if the date hasn't changed) to sweep over all time blocks, in prepareToProcessEventsSinceLastLogin(:)... which repopulates the events-to-process array unnecessarily.  Current solution should work fine though (see TagEvent.swift, processEventsSinceLastLogin(:) method, near bottom of method); will monitor this over next few tests.⚔️    )*/