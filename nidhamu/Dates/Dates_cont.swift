// Dates_cont       ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit ///cont = continued

func wakeupDateReset(withReload: Bool, showDate: Bool) {
    findFallbackDate(startingDate: Date() - TimeInterval(3600), printDSTDates: showDSTDates) /// generally want =true for testing timetable around DST
    findSpringForwardDate(startingDate: Date(), printDSTDates: showDSTDates)                 /// see above.  (DST = daylight savings time)
    
    checkOrientation()
    defaultLoadData(showDate: showDate)
    if withReload {topVC.reloadCV()}
}

func truncateMins(_ inputDate: Date) -> Date {
    let mn = 0
    let (year, _, month, _ , day, _, _, hour, _, _) = getChosenDateComponents(inputDate, roundedDown: false)
    let formatter = DateFormatter();    formatter.dateFormat = "yyyy/MM/dd HH:mm"
    
    guard let date = formatter.date(from: "\(year)/\(month)/\(day) \(hour):\(mn)") else {
        print("could not create truncated date with input, returning current date instead")
        return Date()
    }
    return date
}

extension Date {
    func isBetween(_ date1: Date, and date2: Date) -> Bool {
        return (min(date1, date2) ... max(date1, date2)).contains(self) ///return (date1 ... date2).contains(self)
    }
    
    //    func isBetweenButNotInclusive(_ date1: Date, and date2: Date) -> Bool {
    //        let date1 = date1 + TimeInterval(1)
    //        let date2 = date2 - TimeInterval(1)
    //        return (min(date1, date2) ... max(date1, date2)).contains(self)
    //    }
}

func dateOfLastSecond(_ date: Date) -> Date {
    let truncDate = truncateMins(date)
    let (year, _, month, _ , day, _, _, hour, _, _) = getChosenDateComponents(truncDate, roundedDown: false)
    let formatter = DateFormatter(); formatter.dateFormat = "yyyy/MM/dd HH:mm:ss"
    
    guard let lastSecondDate = formatter.date(from: "\(year)/\(month)/\(day) \(hour):\(59):\(59)") else {
        print("could not create last-second-date with input, returning current date instead")
        return Date()
    } ///print("last-second-date: \(formattedDateString(lastSecondDate, roundedDown: false, showYear: true, prefix: "", suffix: "", dateFormat: .fullDayWithSeconds))")
    return lastSecondDate
}

//func hoursSince(_ startDate: Date, testDate: Date) -> Int {
//    var truncStartDate = truncateMinutesOf(startDate)
//    let truncTestDate = truncateMinutesOf(testDate)
//    var hours = 0
//
//    while truncStartDate < truncTestDate {
//        truncStartDate += TimeInterval(3600)
//        hours += 1
//    }
//    while truncTestDate < truncStartDate - TimeInterval(3600) {
//        truncStartDate -= TimeInterval(3600)
//        hours -= 1
//    }
//    return hours
//}

