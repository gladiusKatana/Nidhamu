// LeftCell         ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension CollectionVC {
    
    func doRestOfLeftCellProcessing(cell: LeftAlignedCell, indexPath: IndexPath) -> LeftAlignedCell  {
        
        cell.backgroundColor = headerColour
        cell.titleLabel.font = UIFont.systemFont(ofSize: 9, weight: .ultraLight)
        cell.titleLabel.textColor = grayTwo
        
        cell.titleLabel.textAlignment = .left
        cell.titleLabel.numberOfLines = 0
        cell.titleLabel.lineBreakMode = .byCharWrapping
        
        let (yr, mnthString, dayI, wkday, _, hr, min) = displayDate(lastLoggedInDate, roundedDown: false)
        
        let longWeekday = getFullWeekdayName(shortWeekday: wkday)
        var minTwoDigits = "\(min)"
        if min < 10 {minTwoDigits = "0\(min)"}
        
        if indexPath.section == 0 { // to do this in column 1, you need to rewrite the layout attributes (zIndex)
            cell.titleLabel.text = " Last login \(longWeekday), \(mnthString) \(dayI), \(yr) @ \(hr):\(minTwoDigits)"
        }
        else {cell.titleLabel.text = ""}
        
        return cell
    }

}

