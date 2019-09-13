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
        let returnDate = baseDate + hoursFromNow + daysFromNow + potentialWeekAhead + TimeInterval(3600 * cellOffset)
        
        return returnDate
    }
    
    func setCellWeek(cell: CustomCell, column: Int, row: Int, layout: CustomFlowLayout, withColours: Bool) -> Int {
        
        var weekAhead = 0
        
        if column < nowColumn || column == nowColumn && row < nowRow {
            if withColours
                && !(1 ..< layout.lockedHeaderRows).contains(row) {
                cell.backgroundColor = lastWeekColour; cell.cellColour = lastWeekColour
            }
            weekAhead = 1
        }
        
        return weekAhead
    }
    
    func showDateInTitleLabels(date: Date, cell: CustomCell) {
        let mo = monthsAbbreviated[Calendar.current.component(.month, from: date) - 1]
        let dy = Calendar.current.component(.day, from: date)
        cell.titleLabel.text = "\(mo) \(dy)"
        
        /*let hr = Calendar.current.component(.hour, from: date)
         let mn = Calendar.current.component(.minute, from: date)
         cell.titleLabel.text = "\(hr):\(mn)"*/
    }
}

