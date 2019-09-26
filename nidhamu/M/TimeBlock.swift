// TimeBlock        ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit


struct TimeBlock<T: Hashable, U: Hashable>: Hashable {
    let values : (T, U)
    func hash(into hasher: inout Hasher) {
        let (a,b) = values
        hasher.combine(a.hashValue &* 31 &+ b.hashValue)
    }
}


func ==<T:Hashable,U:Hashable>(lhs: TimeBlock<T,U>, rhs: TimeBlock<T,U>) -> Bool {  // comparison function
    return lhs.values == rhs.values                                                 // for conforming to Equatable protocol
}


extension CollectionVC {
    
    func addToTimeBlocks(column: Int, row: Int, textEntered: String) {
        
        let timeBlockToAdd = TimeBlock(values:(column, row))
        let simpleEvent = SimpleEvent(eventDescription: textEntered, eventDate: selectedCellDate, eventStatus: .upcoming)
        
        if eventsAtIndexPath[timeBlockToAdd] != nil {
            
//            if eventsAtIndexPath[timeBlockToAdd]?.last!.eventDescription == defaultEmptyEventDescription {
//                eventsAtIndexPath[timeBlockToAdd] = [simpleEvent]
//            }
//            else {
                eventsAtIndexPath[timeBlockToAdd]!.append(simpleEvent) //!  can probably clean this up. Why not just append either way?
//            }
            
        }
            
        else {eventsAtIndexPath[timeBlockToAdd] = [simpleEvent]}
        
    }
}

