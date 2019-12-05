// FormatDate       ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

func formattedDateString(_ date: Date, roundedDown: Bool, showYear: Bool, prefix: String?, suffix: String, dateFormat: CustomDateFormat) -> String {
    
    let (year, _, month, mnth, day, weekday, wkdy, hour, minute, second) = getChosenDateComponents(date, roundedDown: roundedDown)
    
    var minTwoDigits = "\(minute)";             if minute < 10 {minTwoDigits = "0\(minute)"}
    var sec2Digs = "\(second)";                 if second < 10 {sec2Digs = "0\(second)"}
    var ampm = ""
    
    var hr = (hour < 13) ? hour : hour - 12
    if hr == 0 {hr = 12}                            // * this is just to make a string representing the date, not the date itself
    if hour < 12 {ampm = "am"} else {ampm = "pm"}   // since hr is an integer from 0 to 23
    
    var yearString = ""
    if showYear && (month == "January" || month == "December") {yearString = "\(year), "}/// also add  || (Date() > last-login-date + ~30 days)
    let prx = (prefix == "") ? " " : "\(prefix ?? "") "
    
    switch dateFormat {
        
    case .fullDay:                  return "\(prx)\(weekday) \(month) \(day), \(yearString)\(hr):\(minTwoDigits)\(ampm)\(suffix)"
    case .fullDayWithYear:          return "\(prx)\(weekday) \(month) \(day), \(year) \(hr):\(minTwoDigits)\(ampm)\(suffix)"
        
    case .fullDayWithSeconds:       return "\(prx)\(weekday) \(month) \(day), \(yearString)\(hr):\(minTwoDigits):\(sec2Digs)\(ampm)\(suffix)"
        
    case .fullDayShortForm:         return "\(prx)\(wkdy). \(mnth). \(day), \(yearString)\(hr)\(ampm)\(suffix)"
    case .fullDayShortFormNoDots:   return "\(prx)\(weekday.prefix(3)) \(month.prefix(3)) \(day), \(yearString)\(hr)\(ampm)\(suffix)"
    case .archiveFormat:            return "\(prx)\(weekday) \(month) \(day) \(year) @ \(hr)\(ampm)\(suffix)"
        
    case .archiveCSVTitle:          return "\(weekday.prefix(3)) \(month.prefix(3)) \(day), \(year), \(hr)꞉\(minTwoDigits)\(ampm)"/// see  **  below
        
    case .timeOnly:                 return "\(hr)\(ampm)"
    case .monthAndDay:              return "\(month.prefix(3)) \(day)"
        
    default: return "\(prx)\(weekday) \(hr)\(ampm)" // for hourly or (soon-to-be-implemented) quarter-day time-blocks
    }
}

enum CustomDateFormat: Int {
    case hourlyTimeBlock = 0; case quarterDayTimeBlock, fullDay, fullDayWithYear, fullDayWithSeconds, fullDayShortForm, fullDayShortFormNoDots, archiveFormat, archiveCSVTitle, timeOnly, monthAndDay
}

///** atypical, slightly larger colon (꞉ not :) used for case archiveCSVTitle, because typical colon is a CSV column separator in Mac Numbers, and archived tagged tasks are exported via CSV in this app


/*func formatDatesFromComponentsArray(_ cells: [[[Any]]]) -> [[String]] {
 var formattedDatesArrays = [[String]]()
 
 for timeBlock in cells {
 var timeBlockDateStrings = [String]()
 
 for taskDateComponents in timeBlock {   /// should probably use the word  deadline  rather than  date  here (code is not currently used)
 let date = dateFromComponents(taskDateComponents)   /// see comment in the line above
 let dateString = formattedDateString(date, roundedDown: true, showYear: false,
 pre: "", suffix: " ", dateFormat: .fullDayShortForm) /// 2nd space to match default left one
 timeBlockDateStrings.append(dateString)
 }
 formattedDatesArrays.append(timeBlockDateStrings)
 }
 return formattedDatesArrays
 }*/

