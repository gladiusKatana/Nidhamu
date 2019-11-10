// ShowDates        ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension CollectionVC {
    
    func showKeyTimeBlockDates(cell: CustomCell) {
        
        let column = cell.xyCoordinate[0];  let row = cell.xyCoordinate[1]          /// for now: could also just pass in row & column from caller
        
        if row == earliestTaskAddress[1] && column == earliestTaskAddress[0] {
            cell.layer.borderColor = UIColor.white.cgColor                          //; print("highlighted cell white")
            if let tasks = tasksAtIndexPath[TimeBlock(values:(column, row))], tasks.count > 1 {
                cell.titleLabel.text = "(\(taskIndex + 1)/\(tasks.count))"          ///= "(\(tasks.count - tasksInBlockToBeProcessed + 1)/\(tasks.count))"
                cell.titleLabel.font = defaultTimetableCellFont
            }
            else {cell.titleLabel.text = globalTaskIdentifier}                      /// when evets.count == 1, can just use previously set task's description via this var
        }
        else {
            let cellWeekday = Calendar.current.component(.weekday, from: cell.cellDate)
            let cellHour = Calendar.current.component(.hour, from: cell.cellDate)
            
            let thisWeekday = Calendar.current.component(.weekday, from: Date())
            let thisHour = Calendar.current.component(.hour, from: Date())
            
            let lastLoginWeek = Calendar.current.component(.weekday, from: lastLoginDate)
            let lastLoginHour = Calendar.current.component(.hour, from: lastLoginDate)
            
            
//            let cellDateString = formattedDateString(cell.cellDate, roundedDown: true,
//                                                     showYear: false, prefix: "", suffix: "", dateFormat: .fullDayWithYear)
//            let fallBackDateString = formattedDateString(fallBackDate, roundedDown: true,
//                                                         showYear: false, prefix: "", suffix: "", dateFormat: .fullDayWithYear)
            
            switch (cellWeekday, cellHour) {
                
                
            case (thisWeekday, thisHour) :
                
                //pryntConditionalKeyDateID("now", cell: cell, row: row, column: column)
                //pryntConditionalKeyDateID("\(cell.fallBackCount)", cell: cell, row: row, column: column)
                
                if cell.fallBackCount < 2 {
                    cell.layer.borderColor = UIColor.black.cgColor
                }
                
                
                
                
//            case (thisWeekday, Calendar.current.component(.hour, from: Date() + TimeInterval(3600))): /// if cell date is 1 hr after now-date
//
//                //if cellDateString == fallBackDateString {print("\n...preparing to find new fall-back time")}
//                passedFallBackBlock = true
                
                
            case (lastLoginWeek, lastLoginHour) :
                pryntConditionalKeyDateID("last login", cell: cell, row: row, column: column)
                cell.titleLabel.font = UIFont.systemFont(ofSize: 9, weight: .ultraLight)
                cell.layer.borderColor = UIColor.clear.cgColor
                
            default:
                cell.layer.borderColor = UIColor.clear.cgColor
            }
        }
    }
    
    func pryntConditionalKeyDateID(_ id: String, cell: CustomCell, row: Int, column: Int) {
        if tasksAtIndexPath[TimeBlock(values:(column, row))] == nil {
            cell.titleLabel.text = id
        }
    }
    
    func showDateInTitleLabels(date: Date, cell: CustomCell) {  /// for testing
        let mo = monthsAbbreviated[Calendar.current.component(.month, from: date) - 1]
        let dy = Calendar.current.component(.day, from: date)
        cell.titleLabel.text = "\(mo) \(dy)" /// will add this to formattedDateString(:), if it gets used anywhere else as well
    }
    
    func showTimeInTitleLabels(_ date: Date) -> String {
        return formattedDateString(date, roundedDown: true, showYear: false, prefix: "", suffix: "", dateFormat: .timeOnly)
    }
}

/*
 //                    let roundedDateString = formattedDateString(Date(), roundedDown: true,
 //                                                                showYear: false, prefix: "", suffix: "", dateFormat: .fullDayWithYear)
 //                    let fallBackDateString = formattedDateString(fallBackDate + TimeInterval(0), roundedDown: false,
 //                                                                showYear: false, prefix: "", suffix: "", dateFormat: .fullDayWithYear)
 //
 //                    if viewControllerType == .timetable {
 //                        print("right now it's: \(roundedDateString)")
 //                        print("fall back date: \(fallBackDateString)")
 //                    }
 //
 //                    if roundedDateString == fallBackDateString
 //                        ///&& (previousNowRow, previousNowColumn) == (nowRow, nowColumn)
 //                    {
 //                        fallingBackThisWeek = false
 //                        ///fallBackDate = dateFromInts([3030, 1, 1, 0])
 //                        print("done compensating for the fall back date\n")
 //                    }
 
 //findDSTDates()
 //fallBackDate = dateFromInts([3030, 1, 1, 0])
 //dstCompensator = 0
 */
