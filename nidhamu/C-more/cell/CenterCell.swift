// CenterCell       ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

class CenterAlignedCell: BaseCell {
    static let reuseIdentifier = "CustomCenterAlignedCell"
    static let popupReuseIdentifier = "CustomPopupCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addTitleLabelConstraints(titleLabel, attribute: .centerX)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder aDecoder: NSCoder) {fatalError("init(coder:) has not been implemented")}
}

extension CollectionVC {
    
    func doRestOfCenterCellProcessing(cell: CenterAlignedCell, indexPath: IndexPath) -> CenterAlignedCell  {
        
        let customLayout = downcastLayout!
        let row = indexPath.item;                       //let column = indexPath.section;
        let headerRows = customLayout.lockedHeaderRows  //; let headerSections = customLayout.lockedHeaderSections
        var fontSize = 0
        
        cell.backgroundColor = headerColour
        
        if row >= headerRows { /// time-of-day labels
            if timeBlockSize == 1 {
                var ampm = ""
                if row < headerRows + 12 {ampm = "am"}
                else {ampm = "pm"}
                cell.titleLabel.text = "\(amPmHours[row - headerRows])\(ampm)"
            }
            else {cell.titleLabel.text = dayQuarters[row - headerRows]}
            
            if timeBlockSize == 1 && textFieldDisplayed && currentOrientation == "landscape" {fontSize = 7} else {fontSize = 11}
            cell.titleLabel.font = UIFont.systemFont(ofSize: CGFloat(fontSize), weight: .light)
            
        }
        return cell
    }
}

