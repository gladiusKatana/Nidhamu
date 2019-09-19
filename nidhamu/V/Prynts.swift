// Prynts           ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

///Called when SAVING:

func printEventsTabularized() { // optimized for console printing on an iPad Mini 4, landscape orientation (using Duet app & metal iPad stand)
    print(""); let gap = " "; var i = 0
    
    for path in timeBlockPaths {
        
        guard let events = eventsAtIndexPath[TimeBlock(values:(path[0], path[1]))] else {print("no events"); return}
        var j = 0
        
        for event in events {
            let pathString = "\(path[0]),\(path[1])";  let maxPathString = " 24,7 "
            let excess = String(repeating: " ", count: maxPathString.count - "\(pathString)".count)
            let spaces = String(repeating: " ", count: maxPathString.count - 2)
            
            let title = event.eventDescription
            let titleCount = "\(title)".count
            var bound = 27
            var count = (titleCount < bound) ? bound - titleCount : 0//titleCount - bound
            let titleExcess = String(repeating: " ", count: count)
            
            let dateString = formattedDateString(event.eventDate, roundedDown: false,
                                                 showYear: true, prefix: "", suffix: "", dateFormat: .fullDayShortFormNoDots)
            let dateStringCount = dateString.count
            bound = 24
            count = (dateStringCount < bound) ? bound - dateStringCount : 0//dateStringCount - bound
            let dateExcess = String(repeating: " ", count: count)
            
            let restOfString = "\(gap)\(excess)\(title)\(titleExcess)\(dateString)\(dateExcess)\(event.eventStatus)"
            
            if j == 0  { print("\(pathString)\(restOfString)")}
            else {       print("\(spaces)\(restOfString)")}
            
//            if j == events.count - 1 {print("")}
            j += 1
        }
        i += 1
    }//; print("\n")
}

///Called when LOADING & REFRESHING DATE:

func pryntLastLoginDate() {// spelling 'prynt' with a y so this function's existence does not cause override of autocomplete for print statements
    print(formattedDateString(lastLoginDate, roundedDown: false, showYear: true, prefix: "last login              ", suffix: "", dateFormat: .fullDay))
    //print("              (unformatted gmt)    \(lastLoggedInDate)\n")
}

func pryntCurrentDate() {
    print(formattedDateString(Date(), roundedDown: false, showYear: true, prefix: "date right now          ", suffix: "", dateFormat: .fullDay))
    print("")
    //print("              (unformatted gmt)    \(Date())\n")
}

//func pryntSortedSavedArrays() {
//    let spaces = "                     "
//    let colonOrPeriod = (eventDateArrays.isEmpty) ? "." : ":" // or could use any of the other event-property arrays, they're all the same size
//    let formattedDatesArrays = formatDatesFromComponentsArray(eventDateArrays)
//    let newlinedFormattedDates = formattedDatesArrays.map {"\($0)"}.joined(separator: "\n\(spaces)")
//
//    print("\n\(spaces)\(eventDescriptionArrays.count) blocks' events\(colonOrPeriod)\n\(spaces)\(eventDescriptionArrays)")
//    print("\n\(spaces)\(timeBlockPaths.count) blocks' paths\(colonOrPeriod)\n\(spaces)\(timeBlockPaths)")
//    print("\n\(spaces)\(eventStatusArrays.count) blocks' statuses\(colonOrPeriod)\n\(spaces)\(eventStatusArrays)")
//    print("\n\(spaces)\(formattedDatesArrays.count) blocks' event dates\(colonOrPeriod)\n\(spaces)\(newlinedFormattedDates)")
//}

///(from AppLifecycle:)
/*let s = "🔅became active"
 if firstReenteredForeground {customApplicationStatusPrint(s)}
 else {print(s)}*/

