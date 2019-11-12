// SetCellDate      ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension CollectionVC {
    
    func setCellDate(baseDate: Date, cellOffset: Int,
                     cell: CustomCell, column: Int, row: Int, layout: CustomFlowLayout, looping: Bool, withColours: Bool) -> Date {
        
        let hoursFromNow = TimeInterval(3600 * (row - nowRow))
        let daysFromNow = TimeInterval(86400 * (column - nowColumn))
        var weekAheadInt = 0
        
        if looping {
            weekAheadInt = setCellWeek(cell: cell, column: column, row: row, layout: layout, withColours: withColours)
        }
        
        let potentialWeekAhead = TimeInterval(86400 * 7 * weekAheadInt)
        let returnDateWithoutDST = baseDate + hoursFromNow + daysFromNow + potentialWeekAhead + TimeInterval(3600 * cellOffset)
        
        let afterFallBackDate = fallBackDate //+ TimeInterval(3600)
        
        dstCompensation = (returnDateWithoutDST > afterFallBackDate) ? 1.0 : 0
        ///cell.titleLabel.text = "\(dstCompensation)"
        return returnDateWithoutDST + dstCompensation * TimeInterval(3600)
    }
    
    
    func setCellWeek(cell: CustomCell, column: Int, row: Int, layout: CustomFlowLayout, withColours: Bool) -> Int {
        var weekAhead = 0
        if column < nowColumn || column == nowColumn && row < nowRow {
            weekAhead = 1
            if withColours && !(1 ..< layout.lockedHeaderRows).contains(row) {
                cell.backgroundColor = lastWeekColour; cell.cellColour = lastWeekColour
            }
        }
        return weekAhead
    }
}

