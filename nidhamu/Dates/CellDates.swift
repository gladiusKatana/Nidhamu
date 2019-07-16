// CellDates        ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension CollectionVC {
    
    func setupHourlyCells(cell: CustomCell, column: Int, row: Int, layout: CustomFlowLayout, looping: Bool, withColours: Bool) {
        let hoursFromNow = TimeInterval(3600 * (row - nowRow))
        let daysFromNow = TimeInterval(86400 * (column - nowColumn))
        var weekAheadInt = 0
        
        if looping {weekAheadInt = setCellWeek(cell: cell, column: column, row: row, layout: layout, withColours: withColours)}
        let potentialWeekAhead = TimeInterval(86400 * 7 * weekAheadInt)
        cell.cellDate = Date() + hoursFromNow + daysFromNow + potentialWeekAhead // dates never actually rounded: just displayed rounded sometimes
        //        showDateInTitleLabels(cell: cell);        //showNowCell(cell: cell, column: column, row: row)
        //        cell.titleLabel.text = "\(cell.xyCoordinate)"
        cell.titleLabel.font = defaultTimetableCellFont
        processEventBasedOnDateRange(cell: cell, column: column, row: row, layout: layout)
    }
    
    func setCellWeek(cell: CustomCell, column: Int, row: Int, layout: CustomFlowLayout, withColours: Bool) -> Int {
        var weekAhead = 0
        if column < nowColumn || column == nowColumn && row < nowRow {
            if withColours {cell.backgroundColor = lastWeekColour; cell.cellColour = lastWeekColour}
            weekAhead = 1
        }
        return weekAhead
    }
    
    func processEventBasedOnDateRange(cell: CustomCell, column: Int, row: Int, layout: CustomFlowLayout) {
        let oneWeekAgo = cell.cellDate - TimeInterval(86400 * 7)
        if oneWeekAgo >= lastLoggedInDate && oneWeekAgo <= Date() {
            cell.backgroundColor = niceOrangeLight                                  //! shows up momentarily after launch on ipad mini 4, landscape
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
            cell.titleLabel.text = "now";  cell.titleLabel.font = UIFont.systemFont(ofSize: 8, weight: .ultraLight)
            prepareToProcessEventsSinceLastLogin(column: column, row: row)
        }
    }
    
    func prepareToProcessEventsSinceLastLogin(column: Int, row: Int) {
        if let events = eventsAtIndexPath[TimeBlock(values:(column, row))] {        //cell.backgroundColor = jadeGreen; cell.cellColour = jadeGreen
            if !savedTimeBlocksForProcessing {
                if !eventArraysToProcess.contains(events) {eventArraysToProcess.append(events)}
                if !pathsToProcess.contains([column, row]) {pathsToProcess.append([column, row])}
            }
        }
    }
    
    func showNowCell(cell: CustomCell, column: Int, row: Int) {
        if row == nowRow && column == nowColumn { print("now-cell is at [\(column), \(row)]")}
        //presentPopupViewToMarkEvents(column: column, row: row) //! // testing popup window; not the typical condition under which it pops up
    }
    
    func showDateInTitleLabels(cell: CustomCell) {
        let mo = months[Calendar.current.component(.month, from: cell.cellDate) - 1]
        let dy = Calendar.current.component(.day, from: cell.cellDate)
        cell.titleLabel.text = "\(mo) \(dy)"
    }
}

