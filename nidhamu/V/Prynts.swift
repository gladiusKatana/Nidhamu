// Prynts           ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

/// Called when LOADING & REFRESHING DATE:

func pryntLastLoginDate() {// spelling 'prynt' with a y so this function's existence does not cause override of autocomplete for print statements
    print(formattedDateString(lastLoggedInDate, roundedDown: false, prefix: "last login              ", suffix: "", short: false))
    //print("              (unformatted gmt)    \(lastLoggedInDate)\n")
}

func pryntCurrentDate() {
    print(formattedDateString(Date(), roundedDown: false, prefix: "date right now          ", suffix: "", short: false)); print("")
    //print("              (unformatted gmt)    \(Date())\n")
}

/// Called when SAVING:

func pryntSavedArrays() {
    
    let consoleAlignmentSpace = "                     "
    
    print("\n\(consoleAlignmentSpace)\(eventDescriptionArrays.count) blocks' events: \n\(consoleAlignmentSpace)\(eventDescriptionArrays)")
    
    print("\n\(consoleAlignmentSpace)\(eventPathArrays.count) blocks' paths: \n\(consoleAlignmentSpace)\(eventPathArrays)")
    
    print("\n\(consoleAlignmentSpace)\(eventStatusArrays.count) blocks' event-status raw values: \n\(consoleAlignmentSpace)\(eventStatusArrays)")
    
    let dateColonOrNot = (eventDateArrays.isEmpty) ? "." : ":"
    //let elementsNewlined = eventDateArrays.map {"\($0)"}.joined(separator: "\n\(consoleAlignmentSpace)")
    //print("\n\(consoleAlignmentSpace)\(eventDateArrays.count) event dates\(dateColonOrNot) \n\(consoleAlignmentSpace)\(elementsNewlined)")
    
    let formattedDatesArrays = formatDatesFromComponentsArray(eventDateArrays)
    
    //print("\n\(consoleAlignmentSpace)\(formattedDatesArrays.count) event dates\(dateColonOrNot) \n\(consoleAlignmentSpace)\(formattedDatesArrays)")
    
    let elementsNewlined = formattedDatesArrays.map {"\($0)"}.joined(separator: "\n\(consoleAlignmentSpace)")
    print("\n\(consoleAlignmentSpace)\(eventDateArrays.count) blocks' event dates\(dateColonOrNot) \n\(consoleAlignmentSpace)\(elementsNewlined)")
}

func pryntSortedSavedArrays() {
    let spaces = "                     "
    let colonOrPeriod = (eventDateArrays.isEmpty) ? "." : ":" // or could use any of the other event-property arrays, they're all the same size

    let formattedDatesArrays = formatDatesFromComponentsArray(eventDateArrays)
    let sortedFormattedDatesArrays = applySortingTransform(formattedDatesArrays, transform: sortingTransform)
    let sortedFormattedDatesNewlined = sortedFormattedDatesArrays.map {"\($0)"}.joined(separator: "\n\(spaces)")
    let sortedEventDescriptionArrays = applySortingTransform(eventDescriptionArrays, transform: sortingTransform)
    
    print("\n\(spaces)\(sortedEventDescriptionArrays.count) blocks' events\(colonOrPeriod)\n\(spaces)\(sortedEventDescriptionArrays)")
    print("\n\(spaces)\(sortedEventPathArrays.count) blocks' paths\(colonOrPeriod)\n\(spaces)\(sortedEventPathArrays)") ///eventPathArrays
    print("\n\(spaces)\(sortedFormattedDatesNewlined.count) blocks' event dates\(colonOrPeriod)\n\(spaces)\(sortedFormattedDatesNewlined)")
}


//func pryntSortedSavedArrays() { //the version that would be used if event property arrays were global, and sorted before saving
//    let spaces = "                     "
//    let colonOrPeriod = (eventDateArrays.isEmpty) ? "." : ":" // or could use any of the other event-property arrays, they're all the same size
//
//    let sortedFormattedDatesNewlined = sortedFormattedDatesArrays.map {"\($0)"}.joined(separator: "\n\(spaces)")
//
//    print("\n\(spaces)\(sortedEventDescriptionArrays.count) blocks' events\(colonOrPeriod)\n\(spaces)\(sortedEventDescriptionArrays)")
//    print("\n\(spaces)\(sortedEventPathArrays.count) blocks' paths\(colonOrPeriod)\n\(spaces)\(sortedEventPathArrays)") ///eventPathArrays
//    print("\n\(spaces)\(sortedFormattedDatesNewlined.count) blocks' event dates\(colonOrPeriod)\n\(spaces)\(sortedFormattedDatesNewlined)")
//}


/// (from AppLifecycle.swift:)
/*let s = "🔅became active"
 if firstReenteredForeground {customApplicationStatusPrint(s)}
 else {print(s)}*/

