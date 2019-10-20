// VCType           ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

enum CollectionViewType: Int {
    case initial = 0
    case hours, todoList, archive, deferralDates,
    days, months, years, eventClassifier
    
    func simpleDescription() -> String {
        
        switch self {
            
        case .initial:
            return "initial value to satisfy initializer of global collection view controller 'currentTopVC'"
            
        case .hours:
            return "shows the hours of this week"
            
        case .todoList:
            return "shows the events (todo list items) of this hour"
            
        case .archive:
            return "shows all events previously tagged on the timetable (organized by date)"
            
        case .deferralDates:
            return "shows all time blocks in the coming week, for selection of a deadline-deferral"
            
        case .days:
            return "shows the days of this month"
            
        case .months:
            return "shows the months of this year"
            
        case .years:
            return "shows the years of this century"
            
        case .eventClassifier:
            return "prompts the user to classify an event"
        }
    }
}

