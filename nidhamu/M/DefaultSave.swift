// DefaultSave      ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

func defaultSaveData(showDate: Bool, pryntEvents: Bool) {
    
    if showDate {print(formattedDateString(Date(), roundedDown: false, prefix: "✔︎saved to your device on", suffix: "", dateFormat: .fullDayWithYear))}
    else {print("✔︎saved")}
    
    let defaults = UserDefaults.standard
    
    timeBlockPaths.removeAll(); eventDescriptionArrays.removeAll(); eventStatusArrays.removeAll(); eventDateArrays.removeAll()
    
    for key in eventsAtIndexPath.keys {
        let (a, b) = key.values                                                                     //; print("key: [\(key)  values \((a, b))")
        guard let val = eventsAtIndexPath[key] else {print("could not create event at index path key"); return}
        guard let todo = val.last?.eventDescription else {print("no description at event value"); return}
        if todo != defaultEmptyEventDescription {                                                   //; print(\((a, b)): \(todo))
            timeBlockPaths.append([a, b])
        }
    }
    
    sortedTimeBlockPaths = timeBlockPaths.sorted(by: {topVC.lastEventFromPath($0).eventDate < topVC.lastEventFromPath($1).eventDate})
    sortingTransform = findSortingTransform(timeBlockPaths, output: sortedTimeBlockPaths)           //; print("T:\(sortingTransform)\n")
    
    for vals in eventsAtIndexPath.values {
        if vals.count > 1 || vals.count == 1 && vals[0].eventDescription != defaultEmptyEventDescription {
            var eventDescriptions = [String]()
            var eventStatuses = [Int]()
            var eventDateComponents = [[Int(), String(), Int(), String(), Int(), Int()]] as [[Any]]
            eventDateComponents.removeAll()   // *
            
            for event in vals {
                eventDescriptions.append(event.eventDescription)
                eventStatuses.append(event.eventStatus.rawValue)
                let (year, month, _ , day, weekday, _, hour, minute) = displayDate(event.eventDate, roundedDown: true)
                eventDateComponents.append([year, month, day, weekday, hour, minute])
            }
            eventDescriptionArrays.append(eventDescriptions)
            eventStatusArrays.append(eventStatuses)
            eventDateArrays.append(eventDateComponents)
        }//else {print("\n!descriptions array at this time block contains only default (\(defaultEmptEventDescription)), and it's: \(vals[0].eventDescription)")}
    }
    
    timeBlockPaths = sortedTimeBlockPaths
    eventDateArrays = applySortingTransform(eventDateArrays, transform: sortingTransform) as! [[[Any]]]
    eventDescriptionArrays = applySortingTransform(eventDescriptionArrays, transform: sortingTransform) as! [[String]]
    eventStatusArrays = applySortingTransform(eventStatusArrays, transform: sortingTransform) as! [[Int]]
    
    if pryntEvents {printEventsTabularized()} //{pryntSortedSavedArrays()}
    setForKeys(defaults)
}

func setForKeys(_ defaults: UserDefaults) {
    let (year, month, _ , day, weekday, _, hour, minute) = displayDate(Date(), roundedDown: false)
    lastLoginDateComponents = [year, month, day, weekday, hour, minute]
    defaults.set(lastLoginDateComponents, forKey: "savedLastLoginDate")
    
    defaults.set(timeBlockPaths, forKey: "savedTimeBlockPaths")
    defaults.set(eventDescriptionArrays, forKey: "savedEventDescriptionArrays")
    defaults.set(eventDateArrays, forKey: "savedEventDateArrays")
    defaults.set(eventStatusArrays, forKey: "savedEventStatusArrays")
}

