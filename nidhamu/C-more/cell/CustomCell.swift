// CustomCell       ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

/// may rename to MultiLineCell, as the cell's title label has a variable number of lines, set after the cell dimensions are (re)calulated in CustomFlowLayout.calculateAndResetSizes()

class CustomCell: BaseCell {
    
    static let reuseIdentifier = "CustomCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(titleLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {fatalError("init(coder:) has not been implemented")}
}


extension CollectionVC {
    
    func resetTitleLabel(cell: BaseCell, row: Int, col: Int, layout: CustomFlowLayout) {              //print("resetting title label")
        
        if let safeCell = cell as? CustomCell {
            
            if self.downcastLayout!.embeddedInNavController {
                safeCell.titleLabel.numberOfLines = 0
                safeCell.titleLabel.lineBreakMode = .byWordWrapping
                
                if let currentWidth = currentCellWidth, let currentHeight = currentCellHeight {
                    safeCell.titleLabel.frame.size.width = currentWidth
                    safeCell.titleLabel.frame.size.height = currentHeight ///print("just sized title label width to \(currentWidth), height to \(currentHeight)")
                }
                
                safeCell.titleLabel.sizeToFit()
            }
            
        } else {
            print("unsuccessful downcast @ (\(row),\(col))")
            cell.titleLabel.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
}

