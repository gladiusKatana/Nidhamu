// Strings          ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension String {
    
    func stringSize(font: UIFont) -> CGSize {
        let fontAttribute = [NSAttributedString.Key.font: font]
        
        /// for Single Line:
        let size = self.size(withAttributes: fontAttribute)             ///let size = (myText as NSString).size(withAttributes: fontAttributes)
        return size;
    }
    
}

func truncateString(_ input: String, sizeLimit: CGFloat, font: UIFont) -> String {
    
    var truncatedString = input
    var trail = ""
    var i = input.count
    var width = CGFloat(0)
    
    if input.stringSize(font: font).width <= sizeLimit {
        truncatedString = input
    }
    else { trail = truncationTrail
        while width < sizeLimit {
            truncatedString = String(input.prefix(input.count - i))     //; print("trunc'd: \(truncatedString)")
            width = truncatedString.stringSize(font: font).width
            i = i - 1
        }
    }
    
    return "\(truncatedString)\(trail)"
}

