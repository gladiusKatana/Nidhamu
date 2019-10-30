// VCType           ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

enum CollectionViewType: Int {
    case initial = 0
    case timetable, todoList, archive, deferralDates,
    days, months, years, taskClassifier
    
    func simpleDescription() -> String {
        
        switch self {
            
        case .initial:
            return "initial value to satisfy initializer of global collection view controller 'currentTopVC'"
            
        case .timetable:
            return "shows the hours of this week"
            
        case .todoList:
            return "shows the tasks (todo list items) of this hour"
            
        case .archive:
            return "shows all tasks previously tagged on the timetable (organized by date)"
            
        case .deferralDates:
            return "shows all time blocks in the coming week, for selection of a deadline-deferral"
            
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

