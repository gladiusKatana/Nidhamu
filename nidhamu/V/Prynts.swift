// Prynts           ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit


///Called when LOADING & REFRESHING DATE:

func pryntLastLoginDate() {// spelling 'prynt' with a y so this function's existence does not cause override of autocomplete for print statements
    print(formattedDateString(lastLoginDate, roundedDown: false, prefix: "last login              ", suffix: "", dateFormat: .fullDayWithYear))
    //print("              (unformatted gmt)    \(lastLoggedInDate)\n")
}

func pryntCurrentDate() {
    print(formattedDateString(Date(), roundedDown: false, prefix: "date right now          ", suffix: "", dateFormat: .fullDayWithYear))
    print("")
    //print("              (unformatted gmt)    \(Date())\n")
}


///Called when SAVING:

func printEventsTabularized() { // optimized for console printing on an iPad Mini 4, landscape orientation (using the Duet app)
    var i = 0
    let formattedDatesArrays = formatDatesFromComponentsArray(eventDateArrays)
    let gap = "      ", midGap = "         ", twoGaps = "\(gap)\(gap)", threeGaps = "\(gap)\(gap)\(gap)"
    
    print("\npath\(midGap)description\(twoGaps)due date\(threeGaps)status\n")
    
    for _ in timeBlockPaths {
        let status = EventStatus(rawValue: eventStatusArrays[i].first!)!.caseName()
        print("\(timeBlockPaths[i])\(gap)\(eventDescriptionArrays[i])\(gap)\(formattedDatesArrays[i])\(gap)\(status)")
        i += 1
    }
    
    print("\n")
}//             * only works for single-event time blocks; need to implement multiple-line printing for items (that is, (array)[i]'s in loop, ie SimpleEvent properties) whose sizes are > 1


//func pryntSortedSavedArrays() {
//    let spaces = "                     "
//    let colonOrPeriod = (eventDateArrays.isEmpty) ? "." : ":" // or could use any of the other event-property arrays, they're all the same size
//
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

