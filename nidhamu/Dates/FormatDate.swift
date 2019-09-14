// FormatDate       ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit


func formattedDateString(_ date: Date, roundedDown: Bool, prefix: String, suffix: String, dateFormat: CustomDateFormat) -> String {
    
    let (year, month, mnth, day, weekday, wkdy, hour, minute) = displayDate(date, roundedDown: roundedDown)
    
    var minTwoDigits = "\(minute)";             if minute < 10 {minTwoDigits = "0\(minute)"}
    var ampm = "";                              if hour < 13 {ampm = "am"} else {ampm = "pm"} // since hr is by default 24hr
    let hr = (hour < 13) ? hour : hour - 12     // * make it say 12:XXAM rather than O:XX
    
    switch dateFormat {
    case .fullDay:             return "\(prefix) \(wkdy). \(month) \(day), \(hr):\(minTwoDigits)\(ampm)\(suffix)"
    case .fullDayAbbreviated:  return "\(prefix) \(wkdy). \(mnth). \(day), \(hr)\(ampm)\(suffix)"  // mnth or month.prefix(3)
        
    case .fullDayWithYear:
        if month == "January" || month == "December" { // also may want to add || (Date() > last-login-date by > ~30 days)
            return "\(prefix) \(weekday) \(month) \(day), \(year), \(hr):\(minTwoDigits)\(ampm)\(suffix)"
        }
        else {return "\(prefix) \(weekday) \(month) \(day), \(hr):\(minTwoDigits)\(ampm)\(suffix)"}
        
    default: return "\(prefix) \(weekday) \(hr)\(ampm)" // for hourly or (soon-to-be-implemented) quarter-day time-blocks
    }
}


enum CustomDateFormat: Int {
    case hourlyTimeBlock = 0; case quarterDayTimeBlock, fullDay, fullDayAbbreviated, fullDayWithYear
}


func formatDatesFromComponentsArray(_ cells: [[[Any]]]) -> [[String]] {
    
    var formattedDatesArrays = [[String]]()
    
    for timeBlock in cells {
        var timeBlockDateStrings = [String]()
        
        for eventDateComponents in timeBlock {
            let date = dateFromComponents(eventDateComponents)
            let dateString = formattedDateString(date, roundedDown: true,
                                                 prefix: "", suffix: " ", dateFormat: .fullDayAbbreviated) // 2nd space to match default left one
            timeBlockDateStrings.append(dateString)
        }
        formattedDatesArrays.append(timeBlockDateStrings)
    }
    return formattedDatesArrays
}

