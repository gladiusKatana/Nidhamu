// CellDates        ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension CollectionVC {    // probably will refactor the logic below soon
    
    func setHourlyCellDates(cell: CustomCell, column: Int, row: Int, layout: CustomFlowLayout, looping: Bool, withColours: Bool) {
        
        cell.cellDate = setCellDate(baseDate: Date(), cellOffset: layout.lockedHeaderRows - row, cell: cell,
                                    column: column, row: row, layout: layout, looping: looping, withColours: withColours)
        if row == 1 {
            cell.cellDate = setCellDate(baseDate: Date(), cellOffset: 3, cell: cell,
                                        column: column, row: row, layout: layout, looping: looping, withColours: withColours)
            if column <= nowColumn {showDateInTitleLabels(date: cell.cellDate , cell: cell);   cell.backgroundColor = lastWeekColour}
        }
            
        else if row == 2 {
            if column >= nowColumn {                                                            cell.backgroundColor = cellDefaultColour
                if column == nowColumn {
                    let lastWeekDate = Date() - TimeInterval(86400 * 7)
                    cell.cellDate = setCellDate(baseDate: lastWeekDate, cellOffset: 2, cell: cell,
                                                column: column, row: row, layout: layout, looping: looping, withColours: withColours)
                    showDateInTitleLabels(date: cell.cellDate, cell: cell)
                }
                else {
                    if column > nowColumn {
                        cell.cellDate = setCellDate(baseDate: Date(), cellOffset: 2, cell: cell,
                                                    column: column, row: row, layout: layout, looping: looping, withColours: withColours)
                        showDateInTitleLabels(date: cell.cellDate, cell: cell)
                    }
                }
            }
        } else if row == 3 {} // row 3 is covered by the general formula on line 8; this is just to exclude it from the else{}
        
        else {
            cell.cellDate = setCellDate(baseDate: Date(), cellOffset: 0,
                                        cell: cell, column: column, row: row, layout: layout, looping: looping, withColours: withColours)
            processEventsBasedOnLoginInterval(cell: cell, column: column, row: row, layout: layout)
        }
        
        //showDateInTitleLabels(date: cell.cellDate, cell: cell)
        
        if let earliestEventAddress = pathsToProcess.first {
            if row == earliestEventAddress[1] && column == earliestEventAddress[0] {
                cell.layer.borderColor = UIColor.white.cgColor
                cell.layer.borderWidth = 2
            } else {cell.layer.borderColor = UIColor.clear.cgColor}
        } else {cell.layer.borderColor = UIColor.clear.cgColor}
    }
    
    func showDateInTitleLabels(date: Date, cell: CustomCell) {
        let mo = monthsAbbreviated[Calendar.current.component(.month, from: date) - 1]
        let dy = Calendar.current.component(.day, from: date)
        cell.titleLabel.text = "\(mo) \(dy)"
//        let hr = Calendar.current.component(.hour, from: date)
//        let mn = Calendar.current.component(.minute, from: date)
//        cell.titleLabel.text = "\(hr):\(mn)"
    }
}

