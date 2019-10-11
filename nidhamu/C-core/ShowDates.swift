// ShowDates        ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension CollectionVC {
    
    func showKeyTimeBlockDates(cell: CustomCell) {
        
        let column = cell.xyCoordinate[0];  let row = cell.xyCoordinate[1] /// for now: can just pass in row and column from caller
        
        if row == earliestEventAddress[1] && column == earliestEventAddress[0] {
            cell.layer.borderColor = UIColor.white.cgColor                                              //; print("highlighted cell white")
            if let events = eventsAtIndexPath[TimeBlock(values:(column, row))], events.count > 1 {
                cell.titleLabel.text = "(\(events.count - eventsInBlockToBeProcessed + 1)/\(events.count))"
            }
        }
        else {
            let cellWeekday = Calendar.current.component(.weekday, from: cell.cellDate)
            let cellHour = Calendar.current.component(.hour, from: cell.cellDate)
            
            let thisWeek = Calendar.current.component(.weekday, from: Date())
            let thisHour = Calendar.current.component(.hour, from: Date())
            
            let lastLoginWeek = Calendar.current.component(.weekday, from: lastLoginDate)
            let lastLoginHour = Calendar.current.component(.hour, from: lastLoginDate)
            
            switch (cellWeekday, cellHour) {
                
            case (thisWeek, thisHour) :
                pryntConditionalKeyDateID("now", cell: cell, row: row, column: column)
                cell.titleLabel.font = UIFont.systemFont(ofSize: 8, weight: .ultraLight)
                cell.layer.borderColor = UIColor.black.cgColor
                
            case (lastLoginWeek, lastLoginHour) :
                pryntConditionalKeyDateID("last login", cell: cell, row: row, column: column)
                cell.titleLabel.font = UIFont.systemFont(ofSize: 8, weight: .ultraLight)
                cell.layer.borderColor = UIColor.clear.cgColor
                
            default:
                cell.layer.borderColor = UIColor.clear.cgColor
            }
        }
    }
    
    func pryntConditionalKeyDateID(_ id: String, cell: CustomCell, row: Int, column: Int) {
        if eventsAtIndexPath[TimeBlock(values:(column, row))] == nil {
            cell.titleLabel.text = id
        }
    }
    
    func showDateInTitleLabels(date: Date, cell: CustomCell) {      // for testing
        let mo = monthsAbbreviated[Calendar.current.component(.month, from: date) - 1]
        let dy = Calendar.current.component(.day, from: date)
        cell.titleLabel.text = "\(mo) \(dy)" // will add this to formattedDateString(:), if it gets used anywhere else as well
    }
    
    func showTimeInTitleLabels(cell: CustomCell) {    // not used-- at the moment. for testing
        cell.titleLabel.text = formattedDateString(cell.cellDate, roundedDown: true, showYear: false, prefix: "", suffix: "", dateFormat: .timeOnly)
        cell.titleLabel.textColor = .white
    }
}

