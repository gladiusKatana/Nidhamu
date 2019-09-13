// SimpleEvent      ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

class SimpleEvent: NSObject {
    var eventDescription = ""               // description of an event coming up (or todo-list item) on this day
    var eventDate = Date()                  // date the event/action occurs or must be done by
    var eventStatus = EventStatus.upcoming
    var recurring = false //* will use soon
    
    init(eventDescription: String, eventDate: Date, eventStatus: EventStatus) {
        self.eventDescription = eventDescription
        self.eventDate = eventDate
        self.eventStatus = eventStatus
    }
    
    func showEventProperties() {
        var descriptor = ""
        if eventStatus == .upcoming {
            descriptor = "will occur on"
        } else {descriptor = "occurred on"}
        print("\n Event: \(eventDescription)\n (\(eventStatus)); \(descriptor): \(eventDate)\n")
    }
}

enum EventStatus: Int, CaseIterable {
    
    case occurred = 0; case done, delegated, deferred, obviated, upcoming
    
    func simpleDescription() -> String {
        switch self {
        case .occurred:     return "event occurred"
        case .done:         return "task was done. Nice!"
        case .delegated:    return "task was delegated to someone else"
        case .deferred:     return "task was deferred; it will show in the time-block chosen during deferral"   // ***
        case .obviated:     return "task was obviated; no need to do it anymore"
        case .upcoming:     return "event is upcoming"
        }
    }
    
    func caseName() -> String {
        switch self {
        case .occurred:     return "Occurred"
        case .done:         return "Done"
        case .delegated:    return "Delegated"
        case .deferred:     return "Deferred"
        case .obviated:     return "Obviated"
        case .upcoming:     return "Upcoming"
        }
    }
}

