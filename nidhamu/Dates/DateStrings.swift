// DateStrings      ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

func displayDate(_ inputDate: Date, roundedDown: Bool)
    -> (year: Int, monthStr: String, day: Int, weekday: String, weekdayLong: String, hour: Int, minute: Int) {
        
        let yr = Calendar.current.component(.year, from: inputDate)
        let mnth = months[Calendar.current.component(.month, from: inputDate) - 1]
        let dy = Calendar.current.component(.day, from: inputDate)
        let wkdyLong = fullWeekdaysDefaultOrder[Calendar.current.component(.weekday, from: inputDate) - 1]
        let wkdy = wkdysDefaultOrder[Calendar.current.component(.weekday, from: inputDate) - 1]
        let hr = Calendar.current.component(.hour, from: inputDate)
        var mn : Int
        if roundedDown {mn = 0}
        else {mn = Calendar.current.component(.minute, from: inputDate)}   //; let secInt = Calendar.current.component(.second, from: inputDate)
        
        return (yr, mnth, dy, wkdy, wkdyLong, hr, mn)
        //MAY CRASH IF YOUR DEVICE IS   NOT  ON 24HR TIME (or is? ...bug seems to be gone but will double check.)
}

func formattedDateString(_ date: Date, roundedDown: Bool, prefix: String, suffix: String, short: Bool) -> String {
    
    let (yr, mnthString, dayI, wkday, wkdayLong, hr, min) = displayDate(date, roundedDown: roundedDown)
    
    var minTwoDigits = "\(min)"
    if min < 10 {minTwoDigits = "0\(min)"}
    
    var ampm = ""; if hr < 13 {ampm = "am"} else {ampm = "pm"}
    
    if short {
        return "\(prefix) \(wkdayLong) \((hr < 13) ? hr : hr - 12)\(ampm)" //"\(prefix) \(wkday) \(hr):\(minTwoDigits)"
    }
    else {
        if mnthString == "January" || mnthString == "December" {
            return "\(prefix) \(wkday). \(mnthString.prefix(3)) \(dayI), \(yr) @ \(hr):\(minTwoDigits)\(suffix)"
        }
        else {return "\(prefix) \(wkday). \(mnthString.prefix(3)) \(dayI) @ \(hr):\(minTwoDigits)\(suffix)"}
    }
}

func formatDatesFromComponentsArray(_ cells: [[[Any]]]) -> [[String]] {
    var formattedDatesArrays = [[String]]()
    
    for timeBlock in cells {
        var timeBlockDateStrings = [String]()
        
        for eventDateComponents in timeBlock {
            let date = dateFromComponents(eventDateComponents)
            let dateString = formattedDateString(date, roundedDown: true,
                                                 prefix: "", suffix: " ", short: false) // 2nd space to match default left one
            timeBlockDateStrings.append(dateString)
        }
        formattedDatesArrays.append(timeBlockDateStrings)
    }
    return formattedDatesArrays
}

func getFullWeekdayName(shortWeekday: String) -> String {
    switch shortWeekday {
    case "Mon": return "Monday"
    case "Tue": return "Tuesday"
    case "Wed": return "Wednesday"
    case "Thu": return "Thursday"
    case "Fri": return "Friday"
    case "Sat": return "Saturday"
    case "Sun": return "Sunday"
    default:                        print("! returned short form rather than full weekday")
    return shortWeekday
    }
}

