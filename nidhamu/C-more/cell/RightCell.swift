// RightCell        ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension CollectionVC {
    
    func registerAndReturnRightCell(_ collectionView: UICollectionView, at indexPath: IndexPath) -> RightAlignedCell {
        collectionView.register(RightAlignedCell.self, forCellWithReuseIdentifier: RightAlignedCell.reuseIdentifier)
        var rightCell = collectionView.dequeueReusableCell(withReuseIdentifier: RightAlignedCell.reuseIdentifier, for: indexPath) as! RightAlignedCell
        rightCell = doRestOfRightCellProcessing(cell: rightCell, indexPath: indexPath)
        return rightCell
    }
    
    func doRestOfRightCellProcessing(cell: RightAlignedCell, indexPath: IndexPath) -> RightAlignedCell  {
        var weight = UIFont.Weight.ultraLight
        let row = indexPath.row; let col = indexPath.section
        
        cell.backgroundColor = headerColour
        cell.titleLabel.textAlignment = .left
        cell.titleLabel.numberOfLines = 0
        cell.titleLabel.lineBreakMode = .byCharWrapping
        
        let str = dstMarkerForHeader(Date())
        
        if (col, row) == (7, 0) {
            cell.titleLabel.text = formattedDateString(lastLoginDate, roundedDown: false, showYear: true,
                                                       prefix: " Last Login", suffix: " ", dateFormat: .fullDay); if str != "" {weight = .light}
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
    //        cell.backgroundColor = headerColour
    //        cell.titleLabel.font = UIFont.systemFont(ofSize: 9, weight: .ultraLight)
    //
    //        if currentOrientation == "landscape" {cell.titleLabel.font = UIFont.systemFont(ofSize: CGFloat(7), weight: .ultraLight)}
    //
    //        cell.titleLabel.textAlignment = .right
    //        cell.titleLabel.numberOfLines = 0
    //        cell.titleLabel.lineBreakMode = .byCharWrapping
    //
    //        let str = dstMarkerForHeader(Date())
    //
    //        if indexPath.section == 7 { // to do this in column 1, you need to rewrite the layout attributes (zIndex)
    //            cell.titleLabel.text = formattedDateString(lastLoginDate, roundedDown: false, showYear: true,
    //                                                       prefix: " Last Login", suffix: str, dateFormat: .fullDay)
    //        }
    //        else {cell.titleLabel.text = ""}
    //        return cell
    //    }
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

