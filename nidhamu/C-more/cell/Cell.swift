// Cell             ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

class CustomCell: BaseCell {
    
    static let reuseIdentifier = "CustomCell"
    static let popupReuseIdentifier = "CustomPopupCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(titleLabel)
        
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .centerX, relatedBy: .equal,
                                         toItem: self, attribute: .centerX, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .centerY, relatedBy: .equal,
                                         toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
    }
    
    required init?(coder aDecoder: NSCoder) {fatalError("init(coder:) has not been implemented")}
}

