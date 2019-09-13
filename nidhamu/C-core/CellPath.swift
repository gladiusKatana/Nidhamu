// CellPath         ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension CollectionVC {
    
    override func collectionView(_ collectionView: UICollectionView,
                                 cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if vcType == .hours {
            if indexPath.row == 3 {
                collectionView.register(LeftAlignedCell.self, forCellWithReuseIdentifier: LeftAlignedCell.reuseIdentifier)
                var cell1 = collectionView.dequeueReusableCell(withReuseIdentifier: LeftAlignedCell.reuseIdentifier, for: indexPath) as! LeftAlignedCell
                cell1 = doRestOfLeftCellProcessing(cell: cell1, indexPath: indexPath)
                return cell1
            }
            else {
                collectionView.register(CustomCell.self, forCellWithReuseIdentifier: CustomCell.reuseIdentifier)
                var cell2 = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCell.reuseIdentifier, for: indexPath) as! CustomCell
                cell2 = doRestOfCellProcessing(cell: cell2, indexPath: indexPath)
                return cell2
            }
        }
        else {
            collectionView.register(CustomCell.self, forCellWithReuseIdentifier: CustomCell.reuseIdentifier)
            var cell2 = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCell.reuseIdentifier, for: indexPath) as! CustomCell
            cell2 = doRestOfCellProcessing(cell: cell2, indexPath: indexPath)
            return cell2
        }
        
    }
    
    func doRestOfCellProcessing(cell: CustomCell, indexPath: IndexPath) -> CustomCell {
        let customLayout = downcastLayout!
        let row = indexPath.item;                       let column = indexPath.section;
        let headerRows = customLayout.lockedHeaderRows; let headerSections = customLayout.lockedHeaderSections
        cell.xyCoordinate = [column, row]
        
        if column < headerSections {
            cell.backgroundColor = headerColour
            
            if row > headerRows - 1 {                   // time-of-day labels
                var ampm = ""
                if row < headerRows + 12 {ampm = "am"}
                else {ampm = "pm"}
                cell.titleLabel.text = "\(amPmHours[row - headerRows])\(ampm)"
            }
        } else {
            if row < headerRows {
                cell.backgroundColor = headerColour
                if row == 0  {cell.titleLabel.text = weekdaysAbbreviated[column - 1]}
                if (1 ... headerRows - 1).contains(row) {
                    timeBlockDateSetup(cell: cell, column: column, row: row, layout: customLayout)
                }
            } else {
                cell.backgroundColor = cellDefaultColour;  cell.cellColour = cellDefaultColour
                timeBlockDateSetup(cell: cell, column: column, row: row, layout: customLayout)
                
                if row == customLayout.rows - 1 && column == customLayout.cols - 1 {processTimeBlocksSinceLastLogin(layout: customLayout)}
            }
        }
        return cell
    }
}

