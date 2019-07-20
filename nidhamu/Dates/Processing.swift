// Processing       ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension CollectionVC {

    func processEventBasedOnDateRange(cell: CustomCell, column: Int, row: Int, layout: CustomFlowLayout) {
        
        if [column, row] == selectedTimeBlockPath && eventsAtIndexPath[TimeBlock(values:(column, row))] == nil {
            if textFieldDisplayed {cell.backgroundColor = headerColour}
        }
        else {
            let oneWeekAgo = cell.cellDate - TimeInterval(86400 * 7)
            
            if oneWeekAgo >= lastLoggedInDate && oneWeekAgo <= Date() {
                
                cell.backgroundColor = niceOrangeLight                      //! shows up momentarily after launch on ipad mini 4, landscape
                cell.cellColour = niceOrangeLight
                
                if formattedDateString(lastLoggedInDate, roundedDown: true, prefix: "", suffix: "", short: true)
                    == formattedDateString(cell.cellDate, roundedDown: true, prefix: "", suffix: "", short: true) {
                    cell.titleLabel.text = "last login"
                    cell.titleLabel.font = UIFont.systemFont(ofSize: 8, weight: .ultraLight)
                }
                prepareToProcessEventsSinceLastLogin(column: column, row: row)
            }
            
            if formattedDateString(Date(), roundedDown: true, prefix: "", suffix: "", short: true)
                == formattedDateString(cell.cellDate, roundedDown: true, prefix: "", suffix: "", short: true) {
                
                cell.backgroundColor = niceOrangeLight
                cell.cellColour = niceOrangeLight
                
                cell.titleLabel.text = "now";  cell.titleLabel.font = UIFont.systemFont(ofSize: 8, weight: .ultraLight)
                prepareToProcessEventsSinceLastLogin(column: column, row: row)
            }
        }
    }
    
    func prepareToProcessEventsSinceLastLogin(column: Int, row: Int) {
        if let events = eventsAtIndexPath[TimeBlock(values:(column, row))] {        //cell.backgroundColor = jadeGreen; cell.cellColour = jadeGreen
            if !savedTimeBlocksForProcessing {
                if !eventArraysToProcess.contains(events) {eventArraysToProcess.append(events)}
                if !pathsToProcess.contains([column, row]) {pathsToProcess.append([column, row])}
            }
            if row >= 19 {
                thereWillBeARowException = true
            }
        }
    }
}
