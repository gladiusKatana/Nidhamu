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

