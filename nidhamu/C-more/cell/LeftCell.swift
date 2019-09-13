// LeftCell         ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

class LeftAlignedCell: BaseCell {
    
    static let reuseIdentifier = "CustomLeftAlignedCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)                            ///setupViews()
        
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

extension CollectionVC {
    
    func doRestOfLeftCellProcessing(cell: LeftAlignedCell, indexPath: IndexPath) -> LeftAlignedCell  {
        
        cell.backgroundColor = headerColour
        cell.titleLabel.font = UIFont.systemFont(ofSize: 9, weight: .ultraLight)
        cell.titleLabel.textColor = grayFive
        
        cell.titleLabel.textAlignment = .left
        cell.titleLabel.numberOfLines = 0
        cell.titleLabel.lineBreakMode = .byCharWrapping
        
        let (yr, mnthString, dayI, wkday, _, hr, min) = displayDate(lastLoggedInDate, roundedDown: false)
        
        let longWeekday = getFullWeekdayName(shortWeekday: wkday)
        var minTwoDigits = "\(min)"
        if min < 10 {minTwoDigits = "0\(min)"}
        
        if indexPath.section == 0 { // to do this in column 1, you need to rewrite the layout attributes (zIndex)
            cell.titleLabel.text = " Last Login \(longWeekday), \(mnthString) \(dayI), \(yr) @ \(hr):\(minTwoDigits)"
        }
        else {cell.titleLabel.text = ""}
        
        return cell
    }
}

