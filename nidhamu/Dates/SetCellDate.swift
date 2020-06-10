// SetCellDate      ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension CollectionVC {
    
    func setCellDate(baseDate: Date, cellOffset: Int, cell: CustomCell, column: Int, row: Int,
                     layout: CustomFlowLayout, looping: Bool, withColours: Bool) -> (Date, Bool, Bool) {
        
        var hoursFromNow = TimeInterval(0)
        let headers = layout.lockedHeaderRows
        let headerOffset = row < headers ? 3600 * (row - headers) * (timeBlockSize) : 0
        
        hoursFromNow = TimeInterval(3600 * timeBlockSize * (row - nowRow) - headerOffset)
        
        let daysFromNow = TimeInterval(86400 * (column - nowColumn))
        var weekAheadInt = 0
        
        if looping {weekAheadInt = setCellWeek(cell: cell, column: column, row: row, layout: layout, withColours: withColours)}
        
        let oneHour = TimeInterval(3600); let oneWeek = TimeInterval(86400 * 7)
        let potentialWeekAhead = TimeInterval(86400 * 7 * weekAheadInt)
        let date = baseDate + hoursFromNow + daysFromNow + potentialWeekAhead //+ TimeInterval(3600 * cellOffset)
        
        if date > springForwardDate + oneHour {
            dstOffset = -1
        }
        else {
            if date > fallBackDate {dstOffset = 1}
            else {dstOffset = 0}
        }
        
        if truncateMins(Date()) > truncateMins(springForwardDate) {         ///print("finding next spring-forward date, to prevent off-by-1-hour bug")
            foundNextSpringForwardDate = false
            findSpringForwardDate(startingDate: Date(), printDSTDates: showDSTDates)
            reloadCollectionViewAfterDelay(0)
        }
        
        let minTrunkDate = timeBlockSize > 1 ? truncateMins(date) : date    /// truncates MINUTES of cell dates, when multi-hour-length time blocks are enabled
        var cellDate = minTrunkDate + dstOffset * oneHour
        let isNextWeek = weekAheadInt == 1 ? true : false
        
        let timeBlockStartHr = (row - headers) * timeBlockSize - headerOffset / 3600
        let hrsIntoTimeBlock = Calendar.current.component(.hour, from: cellDate) - timeBlockStartHr ///print("\(hrsIntoTimeBlock) hrs into this block")
        
        if timeBlockSize > 1 {  /// *probably refactor below line w/ time block size conditional
            if hrsIntoTimeBlock > 0 {cellDate = truncateMins(cellDate - TimeInterval(3600 * hrsIntoTimeBlock))}
        }
        
        var isLastLogin = false /// *probably will do some refactoring with below  if  ...
        if  truncateMins(cellDate) - (dstOffset + springForwardExtraHour + fallBackExtraHour) * oneHour - oneWeek
            == truncateMins(timeBlockRoundedLastLogin)
        { isLastLogin = true }
        return (cellDate, isNextWeek, isLastLogin)
    }
    
    func setCellWeek(cell: CustomCell, column: Int, row: Int, layout: CustomFlowLayout, withColours: Bool) -> Int {
        var weekAhead = 0
        if column < nowColumn || column == nowColumn && row < nowRow {
            weekAhead = 1
        }
        return weekAhead
    }
}

