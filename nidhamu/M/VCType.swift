// VCType           ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

enum CollectionViewType: Int {
    case initial = 0
    case timetable, taskList, archive, deferralDates,
    days, months, years, taskClassifier
    
    func simpleDescription() -> String {
        
        switch self {
            
        case .initial:
            return "initial value to satisfy initializer of global collection view controller 'topVC'"
            
        case .timetable:
            return "shows each hour of this week"
            
        case .taskList:
            return "shows the tasks (task list items) added to each hour of this week"
            
        case .archive:
            return "shows all tasks previously tagged by the app (organized by date) since the last archive export (to CSV)"
            
        case .deferralDates:
            return "shows all time blocks over a 1-week period from the current hour, for deferral of a task to a later deadline"
            
            
            /// The next 3 cases are not implemented in this app (but have been in other time-block-based apps written by gladiusKatana)...
            /// ...and they will likely be added in in the future
            
            
        case .days:
            return "shows the days of this month"
            
        case .months:
            return "shows the months of this year"
            
        case .years:
            return "shows the years of this century"
            
        case .taskClassifier:
            return "prompts the user to classify an task"
        }
    }
}

