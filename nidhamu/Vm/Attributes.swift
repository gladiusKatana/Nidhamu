// Attributes       ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension CustomFlowLayout { 
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {         //print("layout for elements...")
        var attributesForElements = [UICollectionViewLayoutAttributes]()
        
        for j in 0 ..< cols {
            for i in 0 ..< rows {
                var ip : IndexPath = IndexPath()
                
                if !loadsHorizontally {ip = IndexPath(item: i, section: j)}
                else                {ip = IndexPath(item: j, section: i)}
                
                let attribute = UICollectionViewLayoutAttributes(forCellWith: ip) //let attribute = self.layoutAttributesForItem(at: ip)!
                var xO = CGFloat(0);    var yO = CGFloat(0)                                                     //; print("*", terminator: "")
                let xDefault : CGFloat = CGFloat(j) * widthPlusSpace
                
                let regularRows = CGFloat(rows - lockedHeaderRows)
                
                let one = CGFloat(1)
                let headerHeightFactor = CGFloat(0.8)
                let cellHeightIncrease = (one - headerHeightFactor) * CGFloat(lockedHeaderRows) / regularRows
                let cellHeightFactor = one + cellHeightIncrease
                
                if i < lockedHeaderRows {
                    if j < lockedHeaderSections {
                        xO = xOffSet + CGFloat(j) * widthPlusSpace
                    } else {xO = xDefault}
                    
                    if self == taskTaggingLayout {yO = yOffset - CGFloat(navBarHeight + statusBarHeight)}
                    else {
                        yO = yOffset + CGFloat(i) * heightPlusSpace * headerHeightFactor
                    }
                    
                    attribute.frame = CGRect(x: xO, y: yO, width: cellWidth!, height: cellHeight! * headerHeightFactor)
                }
                else {
                    let headerDelta = yOffset + CGFloat(lockedHeaderRows) * heightPlusSpace * headerHeightFactor
                    
                    let y = headerDelta + CGFloat(i - lockedHeaderRows) * heightPlusSpace * cellHeightFactor
                    
                    if j < lockedHeaderSections {
                        xO = xOffSet + CGFloat(j) * widthPlusSpace;     yO = y
                    } else { xO = xDefault;                             yO = y}
                    
                    attribute.frame = CGRect(x: xO, y: yO, width: cellWidth!, height: cellHeight! * cellHeightFactor)
                }
                
                setZIndex(row: i, section: j, cellAttributes: attribute)
                attributesForElements.append(attribute)
            }
        }
        return attributesForElements
    }
}

