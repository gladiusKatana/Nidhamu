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
    
    func addToTimeBlocks(column: Int, row: Int, textEntered: String, taskDeadline: Date, withStatus: TaskStatus?) {
        
        var status : TaskStatus
        if withStatus != nil {status = withStatus!} else {status = .upcoming}
        
        let timeBlockToAdd = TimeBlock(values:(column, row))
        let simpleTask = SimpleTask(taskDescription: textEntered, taskDate: taskDeadline, taskStatus: status)
        
        if tasksAtIndexPath[timeBlockToAdd] != nil {
            tasksAtIndexPath[timeBlockToAdd]!.append(simpleTask)
        }
            
        else {
            tasksAtIndexPath[timeBlockToAdd] = [simpleTask]
        }
        
    }
}

//struct ArchiveBlock<T: Hashable, U: Hashable, V: Hashable, W: Hashable>: Hashable {           /// used in tasksAtDate (not implemented (yet).)
//
//    let values : (T, U, V, W)
//    func hash(into hasher: inout Hasher) {
//        let (a,b,c,d) = values
//        hasher.combine(a.hashValue &* 31 &+ b.hashValue &* 31 &+ c.hashValue &* 31 &+ d.hashValue)
//    }
//}
//
//func ==<T:Hashable,U:Hashable,V:Hashable,W:Hashable>(lhs: ArchiveBlock<T,U,V,W>,
//                                                     rhs: ArchiveBlock<T,U,V,W>) -> Bool {    /// comparison function for conforming to Equatable protocol
//    return lhs.values == rhs.values
//}

