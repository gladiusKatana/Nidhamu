// CustomCell       ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit /// may rename to MultiLineCell, as the cell's title label has a variable number of lines, set after the cell dimensions are (re)calulated in CustomFlowLayout.calculateAndResetSizes()

class CustomCell: BaseCell {
    
    static let reuseIdentifier = "CustomCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(titleLabel)
        
        //        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .centerX, relatedBy: .equal,
        //                                         toItem: self, attribute: .centerX, multiplier: 1, constant: 0))
        //        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .centerY, relatedBy: .equal,
        //                                         toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
    }
    
    required init?(coder aDecoder: NSCoder) {fatalError("init(coder:) has not been implemented")}
}

