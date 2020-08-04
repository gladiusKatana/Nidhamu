// Strings          ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

func truncateString(_ input: String, cell: CustomCell, layout: CustomFlowLayout) -> String {
    
    var truncatedString = input
    var trail = ""
    var i = input.count
    var width = CGFloat(0)
    
    let font = cell.titleLabel.font
    let size = input.stringSize(font: font!).width                       //; print(size)
    let truncTrailSize = truncationTrail.stringSize(font: font!).width
    let sizeLimit = (layout.cellWidth! - truncTrailSize) * 0.75
    
    if size <= sizeLimit {                                              //print("\(input) is within bounds")
        truncatedString = input
    } else {                                                              //print("\(input) is outside bounds")
        trail = truncationTrail
        
        while width < sizeLimit {
            truncatedString = String(input.prefix(input.count - i))     //; print("i=\(i) trunc'd: \(truncatedString)")
            width = truncatedString.stringSize(font: font!).width
            
            let currentLetter = input.prefix(truncatedString.count + 1).last
            let strCurrentLetter = "\(currentLetter ?? "!")"
            
            ///print("i=\(i)  trunc'd: \(truncatedString)  letter: \(strCurrentLetter)")
            
            if "\(truncatedString)\(strCurrentLetter)" == input {       //print("last letter is \(strCurrentLetter)")
                trail = strCurrentLetter
            }
            
            if (truncatedString) == input {
                trail = ""
            }
            
            i -= 1
        }
    }
    
    let returnString = "\(truncatedString)\(trail)"                     //; print("\ntruncated to \(returnString)")
    return returnString
}

extension String {
    func stringSize(font: UIFont) -> CGSize {
        let fontAttribute = [NSAttributedString.Key.font: font]
        /// for Single Line:
        let size = self.size(withAttributes: fontAttribute)             //let size = (myText as NSString).size(withAttributes: fontAttributes)
        return size;
    }
}

//extension CollectionVC {
//    func findAverageLetterWidthWithCellLabelFont(cell: CustomCell) {
//        for char in "abcdefghijklmnopqrstuvwxyz" {
//
//            let size = "\(char)".stringSize(font: cell.titleLabel.font).width   //; print("size of \(char): \(size)")
//
//            averageLetterWidth = size
//        }
//    }
//}

///For cell title label text truncation
/*if row == 5 && column == 1 {
 if viewControllerType == .hours {findAverageLetterWidthWithCellLabelFont(cell: cell)} /// done here so it's only called once, but can access a cell
 }*/

