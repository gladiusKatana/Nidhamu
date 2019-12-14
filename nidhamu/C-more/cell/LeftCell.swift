// LeftCell         ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension CollectionVC {
    
    func registerAndReturnLeftCell(_ collectionView: UICollectionView, at indexPath: IndexPath) -> LeftAlignedCell {
        collectionView.register(LeftAlignedCell.self, forCellWithReuseIdentifier: LeftAlignedCell.reuseIdentifier)
        
        var leftCell = collectionView.dequeueReusableCell(withReuseIdentifier:
            LeftAlignedCell.reuseIdentifier, for: indexPath) as! LeftAlignedCell
        
        leftCell = doRestOfLeftCellProcessing(cell: leftCell, indexPath: indexPath)
        return leftCell
    }
    
    func doRestOfLeftCellProcessing(cell: LeftAlignedCell, indexPath: IndexPath) -> LeftAlignedCell  {
        
        leftOrRightCellSetup(cell, indexPath: indexPath, paths: [(0,0), (0,1)])
        
        return cell
    }
}

class LeftAlignedCell: BaseCell {
    
    static let reuseIdentifier = "CustomLeftAlignedCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
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

