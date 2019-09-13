// DefaultSave      ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

func defaultSaveData(showDate: Bool, pryntEvents: Bool) {
    
    if showDate {print(formattedDateString(Date(), roundedDown: false, prefix: "✔︎saved to your device on", suffix: "", short: false))}
    
    let defaults = UserDefaults.standard
    
    eventPaths.removeAll(); eventDescriptionArrays.removeAll(); eventStatusArrays.removeAll(); eventDateArrays.removeAll()
    
    for key in eventsAtIndexPath.keys {
        let (a, b) = key.values                                                                     //; print("key: [\(key)  values \((a, b))")
        guard let val = eventsAtIndexPath[key] else {print("could not create event at index path key"); return}
        guard let todo = val.last?.eventDescription else {print("no description at event value"); return}
        if todo != defaultEmptyEventDescription {                                                   //; print(\((a, b)): \(todo))
            eventPaths.append([a, b])
        }
    }
    
    ///print("\nevent path arrays:\n\(eventPaths)")
    sortedEventPaths = eventPaths.sorted(by: {topVC.lastEventFromPath($0).eventDate < topVC.lastEventFromPath($1).eventDate})
    ///print("sorted event path arrays:\n\(sortedEventPaths)")
    sortingTransform = findSortingTransform(eventPaths, output: sortedEventPaths)                   //; print("T:\(sortingTransform)\n")
    
    for vals in eventsAtIndexPath.values {
        if vals.count > 1 || vals.count == 1 && vals[0].eventDescription != defaultEmptyEventDescription {
            var eventDescriptions = [String]()
            var eventStatuses = [Int]()
            var eventDateComponents = [[Int(), String(), Int(), String(), Int(), Int()]] as [[Any]]
            eventDateComponents.removeAll()   // *
            
            for event in vals {
                eventDescriptions.append(event.eventDescription)
                eventStatuses.append(event.eventStatus.rawValue)
                let (yr, mnth, dy, wkdy, _, hr, mn) = displayDate(event.eventDate, roundedDown: true)
                eventDateComponents.append([yr, mnth, dy, wkdy, hr, mn])
            }
            eventDescriptionArrays.append(eventDescriptions)
            eventStatusArrays.append(eventStatuses)
            eventDateArrays.append(eventDateComponents)
        }//else {print("\n!descriptions array at this time block contains only default (\(defaultEmptEventDescription)), and it's: \(vals[0].eventDescription)")}
    }
    
    sortedEventDateArrays = applySortingTransform(eventDateArrays, transform: sortingTransform)
    sortedEventDescriptionArrays = applySortingTransform(eventDescriptionArrays, transform: sortingTransform)
    sortedEventStatusArrays = applySortingTransform(eventStatusArrays, transform: sortingTransform)
    
    eventPaths = sortedEventPaths
    eventDateArrays = sortedEventDateArrays as! [[[Any]]]
    eventDescriptionArrays = sortedEventDescriptionArrays as! [[String]]
    eventStatusArrays = sortedEventStatusArrays as! [[Int]]
    
    if pryntEvents {pryntSortedSavedArrays()}
    
    //lastLoginDateComponents = [year, month, day, weekday, hour, minute] // setting the /latest login date (for saving) as the date this minute
    let (yr, mnth, dy, wkdy, _, hr, mn) = displayDate(Date(), roundedDown: false)
    lastLoginDateComponents = [yr, mnth, dy, wkdy, hr, mn]
    defaults.set(lastLoginDateComponents, forKey: "savedLastLoginDate")
    
    defaults.set(eventPaths, forKey: "savedTimeBlockPaths")
    defaults.set(eventDateArrays, forKey: "savedTodoListDates")        // rename to "savedEventDates"
    defaults.set(eventDescriptionArrays, forKey: "savedTodoListItems") // rename to "savedEventDescriptions"
    defaults.set(eventStatusArrays, forKey: "savedTodoListStatuses")   // rename to "savedEventStatuses"
}


func findSortingTransform(_ input: [[Int]], output: [[Int]]) -> [Int] { // only called on index-path array here (which is date-sorted*)...
                                                                        // ... so duplication of  element  in for loop is not an issue
    var transform = [Int]()

    for element in input {
        transform.append(output.firstIndex(of: element)!)
    }
    
    return transform
}


func applySortingTransform(_ input: [Any], transform: [Int]) -> [Any] {
    
    var output = [Any]()
    for _ in input {output.append(0)}
        
    var i = 0
    
    for element in input {
        
        ///let i = output.firstIndex(of: element)!                                                      ///No!  does not handle duplication. Need to do the old-school way, below. (Also see comment...

        output[transform[i]] = element                      //print("inserting \(element) at \(transform[i])")
        
        if i < transform.count - 1 {i += 1}                 /// ...above-- "(which is date sorted)":  ie, all  event-property arrays (the NSUserDefaults data structure) are date-sorted
    }
    
    return output // return the input, mutated (sorted); would make this a mutating func, but it's global
}

