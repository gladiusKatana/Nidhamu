// DefaultLoad      ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

func defaultLoadData(showDate: Bool) {                                                      //print("(load using defaults)\n")
    
    let defaults = UserDefaults.standard
    
    if let components = defaults.array(forKey: "savedLastLoginDate") {
        lastLoginDateComponents = components  
        lastLoggedInDate = dateFromComponents(lastLoginDateComponents)
        if showDate {
            pryntLastLoginDate()
            pryntCurrentDate()
        }
    }
    else {                                                                                //print("\nfirst login")
        let (yr, mo, dy, wkd, _, hr, mn) = displayDate(Date(), roundedDown: true)
        lastLoginDateComponents = [yr, mo, dy, wkd, hr, mn]
    }
    
    eventPathArrays = defaults.array(forKey: "savedTimeBlockPaths") as? [[Int]] ?? []
    eventDescriptionArrays = defaults.array(forKey: "savedTodoListItems") as? [[String]] ?? []
    eventStatusArrays = defaults.array(forKey: "savedTodoListStatuses") as? [[Int]] ?? []
    eventDateArrays = defaults.array(forKey: "savedTodoListDates") as? [[[Any]]] ?? [[[]]]
    populateDictionaryFromDefaults()                                                        //; printSavedArrays()
}

func populateDictionaryFromDefaults() {
    
    var i = 0
    
    for path in eventPathArrays {
        
        let todoListItemDescriptions = eventDescriptionArrays[i] //!*
        var events = [SimpleEvent]()
        var j = 0
        
        for description in todoListItemDescriptions {
            let todoListItemStatus = eventStatusArrays[i][j]
            let dateComponents = eventDateArrays[i][j]                                      //; print("event date components: \(dateComponents)")
            let date = dateFromComponents(dateComponents)                                   //; print("date: \(date)")
            let event = SimpleEvent(eventDescription: description, eventDate: date, eventStatus: EventStatus(rawValue: todoListItemStatus)!)
            
            print("loaded: '\(event.eventDescription)' [\(event.eventStatus)] with deadline:\(formattedDateString(date, roundedDown: true, prefix: "", suffix: "", short: false))")
            
            events.append(event)
            j += 1
        }
        
        eventsAtIndexPath[TimeBlock(values: (path[0], path[1]))] = events
        i += 1
    }
}

