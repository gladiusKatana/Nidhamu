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
                let rowDifference = CGFloat(lockedHeaderRows) - regularRows
                
                let headerHeightFactor = CGFloat(0.5)
                let cellHeightIncrease = headerHeightFactor * CGFloat(lockedHeaderRows) / regularRows
                let cellHeightFactor = CGFloat(1) + cellHeightIncrease
                
                if i < lockedHeaderRows {
                    if j < lockedHeaderSections {
                        xO = xOffSet + CGFloat(j) * widthPlusSpace
                    } else {xO = xDefault}
                    if self != taskTaggingLayout {yO = yOffset + CGFloat(i) * heightPlusSpace * headerHeightFactor}
                    else {
                        yO = yOffset - CGFloat(navBarHeight + statusBarHeight)
                    }
                    
                    attribute.frame = CGRect(x: xO, y: yO, width: cellWidth!, height: cellHeight! * headerHeightFactor)
                }
                else {
                    let headerDelta = CGFloat(lockedHeaderRows) * heightPlusSpace + cellHeightIncrease * heightPlusSpace * rowDifference
                    
                    let yDefault = CGFloat(i) * heightPlusSpace * cellHeightFactor - headerDelta
                    
                    if j < lockedHeaderSections {
                        xO = xOffSet + CGFloat(j) * widthPlusSpace;     yO = yDefault
                    } else { xO = xDefault;                             yO = yDefault}
                    
                    attribute.frame = CGRect(x: xO, y: yO, width: cellWidth!, height: cellHeight! * cellHeightFactor)
                }
                
                setZIndex(row: i, section: j, cellAttributes: attribute)
                attributesForElements.append(attribute)
            }
        }
        return attributesForElements
    }
}

