// Sorting          ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

func findSortingTransform(_ input: [[Int]], output: [[Int]]) -> [Int] {         /// Only called on index-path array here (index paths are unique)...
    var transform = [Int]()                                                     /// ...so duplication when looping over elements is not an issue
    
    for element in input {                                                      /// Note, index path array (input) is date-sorted)...
        transform.append(output.firstIndex(of: element)!) ///* monitor for crash     /// ...that's why it's used to find the sorting transform
    }
    return transform
}

func findDateSortingTransform(_ input: [[Date]], output: [[Date]]) -> [Int] {
    var transform = [Int]()                                                     // see comments above
    
    for element in input {
        transform.append(output.firstIndex(of: element)!)
    }
    return transform
}

func applySortingTransform(_ input: [Any], transform: [Int]) -> [Any] {
    var output = [Any]()
    var i = 0
    
    for _ in input {output.append(0)}
    
    for element in input {
        ///let i = output.firstIndex(of: element)! //* using this method would not handle duplication. Need index integer. See comment above...
        output[transform[i]] = element                                          //print("inserting \(element) at \(transform[i])")
        if i < transform.count - 1 {i += 1}
    }
    return output
}

func lastTaskFromPath(_ path: [Int]) -> SimpleTask {
    let err = "no item @ path [sort attempt]"
    
    guard let tasksToProcess = tasksAtIndexPath[TimeBlock(values:(path[0], path[1]))],
          tasksAtIndexPath[TimeBlock(values:(path[0], path[1]))]!.count > 0
    else {
        print(err)
        return SimpleTask(taskDescription: err, deadline: Date(), taskStatus: .done)
    }
    return tasksToProcess.last!
}

