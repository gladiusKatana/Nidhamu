// BaseCell         ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

class BaseCell: UICollectionViewCell {
    
    lazy var titleLabel = UILabel()
    var cellColour = UIColor.clear
    var cellDate = Date()
    var xyCoordinate = [-2, -2]
    //var task = SimpleTask() // may add as a property of a cell; or may simply keep it in a detached data structure (dictionary) as it is now
    
    var dstCompensator = 0.0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = cellDefaultColour
        titleLabel.textColor = cellTextDefaultColour
        titleLabel.font = defaultTimetableCellFont
    }
    
    required init?(coder aDecoder: NSCoder) {fatalError("init(coder:) has not been implemented")}
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        backgroundColor = .clear; cellColour = .clear
        
        layer.borderWidth = 1
        layer.borderColor = UIColor.clear.cgColor
        
        titleLabel.text = "" /// use if title label text is ever set to a non-blank string
        titleLabel.textColor = cellTextDefaultColour
        titleLabel.font = defaultTimetableCellFont
    }
}

