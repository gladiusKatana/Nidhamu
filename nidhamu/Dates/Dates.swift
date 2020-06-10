// Dates            ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

func makeDateFrom(year: Int, month: Int, day: Int, hr: Int, min: Int, sec: Int) -> Date {
    let calendar = Calendar(identifier: .gregorian)
    // calendar.timeZone = TimeZone(secondsFromGMT: 0)!
    let components = DateComponents(year: year, month: month, day: day, hour: hr, minute: min, second: sec)
    return calendar.date(from: components)!
}

func dateFromComponents(_ dateComponents: [Any]) -> Date { /// Note, weekday not needed to create a Date; it's used for prints, eg in pryntLastLoginDate()
    let yearLoaded = dateComponents[0] as! Int             ///; print("year loaded: \(yearLoaded)")                         // will probably replace with...
    let monthLoaded = dateComponents[1] as! String                          ///; print("month loaded: \(monthLoaded)")  //...conditional downcasts,...
    let monthLoadedInt = months.firstIndex(of: monthLoaded)! + 1            ///; print("int: \(monthLoadedInt)")        //...rather than forced ones
    let dayLoaded = dateComponents[2] as! Int                               ///; print("day loaded: \(dayLoaded)")      // --- (need to revamp date code)
    ///let weekdayLoaded = array[3] as! String                                             ///; print("weekday loaded: \(weekdayLoaded)")
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

func dateFromInts(_ dateComponents: [Int]) -> Date { /// Note, weekday not needed to create a Date; only used for prints, eg in pryntLastLoginDate()
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

