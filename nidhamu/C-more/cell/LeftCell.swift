// LeftCell         ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension CollectionVC {
    
    func registerAndReturnLeftCell(_ collectionView: UICollectionView, at indexPath: IndexPath) -> LeftAlignedCell {
        collectionView.register(LeftAlignedCell.self, forCellWithReuseIdentifier: LeftAlignedCell.reuseIdentifier)
        var leftCell = collectionView.dequeueReusableCell(withReuseIdentifier: LeftAlignedCell.reuseIdentifier, for: indexPath) as! LeftAlignedCell
        leftCell = doRestOfLeftCellProcessing(cell: leftCell, indexPath: indexPath)
        return leftCell
    }
    
    func doRestOfLeftCellProcessing(cell: LeftAlignedCell, indexPath: IndexPath) -> LeftAlignedCell  {
        var weight = UIFont.Weight.ultraLight
        let row = indexPath.row; let col = indexPath.section
        
        cell.backgroundColor = headerColour
        cell.titleLabel.textAlignment = .left
        cell.titleLabel.numberOfLines = 0
        cell.titleLabel.lineBreakMode = .byCharWrapping
        
        let str = dstMarkerForHeader(Date())
        
        if (col, row) == (0, 0) {
            cell.titleLabel.text = formattedDateString(lastLoginDate, roundedDown: false, showYear: true,
                                                       prefix: " Last Login", suffix: "", dateFormat: .fullDay); if str != "" {weight = .light}
        }
        else if (col, row) == dstNotificationCellPath {
            cell.titleLabel.text = str
            cell.titleLabel.textColor = darkNavy; weight = .medium}
        else {cell.titleLabel.textColor = cellTextDefaultColour; cell.titleLabel.text = ""}
        
        if currentOrientation == "landscape" {
            var size = 0
            if textFieldDisplayed{size = 7} else {size = 9}
            cell.titleLabel.font = UIFont.systemFont(ofSize: CGFloat(size), weight: weight)
        }
        else {cell.titleLabel.font = UIFont.systemFont(ofSize: 9, weight: weight)}
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

