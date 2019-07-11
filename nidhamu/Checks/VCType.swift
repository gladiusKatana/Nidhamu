//  VCType.swift
//  nidhamu  ∙  1st commit July. 08, 2019  ∙  Created by Garth Snyder, aka gladiusKatana ⚔️
import UIKit

enum CollectionViewType: Int {
    case initial = 0
    case hours, todoList, days, months, years, eventClassifier
    
    func simpleDescription() -> String {
        
        switch self {
            
        case .initial:
            return "initial value to satisfy initializer of global collection view controller 'currentTopVC'"
            
        case .hours:
            return "shows the hours of this week"
            
        case .todoList:
            return "shows the todo list items of this hour"
            
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

