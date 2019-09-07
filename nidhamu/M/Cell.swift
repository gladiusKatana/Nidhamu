// Cell             ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

class TemplateCell: UICollectionViewCell {
    
    lazy var titleLabel = UILabel()
    var cellColour = UIColor.clear
    var cellDate = Date()
    var xyCoordinate = [-2, -2]
    //var event = SimpleEvent() // may add as a property of a cell; or may simply keep it in a detached data structure (dictionary) as it is now
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = cellDefaultColour
        titleLabel.textColor = cellTextDefaultColour
        titleLabel.font = defaultTimetableCellFont
    }
    
    required init?(coder aDecoder: NSCoder) {fatalError("init(coder:) has not been implemented")}
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        titleLabel.text = "" // use if title label text is ever set to a non-blank string
        titleLabel.font = defaultTimetableCellFont
        
//        backgroundColor = .clear
        layer.borderColor = UIColor.clear.cgColor
    }
}


class CustomCell: TemplateCell {
    
    static let reuseIdentifier = "CustomCell"
    static let popupReuseIdentifier = "CustomPopupCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(titleLabel)
        
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .centerX, relatedBy: .equal,
                                         toItem: self, attribute: .centerX, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .centerY, relatedBy: .equal,
                                         toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
    }
    
    required init?(coder aDecoder: NSCoder) {fatalError("init(coder:) has not been implemented")}
}


class LeftAlignedCell: TemplateCell {
    
    static let reuseIdentifier = "CustomLeftAlignedCell"

    override init(frame: CGRect) {
        super.init(frame: frame)                            ///setupViews()

        titleLabel.numberOfLines = 1
        titleLabel.sizeToFit()
        titleLabel.adjustsFontSizeToFitWidth = true
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(titleLabel)
        
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .left, relatedBy: .equal,
                                         toItem: self, attribute: .left, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .centerY, relatedBy: .equal,
                                         toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
    }

    required init?(coder aDecoder: NSCoder) {fatalError("init(coder:) has not been implemented")}
}
