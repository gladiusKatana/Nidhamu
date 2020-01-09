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
                let xDefault : CGFloat = CGFloat(j) * widthPlusSpace
                
                let regularRows = CGFloat(rows - lockedHeaderRows)
                let one = CGFloat(1)
                
                var xO = CGFloat(0);    var yO = CGFloat(0)                                                     //; print("*", terminator: "")
                var scalar = CGFloat(0)
                
                if timeBlockSize == 1 {headerHeightFactor = 1}
                else {headerHeightFactor = 0.4} /// if too small, last login date (shown in top-left cell, left-justified) no longer fits in landscape mode when keyboard presented
                
                var cellHeightIncrease = CGFloat(0)
                if self == taskTaggingLayout {cellHeightIncrease = (one - headerHeightFactor) * CGFloat(5) / 4} /// (locked headers / regular rows) of timetable
                else {
                    cellHeightIncrease = (one - headerHeightFactor) * CGFloat(lockedHeaderRows) / regularRows
                }
                
                if i < lockedHeaderRows {
                    if j < lockedHeaderSections {
                        xO = xOffSet + CGFloat(j) * widthPlusSpace
                    } else {xO = xDefault}
                    
                    if self == taskTaggingLayout {yO = yOffset - CGFloat(navBarHeight + statusBarHeight)}
                    else {
                        yO = yOffset + CGFloat(i) * heightPlusSpace * headerHeightFactor
                    }
                    
                    scalar = headerHeightFactor
                    
                } else {
                    if j < lockedHeaderSections {
                        xO = xOffSet + CGFloat(j) * widthPlusSpace
                    } else {xO = xDefault}
                    
                    let frac = timeBlockSize == 1 ? 1 : CGFloat(taskTaggingLayout.rows - 1)
                    if self == taskTaggingLayout {cellHeightFactor = (one + cellHeightIncrease) / frac}
                    else {
                        cellHeightFactor = one + cellHeightIncrease
                    }
                    
                    let headerDelta = yOffset + CGFloat(lockedHeaderRows) * heightPlusSpace * headerHeightFactor
                    let y = headerDelta + CGFloat(i - lockedHeaderRows) * heightPlusSpace * cellHeightFactor
                    if self == taskTaggingLayout {yO = y - CGFloat(navBarHeight + statusBarHeight)}
                    else {
                        yO = y
                    }
                    
                    scalar = cellHeightFactor
                }
                
                attribute.frame = CGRect(x: xO, y: yO, width: cellWidth!, height: cellHeight! * scalar)
                setZIndex(row: i, section: j, cellAttributes: attribute)
                attributesForElements.append(attribute)
            }
        }
        
        return attributesForElements
    }
}

