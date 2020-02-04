// SLCellSetup      ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

//extension CollectionVC {
func testForCellBannerNotification(_ cell: BaseCell, row: Int, col: Int, notificationColour: UIColor?, notificationText: String?) {
    
    var weight = UIFont.Weight.ultraLight
    
    let str = dateHeaderNotification(Date())
    
    if str != "" && (0...1).contains(row) && col > 0 {cell.backgroundColor = subtleBlue} /// highlights the daylight savings notification the same colour as the now-cell
    
    if (col, row) == (7,0) {
        cell.titleLabel.text = formattedDateString(lastLoginDate, roundedDown: false, showYear: true,
                                                   prefix: " Last Login", suffix: " ", dateFormat: .fullDay); if str != "" {weight = .light}
    } else if (col, row) == (7,1) {
        dstNotificationCellPath = (col, row)
        cell.titleLabel.text = str
        cell.titleLabel.textColor = darkNavy; weight = .medium
    }
        
    else {
        if notificationColour != nil && notificationText != nil {
            cell.titleLabel.textColor = notificationColour; cell.titleLabel.text = notificationText
        }
    }
    
    if currentOrientation == "landscape" {
        var size = 0
        if textFieldDisplayed{size = 7} else {size = 9}
        cell.titleLabel.font = UIFont.systemFont(ofSize: CGFloat(size), weight: weight)
    }
        
    else {cell.titleLabel.font = UIFont.systemFont(ofSize: 9, weight: weight)}
}


func singleLineCellSetup(_ cell: BaseCell, indexPath: IndexPath, paths: [(Int, Int)])  {
    
    let row = indexPath.row; let col = indexPath.section
    
    cell.backgroundColor = headerColour
    
    cell.xyCoordinate = [col, row]
    
    cell.titleLabel.numberOfLines = 1
    cell.titleLabel.lineBreakMode = .byCharWrapping
    
    testForCellBannerNotification(cell, row: row, col: col, notificationColour: defaultCellTextColour, notificationText: "")
}
//}
