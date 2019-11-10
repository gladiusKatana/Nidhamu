// Dates            ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

func dateFromComponents(_ dateComponents: [Any]) -> Date { /// Note, weekday is not needed to create a Date; it's 'along for the ride' , somewhat, and used for prints, eg in pryntLastLoginDate()
    let yearLoaded = dateComponents[0] as! Int                              ///; print("year loaded: \(yearLoaded)")                                    // will probably replace with...
    let monthLoaded = dateComponents[1] as! String                          ///; print("month loaded: \(monthLoaded)")                              //... conditional downcasts,...
    let monthLoadedInt = months.firstIndex(of: monthLoaded)! + 1            ///; print("int: \(monthLoadedInt)")                                            //...rather than forced ones
    let dayLoaded = dateComponents[2] as! Int                               ///; print("day loaded: \(dayLoaded)")
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

func truncateMinutesOf(_ inputDate: Date) -> Date {
    let mn = 0
    
    let (year, _, month, _ , day, _, _, hour, _, _) = getChosenDateComponents(inputDate, roundedDown: false)
    
    let formatter = DateFormatter();    formatter.dateFormat = "yyyy/MM/dd HH:mm"
    
    guard let date = formatter.date(from: "\(year)/\(month)/\(day) \(hour):\(mn)") else {
        print("could not create truncated date with input, returning current date instead")
        return Date()
    }
    return date
}


func findDSTDates(startingDate: Date) {
    //let year = Calendar.current.component(.year, from: Date())
    let startDate = truncateMinutesOf(startingDate)
    //print("starting date is \(formattedDateString(startDate, roundedDown: false, showYear: true, prefix: "", suffix: "", dateFormat: .fullDay))")
    
    var testDate = startDate
    
    for _ in (0 ... 365 * 24 - 1) {
        
        let tz = NSTimeZone.local
        
        let oneHourAfterTestDate = testDate + TimeInterval(3600)
        
        if tz.isDaylightSavingTime(for: testDate)
            && !(tz.isDaylightSavingTime(for: oneHourAfterTestDate)) {
            
            if !foundNextFallBackDate {
                fallBackDate = testDate
                print("next fall-back day will occur on \(formattedDateString(testDate, roundedDown: false, showYear: true, prefix: "", suffix: "", dateFormat: .fullDayWithYear))")
                foundNextFallBackDate = true
            }
        }
        
        if !(tz.isDaylightSavingTime(for: testDate))
            && tz.isDaylightSavingTime(for: oneHourAfterTestDate) {
            
            if !foundNextSpringForwardDate {
                springForwardDate = testDate
                print("next spring-forward day will occur on \(formattedDateString(testDate, roundedDown: false, showYear: true, prefix: "", suffix: "", dateFormat: .fullDayWithYear))")
                foundNextSpringForwardDate = true
            }
        }
        
        testDate += TimeInterval(3600)
    }
}

func hoursSince(_ startDate: Date, testDate: Date) -> Int {
    var truncStartDate = truncateMinutesOf(startDate)
    let truncTestDate = truncateMinutesOf(testDate)
    var hours = 0
    
    while truncStartDate < truncTestDate {
        truncStartDate += TimeInterval(3600)
        hours += 1
    }
    
    while truncTestDate < truncStartDate - TimeInterval(3600) {
        truncStartDate -= TimeInterval(3600)
        hours -= 1
    }
    
    return hours
}
