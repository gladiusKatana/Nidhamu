// Prynts           ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit


// Called when SAVING:

func pryntSavedArrays() {
    
    let consoleAlignmentSpace = "                     "
    
    //print("\n\(consoleAlignmentSpace)\(eventPathArrays.count) time blocks: \n\(consoleAlignmentSpace)\(eventPathArrays)")
    print("\n\(consoleAlignmentSpace)\(eventDescriptionArrays.count) blocks' events: \n\(consoleAlignmentSpace)\(eventDescriptionArrays)")
    print("\n\(consoleAlignmentSpace)\(eventStatusArrays.count) blocks' event-status raw values: \n\(consoleAlignmentSpace)\(eventStatusArrays)")
    
    let dateColonOrNot = (eventDateArrays.isEmpty) ? "." : ":"
    //let elementsNewlined = eventDateArrays.map {"\($0)"}.joined(separator: "\n\(consoleAlignmentSpace)")
    //print("\n\(consoleAlignmentSpace)\(eventDateArrays.count) event dates\(dateColonOrNot) \n\(consoleAlignmentSpace)\(elementsNewlined)")
    
    let formattedDatesArrays = formatDatesFromComponentsArray(eventDateArrays)
    //print("\n\(consoleAlignmentSpace)\(formattedDatesArrays.count) event dates\(dateColonOrNot) \n\(consoleAlignmentSpace)\(formattedDatesArrays)")
    let elementsNewlined = formattedDatesArrays.map {"\($0)"}.joined(separator: "\n\(consoleAlignmentSpace)")
    print("\n\(consoleAlignmentSpace)\(eventDateArrays.count) blocks' event dates\(dateColonOrNot) \n\(consoleAlignmentSpace)\(elementsNewlined)")
}


// Called when LOADING & REFRESHING DATE:

func pryntLastLoginDate() {// spelling 'prynt' with a y so this function's existence does not cause override of autocomplete for print statements
    print(formattedDateString(lastLoggedInDate, roundedDown: false, prefix: "last login              ", suffix: "", short: false))
    //print("              (unformatted gmt)    \(lastLoggedInDate)\n")
}

func pryntCurrentDate() {
    print(formattedDateString(Date(), roundedDown: false, prefix: "date right now          ", suffix: "", short: false)); print("")
    //print("              (unformatted gmt)    \(Date())\n")
}


// (from AppLifecycle.swift:)
/*let s = "🔅became active"
 if firstReenteredForeground {customApplicationStatusPrint(s)}
 else {print(s)}*/

