// Sorting          ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit


func findSortingTransform(_ input: [[Int]], output: [[Int]]) -> [Int] { // only called on index-path array here (index paths are unique)...
    
    var transform = [Int]()                                             // ...so duplication of  element  in for loop is not an issue...
    
    for element in input {                                              // ...()
        transform.append(output.firstIndex(of: element)!)
    }
    
    return transform
}


func applySortingTransform(_ input: [Any], transform: [Int]) -> [Any] {
    
    var output = [Any]()
    for _ in input {output.append(0)}
    
    var i = 0
    
    for element in input {
        
        ///let i = output.firstIndex(of: element)!                                                      ///No!  does not handle duplication. Need to do the old-school way, below. (Also see comment...
        
        output[transform[i]] = element                      //print("inserting \(element) at \(transform[i])")
        
        if i < transform.count - 1 {i += 1}                 /// ...above-- "(which is date sorted)":  ie, all  event-property arrays (the NSUserDefaults data structure) are date-sorted
    }
    
    return output // return the input, mutated (sorted); would make this a mutating func, but it's global
}

