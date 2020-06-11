// LeftCell         ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

class LeftAlignedCell: BaseCell {
    
    static let reuseIdentifier = "CustomLeftAlignedCell"
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addTitleLabelConstraints(titleLabel, attribute: .left)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder aDecoder: NSCoder) {fatalError("init(coder:) has not been implemented")}
}

