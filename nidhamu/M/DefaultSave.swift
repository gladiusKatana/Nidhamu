// DefaultSave      ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

func defaultSaveData(saveDate: Bool, resetLastLogin: Bool, showDate: Bool, pryntEvents: Bool) {
    
    if showDate {print(formattedDateString(Date(), roundedDown: false, showYear: true, prefix: "✔︎saved", suffix: "", dateFormat: .fullDayWithSeconds))}
    let defaults = UserDefaults.standard
    timeBlockPaths.removeAll(); eventDescriptionArrays.removeAll(); eventStatusArrays.removeAll(); eventDateArrays.removeAll()
    
    for key in eventsAtIndexPath.keys {
        let (a, b) = key.values                                                                     //; print("key: [\(key)  values \((a, b))")
        timeBlockPaths.append([a, b])
    }
    
    sortedTimeBlockPaths = timeBlockPaths.sorted(by: {lastEventFromPath($0).eventDate < lastEventFromPath($1).eventDate})
    sortingTransform = findSortingTransform(timeBlockPaths, output: sortedTimeBlockPaths)           //; print("T:\(sortingTransform)\n")
    
    for vals in eventsAtIndexPath.values {
        if vals.count >= 1 {
            var eventDescriptions = [String]()
            var eventStatuses = [Int]()
            var eventDateComponents = [[Int(), String(), Int(), String(), Int(), Int()]] as [[Any]]
            eventDateComponents.removeAll() /// keep this line, even though it looks like the above array-of-arrays is initialized empty on each iteration of the loop, it's not
            
            for event in vals {
                eventDescriptions.append(event.eventDescription)
                eventStatuses.append(event.eventStatus.rawValue)
                let (year, _, month, _ , day, weekday, _, hour, minute, _) = getChosenDateComponents(event.eventDate, roundedDown: true)
                eventDateComponents.append([year, month, day, weekday, hour, minute])
            }
            eventDescriptionArrays.append(eventDescriptions)
            eventStatusArrays.append(eventStatuses)
            eventDateArrays.append(eventDateComponents)
        }///else {print("\n!descriptions array at this time block contains only default (\(defaultEmptEventDescription)), and it's: \(vals[0].eventDescription)")}
    }
    
//    for archive in archiveEvents { /// yes I know this loop is wordy. May rename all UserDefaults-saved arrays
//        if !archiveEventDescriptions.contains(archive.eventDescription) {
//            archiveEventDescriptions.append(archive.eventDescription)
//        }
//        if !archiveEventStatuses.contains(archive.eventStatus.rawValue) {archiveEventStatuses.append(archive.eventStatus.rawValue)}
//        if !archiveEventDateComponentArrays.contains(getEventDateComponents(archive)) {
//            archiveEventDateComponentArrays.append(getEventDateComponents(archive))
//        }
//    }
    
    print("archive events: \(archiveEventDescriptions)")
    
    timeBlockPaths = sortedTimeBlockPaths
    eventDescriptionArrays = applySortingTransform(eventDescriptionArrays, transform: sortingTransform) as! [[String]]
    eventStatusArrays = applySortingTransform(eventStatusArrays, transform: sortingTransform) as! [[Int]]
    eventDateArrays = applySortingTransform(eventDateArrays, transform: sortingTransform) as! [[[Any]]]
    if pryntEvents {printEventsTabularized()}
    setForKeys(defaults, saveDate: saveDate, resetLastLogin: resetLastLogin)
}

func setForKeys(_ defaults: UserDefaults, saveDate: Bool, resetLastLogin: Bool) {
    if saveDate {
        let (year, _, month, _ , day, weekday, _, hour, minute, _) = getChosenDateComponents(Date(), roundedDown: false)
        lastLoginDateComponents = [year, month, day, weekday, hour, minute]
        if resetLastLogin {lastLoginDate = dateFromComponents(lastLoginDateComponents)}
        defaults.set(lastLoginDateComponents, forKey: "savedLastLoginDate")
    }
    defaults.set(timeBlockPaths, forKey: "savedTimeBlockPaths")
    defaults.set(eventDescriptionArrays, forKey: "savedEventDescriptionArrays")
    defaults.set(eventDateArrays, forKey: "savedEventDateArrays")
    defaults.set(eventStatusArrays, forKey: "savedEventStatusArrays")
    
    defaults.set(archiveEventDescriptions, forKey: "savedArchiveEventDescriptions")
    defaults.set(archiveEventStatuses, forKey: "savedArchiveEventStatuses")
    defaults.set(archiveEventDateComponentArrays, forKey: "savedArchiveEventDateComponentArrays")
}

func getEventDateComponents(_ event: SimpleEvent) -> [Int] {
    let (year, monthInt, _, _ , day, _, _, hour, _, _) = getChosenDateComponents(event.eventDate, roundedDown: false)
    
    return [year, monthInt, day, hour]
}

