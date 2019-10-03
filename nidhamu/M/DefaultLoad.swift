// DefaultLoad      ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

func defaultLoadData(showDate: Bool) {                                                      //print("(load using defaults)\n")
    
    let defaults = UserDefaults.standard
    
    if let components = defaults.array(forKey: "savedLastLoginDate") {
        lastLoginDateComponents = components  
        lastLoginDate = dateFromComponents(lastLoginDateComponents)
        if showDate {
            pryntLastLoginDate()
            pryntCurrentDate()
        }
    }
    else {                                                                                  //print("\nfirst login")
        let (year, _, month, _ , day, weekday, _, hour, minute, _) = getChosenDateComponents(Date(), roundedDown: true)
        lastLoginDateComponents = [year, month, day, weekday, hour, minute]
    }
    
    timeBlockPaths = defaults.array(forKey: "savedTimeBlockPaths") as? [[Int]] ?? []
    eventDescriptionArrays = defaults.array(forKey: "savedEventDescriptionArrays") as? [[String]] ?? []
    eventDateArrays = defaults.array(forKey: "savedEventDateArrays") as? [[[Any]]] ?? [[[]]]
    eventStatusArrays = defaults.array(forKey: "savedEventStatusArrays") as? [[Int]] ?? []
    
    archiveEventDescriptions = defaults.array(forKey: "savedArchiveEventDescriptions") as? [String] ?? []
    archiveEventStatuses = defaults.array(forKey: "savedArchiveEventStatuses") as? [Int] ?? []
    archiveEventDateComponentArrays = defaults.array(forKey: "savedArchiveEventDateComponentArrays") as? [[Int]] ?? []
    
    populateDictionaryFromDefaults()                                                        //; print("loaded event paths: \(timeBlockPaths)")
}

func populateDictionaryFromDefaults() {
    var i = 0
    
    for path in timeBlockPaths {                                                            //print("path: \(path)")
        
        let eventDescriptions = eventDescriptionArrays[i] //!*
        var events = [SimpleEvent]()
        var j = 0
        
        for description in eventDescriptions {
            let eventStatus = eventStatusArrays[i][j]
            let dateComponents = eventDateArrays[i][j]                                      //; print("event date components: \(dateComponents)")
            let date = dateFromComponents(dateComponents)                                   //; print("date: \(date)")
            let event = SimpleEvent(eventDescription: description, eventDate: date, eventStatus: EventStatus(rawValue: eventStatus)!)
            
            ///print("loaded: '\(event.eventDescription)' [\(event.eventStatus)] with deadline:\(formattedDateString(date, roundedDown: true, prefix: "", suffix: "", short: false))")
            
            events.append(event)
            j += 1
        }
        
        eventsAtIndexPath[TimeBlock(values: (path[0], path[1]))] = events
        i += 1
    }
}

