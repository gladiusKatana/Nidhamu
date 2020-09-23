// CtrCellSetup     ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension CollectionVC {
    
    func centerCellSetup(cell: CenterAlignedCell, indexPath: IndexPath) -> CenterAlignedCell  {
        
        let customLayout = downcastLayout!
        let row = indexPath.item;                       //; let column = indexPath.section
        let headerRows = customLayout.lockedHeaderRows  //; let headerSections = customLayout.lockedHeaderSections
        var fontSize = 0
        
        cell.backgroundColor = headerColour; cell.cellColour = headerColour
        
        if row >= headerRows { /// time-of-day labels
            
            if timeBlockSize == 1 {
                var ampm = ""
                if row < headerRows + 12 {ampm = "am"}
                else {ampm = "pm"}
                cell.titleLabel.text = "\(amPmHours[row - headerRows])\(ampm)"
            }
            else {cell.titleLabel.text = dayQuarters[row - headerRows]}
            
//            if timeBlockSize == 1 && textFieldDisplayed && currentOrientation == "landscape" {
//                fontSize = 7
//            } else {
                fontSize = 12
//            }
            
            cell.titleLabel.font = UIFont.systemFont(ofSize: CGFloat(fontSize), weight: .regular)
            
        }
        
        ///testForCellBannerNotification(cell, row: row, col: column, notificationColour: nil, notificationText: nil)
        
        return cell
    }
}

