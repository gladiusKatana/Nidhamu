// ShowDates        ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension CollectionVC {
    
    func showKeyTimeBlockDates(cell: CustomCell) {
        
        let column = cell.xyCoordinate[0];  let row = cell.xyCoordinate[1] /// for now: can just pass in row and column from caller
        
        if row == earliestEventAddress[1] && column == earliestEventAddress[0] {
            cell.layer.borderColor = UIColor.white.cgColor                                              //; print("highlighted cell white")
        }
        else {
            
            let cellWeekday = Calendar.current.component(.weekday, from: cell.cellDate)
            let cellHour = Calendar.current.component(.hour, from: cell.cellDate)
            
            let thisWeek = Calendar.current.component(.weekday, from: Date())                /// don't need to truncate here, I think
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
        /**/
    }
    
    func pryntConditionalKeyDateID(_ id: String, cell: CustomCell, row: Int, column: Int) {
//        if !pathsToProcess.contains([column, row]) {
        if eventsAtIndexPath[TimeBlock(values:(column, row))] == nil {
            cell.titleLabel.text = id
        }
    }
    
    func showDateInTitleLabels(date: Date, cell: CustomCell) {      // for testing
        let mo = monthsAbbreviated[Calendar.current.component(.month, from: date) - 1]
        let dy = Calendar.current.component(.day, from: date)
        cell.titleLabel.text = "\(mo) \(dy)" // will add this to formattedDateString(:), if it gets used anywhere else as well
    }
    
    func showTimeInTitleLabels(date: Date, cell: CustomCell) {    // not used-- at the moment. for testing
        let hr = Calendar.current.component(.hour, from: date)
        let mn = Calendar.current.component(.minute, from: date)
        cell.titleLabel.text = "\(hr):\(mn)"
    }
}

/*
 
 ///func showKeyTimeBlockDates(_ label: String?, date: Date, cell: CustomCell, withBorder: Bool) {
 
 //        if Calendar.current.component(.hour, from: cell.cellDate) == Calendar.current.component(.hour, from: truncatedNowDate)
 //            && Calendar.current.component(.weekday, from: cell.cellDate) == Calendar.current.component(.weekday, from: truncatedDate)
 //        {
 //            if label != nil {cell.titleLabel.text = label}
 //            cell.titleLabel.font = UIFont.systemFont(ofSize: 8, weight: .ultraLight)
 //            if withBorder{cell.layer.borderColor = UIColor.black.cgColor}
 //        }
 //        else {
 //            if withBorder{cell.layer.borderColor = UIColor.clear.cgColor}
 //            cell.titleLabel.font = defaultTimetableCellFont
 //        }
 */

