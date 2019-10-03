// TimeBlock        ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit


struct TimeBlock<T: Hashable, U: Hashable>: Hashable {
    let values : (T, U)
    func hash(into hasher: inout Hasher) {
        let (a,b) = values
        hasher.combine(a.hashValue &* 31 &+ b.hashValue)
    }
}


func ==<T:Hashable,U:Hashable>(lhs: TimeBlock<T,U>,
                               rhs: TimeBlock<T,U>) -> Bool {   /// comparison function for conforming to Equatable protocol
    return lhs.values == rhs.values
}


extension CollectionVC {
    
    func addToTimeBlocks(column: Int, row: Int, textEntered: String) {
        
        let timeBlockToAdd = TimeBlock(values:(column, row))
        let simpleEvent = SimpleEvent(eventDescription: textEntered, eventDate: selectedCellDate, eventStatus: .upcoming)
        
        if eventsAtIndexPath[timeBlockToAdd] != nil {
            eventsAtIndexPath[timeBlockToAdd]!.append(simpleEvent)
        }
            
        else {
            eventsAtIndexPath[timeBlockToAdd] = [simpleEvent]
        }
        
    }
}

//struct ArchiveBlock<T: Hashable, U: Hashable, V: Hashable, W: Hashable>: Hashable {
//
//    let values : (T, U, V, W)
//    func hash(into hasher: inout Hasher) {
//        let (a,b,c,d) = values
//        hasher.combine(a.hashValue &* 31 &+ b.hashValue &* 31 &+ c.hashValue &* 31 &+ d.hashValue)
//    }
//}
//
//func ==<T:Hashable,U:Hashable,V:Hashable,W:Hashable>(lhs: ArchiveBlock<T,U,V,W>,
//                                                     rhs: ArchiveBlock<T,U,V,W>) -> Bool {   /// comparison function for conforming to Equatable protocol
//    return lhs.values == rhs.values
//}
