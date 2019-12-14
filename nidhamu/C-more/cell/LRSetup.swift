// LRSetup          ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension CollectionVC {
    
    func leftOrRightCellSetup(_ cell: BaseCell, indexPath: IndexPath, paths: [(Int, Int)])  {
        var weight = UIFont.Weight.ultraLight
        let row = indexPath.row; let col = indexPath.section
        
        cell.backgroundColor = headerColour
        cell.titleLabel.textAlignment = .left
        cell.titleLabel.numberOfLines = 0
        cell.titleLabel.lineBreakMode = .byCharWrapping
        
        let str = dstMarkerForHeader(Date())
        
        if (col, row) == paths[0] {
            cell.titleLabel.text = formattedDateString(lastLoginDate, roundedDown: false, showYear: true,
                                                       prefix: " Last Login", suffix: " ", dateFormat: .fullDay); if str != "" {weight = .light}
        }
        else if (col, row) == paths[1] {
            dstNotificationCellPath = (col, row)
            cell.titleLabel.text = str
            cell.titleLabel.textColor = darkNavy; weight = .medium}
        else {cell.titleLabel.textColor = cellTextDefaultColour; cell.titleLabel.text = ""}
        
        if currentOrientation == "landscape" {
            var size = 0
            if textFieldDisplayed{size = 7} else {size = 9}
            cell.titleLabel.font = UIFont.systemFont(ofSize: CGFloat(size), weight: weight)
        }
        else {cell.titleLabel.font = UIFont.systemFont(ofSize: 9, weight: weight)}
    }
}

