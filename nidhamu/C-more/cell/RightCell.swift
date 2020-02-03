// RightCell        ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

class RightAlignedCell: BaseCell {
    
    static let reuseIdentifier = "CustomRightAlignedCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addTitleLabelConstraints(titleLabel, attribute: .right)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder aDecoder: NSCoder) {fatalError("init(coder:) has not been implemented")}
}

extension CollectionVC {
    
    func registerRightCell(_ collectionView: UICollectionView, at indexPath: IndexPath) -> RightAlignedCell {
        collectionView.register(RightAlignedCell.self, forCellWithReuseIdentifier: RightAlignedCell.reuseIdentifier)
        
        var rightCell = collectionView.dequeueReusableCell(withReuseIdentifier:
            RightAlignedCell.reuseIdentifier, for: indexPath) as! RightAlignedCell
        
        rightCell = doRestOfRightCellProcessing(cell: rightCell, indexPath: indexPath)
        return rightCell
    }
    
    func doRestOfRightCellProcessing(cell: RightAlignedCell, indexPath: IndexPath) -> RightAlignedCell  {
        
        let paths = [(7,0), (7,1)]
        
        singleLineCellSetup(cell, indexPath: indexPath, paths: paths)
        
        return cell
    }
}

func singleLineCellSetup(_ cell: BaseCell, indexPath: IndexPath, paths: [(Int, Int)])  {
    
    var weight = UIFont.Weight.ultraLight
    
    let row = indexPath.row     ;   let col = indexPath.section
    
    cell.backgroundColor = headerColour
    cell.xyCoordinate = [col, row]
    
    cell.titleLabel.numberOfLines = 1
    cell.titleLabel.lineBreakMode = .byCharWrapping
    
    let str = dstMarkerForHeader(Date())
    
    if str != "" && row > 0 && col > 0 {cell.backgroundColor = subtleBlue} /// highlights the daylight savings notification the same colour as the now-cell
    
    if (col, row) == paths[0] {
        cell.titleLabel.text = formattedDateString(lastLoginDate, roundedDown: false, showYear: true,
                                                   prefix: " Last Login", suffix: " ", dateFormat: .fullDay); if str != "" {weight = .light}
    } else if (col, row) == paths[1] {
        dstNotificationCellPath = (col, row)
        cell.titleLabel.text = str
        cell.titleLabel.textColor = darkNavy; weight = .medium
    }
        
    else {cell.titleLabel.textColor = defaultCellTextColour; cell.titleLabel.text = ""}
    
    
    if currentOrientation == "landscape" {
        var size = 0
        if textFieldDisplayed{size = 7} else {size = 9}
        cell.titleLabel.font = UIFont.systemFont(ofSize: CGFloat(size), weight: weight)
    }
        
    else {cell.titleLabel.font = UIFont.systemFont(ofSize: 9, weight: weight)}
}

