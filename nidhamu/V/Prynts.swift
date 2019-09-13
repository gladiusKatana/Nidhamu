// Prynts           ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit


///Called when LOADING & REFRESHING DATE:

func pryntLastLoginDate() {// spelling 'prynt' with a y so this function's existence does not cause override of autocomplete for print statements
    print(formattedDateString(lastLoggedInDate, roundedDown: false, prefix: "last login              ", suffix: "", short: false))
    //print("              (unformatted gmt)    \(lastLoggedInDate)\n")
}

func pryntCurrentDate() {
    print(formattedDateString(Date(), roundedDown: false, prefix: "date right now          ", suffix: "", short: false)); print("")
    //print("              (unformatted gmt)    \(Date())\n")
}


///Called when SAVING:

func pryntSortedSavedArrays() {
    let spaces = "                     "
    let colonOrPeriod = (eventDateArrays.isEmpty) ? "." : ":" // or could use any of the other event-property arrays, they're all the same size
    
    let formattedDatesArrays = formatDatesFromComponentsArray(eventDateArrays)
    let newlinedFormattedDates = formattedDatesArrays.map {"\($0)"}.joined(separator: "\n\(spaces)")
    
    print("\n\(spaces)\(eventDescriptionArrays.count) blocks' events\(colonOrPeriod)\n\(spaces)\(eventDescriptionArrays)")
    print("\n\(spaces)\(timeBlockPaths.count) blocks' paths\(colonOrPeriod)\n\(spaces)\(timeBlockPaths)")
    print("\n\(spaces)\(eventStatusArrays.count) blocks' statuses\(colonOrPeriod)\n\(spaces)\(eventStatusArrays)")
    print("\n\(spaces)\(formattedDatesArrays.count) blocks' event dates\(colonOrPeriod)\n\(spaces)\(newlinedFormattedDates)")
}


///(from AppLifecycle:)

/*let s = "🔅became active"
 if firstReenteredForeground {customApplicationStatusPrint(s)}
 else {print(s)}*/

