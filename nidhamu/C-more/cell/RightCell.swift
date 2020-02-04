// RightCell        ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

class RightAlignedCell: BaseCell {
    
    static let reuseIdentifier = "CustomRightAlignedCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addTitleLabelConstraints(titleLabel, attribute: .right)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder aDecoder: NSCoder) {fatalError("init(coder:) has not been implemented")}
}

extension CollectionVC {
    
    func doRestOfRightCellProcessing(cell: RightAlignedCell, indexPath: IndexPath) -> RightAlignedCell  {
        
        let paths = [(7,0), (7,1)]
        
        singleLineCellSetup(cell, indexPath: indexPath, paths: paths)
        
        return cell
    }
}

