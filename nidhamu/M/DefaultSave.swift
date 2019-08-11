// DefaultSave      ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

func defaultSaveData(showDate: Bool) {                      
    
    if showDate {print(formattedDateString(Date(), roundedDown: false, prefix: "✔︎saved to your device on", suffix: "", short: false))}
    
    let defaults = UserDefaults.standard
    
    eventPathArrays.removeAll(); eventDescriptionArrays.removeAll(); eventStatusArrays.removeAll(); eventDateArrays.removeAll()
    
    for key in eventsAtIndexPath.keys {
        let (a, b) = key.values                                                                           //; print("key: [\(key)  values \((a, b))")
        guard let val = eventsAtIndexPath[key] else {print("could not create event at index path key"); return}
        guard let todo = val.last?.eventDescription else {print("no description at event value"); return}
        if todo != defaultEmptyEventDescription {                                                         //; print(\((a, b)): \(todo))
            eventPathArrays.append([a, b])
        }
    }
    
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
    //pryntSavedArrays()
    //lastLoginDateComponents = [year, month, day, weekday, hour, minute] // setting the /latest login date (for saving) as the date this minute
    
    let (yr, mnth, dy, wkdy, _, hr, mn) = displayDate(Date(), roundedDown: false)
    lastLoginDateComponents = [yr, mnth, dy, wkdy, hr, mn]
    defaults.set(lastLoginDateComponents, forKey: "savedLastLoginDate")
    
    defaults.set(eventPathArrays, forKey: "savedTimeBlockPaths")
    defaults.set(eventDescriptionArrays, forKey: "savedTodoListItems")
    defaults.set(eventStatusArrays, forKey: "savedTodoListStatuses")
    defaults.set(eventDateArrays, forKey: "savedTodoListDates")
    
}

