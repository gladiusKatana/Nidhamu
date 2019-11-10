// SetCellDate      ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

var dstCompensation = 0.0; var dstCancelor = 0.0

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
        
        
//        let roundedDownDate = truncateMinutesOf(returnDateWithoutDST)
//        
//        let hrs = hoursSince(fallBackDate, testDate: roundedDownDate)
//        //if row >= layout.lockedHeaderRows {cell.titleLabel.text = "\(hrs)"}
//        
//        if hrs > 0 {
//            cell.dstCompensator = 1
//        }
//        else {cell.dstCompensator = 0}
//        
//        
//        
//        if hrs == 0 {
//            fallBackBlockCounter += 1
//            cell.fallBackCount = fallBackBlockCounter
//        }
//        else {
//            cell.fallBackCount = 0
//            if fallBackBlockCounter == 2 {
//                fallBackBlockCounter = 0
//            }
//        }
//        let secondFallBackHour = (cell.fallBackCount == 2) ? 1.0 : 0
//
//        let returnDate = returnDateWithoutDST + (cell.dstCompensator + secondFallBackHour) * TimeInterval(3600)
        
        
        let afterFallBackDate = fallBackDate + TimeInterval(3600)
        
        dstCompensation = (returnDateWithoutDST > afterFallBackDate) ? 1.0 : 0
//        cell.titleLabel.text = "\(dstCompensation)"
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

//                if cell.fallBackCount == 2 {
//                    if !fellBack {
//                        reloadCollectionViewAfterDelay(0)
//                        print("Ʀ")
//                        fellBack = true
//                    }
//                }

/*
 //        if roundedDownDate == fallBackDate {        ///cell.titleLabel.text = "DST(-)"
 //            fallingBackThisWeek = true
 //        }
 //
 //        if roundedDownDate == springForwardDate {   ///cell.titleLabel.text = "DST(+)"
 //        }
 //
 //        let roundedDateString = formattedDateString(roundedDownDate, roundedDown: true,
 //                                                    showYear: false, prefix: "", suffix: "", dateFormat: .fullDayWithYear)
 //        let beforeFallBackDateString = formattedDateString(fallBackDate - TimeInterval(3600), roundedDown: false,
 //                                                           showYear: false, prefix: "", suffix: "", dateFormat: .fullDayWithYear)
 //
 //        if fallingBackThisWeek
 //            //            && roundedDateString != beforeFallBackDateString
 //            //            && roundedDownDate != roundedDownDate + TimeInterval(300)//fallBackDate - TimeInterval(3600)
 //            //            && truncateMinutesOf(Date()) != fallBackDate - TimeInterval(3600)
 //            && (column, row) != (7, 5)
 //
 //            ///&& roundedDownDate != //Date() + TimeInterval(86400 * 7  - 3600)
 //            //&& roundedDownDate >= fallBackDate
 //            //&& truncateMinutesOf(Date()) <= fallBackDate + TimeInterval(3600)
 //        {
 //            dstCompensator = 1
 //        }
 //        else {
 //            dstCompensator = 0
 //        }
 */
