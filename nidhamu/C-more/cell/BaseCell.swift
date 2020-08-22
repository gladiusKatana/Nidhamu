// BaseCell         ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

class BaseCell: UICollectionViewCell {
    
    var titleLabel = UILabel()
    var cellColour = UIColor.clear
    var cellDate = Date()
    var xyCoordinate = [-2, -2]
    //var task = SimpleTask() // may add as a property of a cell; or may simply keep it in a detached data structure (dictionary) as it is now
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = cellDefaultColour
        
        layer.borderWidth = 1
        layer.cornerRadius = 8
        layer.borderColor = UIColor.clear.cgColor
        
        titleLabel.textColor = defaultCellTextColour
        titleLabel.font = defaultTimetableCellFont
    }
    
    required init?(coder aDecoder: NSCoder) {fatalError("init(coder:) has not been implemented")}
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        layer.borderColor = UIColor.clear.cgColor
        
        titleLabel.text = "" /// use if title label text is ever set to a non-blank string
        
        titleLabel.textColor = defaultCellTextColour
        titleLabel.font = defaultTimetableCellFont
        
        self.backgroundColor = .black
    }
    
    func addTitleLabelConstraints(_ titleLabel: UILabel, attribute: NSLayoutConstraint.Attribute) {
        
        self.addSubview(titleLabel)
        
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: attribute, relatedBy: .equal,
                                         toItem: self, attribute: attribute, multiplier: 1, constant: 0))
        
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .centerY, relatedBy: .equal,
                                         toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
    }
}

