// Sorting          ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit


func findSortingTransform(_ input: [[Int]], output: [[Int]]) -> [Int] { // Only called on index-path array here (note, index paths are unique)...
    
    var transform = [Int]()                                             // ...so duplication when looping over elements is not an issue
    
    for element in input {                                              // Note, index path array (input) is date-sorted)...
        transform.append(output.firstIndex(of: element)!)
    }                                                                   // ...that's why it's used to find the sorting transform
    
    return transform
}


func applySortingTransform(_ input: [Any], transform: [Int]) -> [Any] {
    
    var output = [Any]()
    for _ in input {output.append(0)}
    
    var i = 0
    
    for element in input {
        
        ///let i = output.firstIndex(of: element)!                                                      ///Does not handle duplication. Need to do the old-school way, via index integer i. (Also see comment above...
        
        output[transform[i]] = element                      //print("inserting \(element) at \(transform[i])")
        
        if i < transform.count - 1 {i += 1}
    }
    
    return output // return the input, mutated (sorted); would make this a mutating func, but it's global
}

