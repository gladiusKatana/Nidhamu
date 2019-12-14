// RightCell        ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension CollectionVC {
    
    func registerAndReturnRightCell(_ collectionView: UICollectionView, at indexPath: IndexPath) -> RightAlignedCell {
        collectionView.register(RightAlignedCell.self, forCellWithReuseIdentifier: RightAlignedCell.reuseIdentifier)
        
        var rightCell = collectionView.dequeueReusableCell(withReuseIdentifier:
            RightAlignedCell.reuseIdentifier, for: indexPath) as! RightAlignedCell
        
        rightCell = doRestOfRightCellProcessing(cell: rightCell, indexPath: indexPath)
        return rightCell
    }
    
    func doRestOfRightCellProcessing(cell: RightAlignedCell, indexPath: IndexPath) -> RightAlignedCell  {
        
        leftOrRightCellSetup(cell, indexPath: indexPath, paths: [(7,0), (7,1)])
        
        return cell
    }
}

class RightAlignedCell: BaseCell {
    
    static let reuseIdentifier = "CustomRightAlignedCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        titleLabel.numberOfLines = 1
        titleLabel.sizeToFit()
        titleLabel.adjustsFontSizeToFitWidth = true
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(titleLabel)
        
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .right, relatedBy: .equal,
                                         toItem: self, attribute: .right, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .centerY, relatedBy: .equal,
                                         toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
    }
    required init?(coder aDecoder: NSCoder) {fatalError("init(coder:) has not been implemented")}
}

