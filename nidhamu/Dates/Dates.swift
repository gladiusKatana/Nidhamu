// Dates            ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

func makeDateFrom(year: Int, month: Int, day: Int, hr: Int, min: Int, sec: Int) -> Date {
    let calendar = Calendar(identifier: .gregorian)
    // calendar.timeZone = TimeZone(secondsFromGMT: 0)!
    let components = DateComponents(year: year, month: month, day: day, hour: hr, minute: min, second: sec)
    return calendar.date(from: components)!
}

func dateFromComponents(_ dateComponents: [Any]) -> Date { /// Note, weekday not needed to create a Date; it's used for prints, eg in pryntLastLoginDate()
    let yearLoaded = dateComponents[0] as! Int                              ///; print("year loaded: \(yearLoaded)")                                    // will probably replace with...
    let monthLoaded = dateComponents[1] as! String                          ///; print("month loaded: \(monthLoaded)")                              //... conditional downcasts,...
    let monthLoadedInt = months.firstIndex(of: monthLoaded)! + 1            ///; print("int: \(monthLoadedInt)")                                            //...rather than forced ones
    let dayLoaded = dateComponents[2] as! Int                               ///; print("day loaded: \(dayLoaded)")                                      // --- (need to revamp date code)
    //let weekdayLoaded = array[3] as! String                               ///; print("weekday loaded: \(weekdayLoaded)")
    let hourLoaded = dateComponents[4] as! Int                              ///; print("hour loaded: \(hourLoaded)")
    let minuteLoaded = dateComponents[5] as! Int                            ///; print("minute loaded: \(minuteLoaded)")
    
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy/MM/dd HH:mm"
    
    guard let date = formatter.date(from: "\(yearLoaded)/\(monthLoadedInt)/\(dayLoaded) \(hourLoaded):\(minuteLoaded)") else {
        print("could not create date with loaded input, returning current date instead")
        return Date()
    }
    return date
}

func dateFromInts(_ dateComponents: [Int]) -> Date { /// Note, weekday inot needed to create a Date; it's 'along for the ride', somewhat, & used for prints, eg in pryntLastLoginDate()
    let yearLoaded = dateComponents[0]                                      ///; print("year loaded: \(yearLoaded)")
    let monthLoaded = dateComponents[1]                                     ///; print("month loaded: \(monthLoaded)")
    let dayLoaded = dateComponents[2]                                       ///; print("day loaded: \(dayLoaded)")
    let hourLoaded = dateComponents[3]                                      ///; print("hour loaded: \(hourLoaded)")
    
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy/MM/dd HH"
    
    guard let date = formatter.date(from: "\(yearLoaded)/\(monthLoaded)/\(dayLoaded) \(hourLoaded)") else {
        print("could not create date with loaded input, returning current date instead")
        return Date()
    }
    return date
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
        return (min(date1, date2) ... max(date1, date2)).contains(self)
        ///return (date1 ... date2).contains(self)
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
//
//    while truncTestDate < truncStartDate - TimeInterval(3600) {
//        truncStartDate -= TimeInterval(3600)
//        hours -= 1
//    }
//    return hours
//}
