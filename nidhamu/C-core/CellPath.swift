// CellPath         ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension CollectionVC {
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let row = indexPath.row; let col = indexPath.section
        let layout = downcastLayout!
        
        if viewControllerType == .timetable {
            
            if (col,row) == (7,0) { //or:  if (0...1).contains(row) && col == layout.cols - 1 {
                return registerRightCell(collectionView, at: indexPath)
            } else {
                if col < layout.lockedHeaderSections {return registerCenterCell(collectionView, at: indexPath)}
                else {
                    return registerCell(collectionView, at: indexPath)
                }
            }
        } else {return registerCell(collectionView, at: indexPath)}
    }
    
    func multilineCellProcessing(cell: CustomCell, indexPath: IndexPath) -> CustomCell {
        
        let customLayout = downcastLayout!
        let row = indexPath.item;                       let column = indexPath.section;
        let headerRows = customLayout.lockedHeaderRows; let headerSections = customLayout.lockedHeaderSections
        var fontSize = 0
        
        cell.xyCoordinate = [column, row]
        
        if viewControllerType == .timetable || viewControllerType == .deferralDates {
            if currentOrientation == "landscape" {
                if textFieldDisplayed{fontSize = 7} else {fontSize = 9}
                cell.titleLabel.font = UIFont.systemFont(ofSize: CGFloat(fontSize), weight: .ultraLight)
            }
        }
        
        if column < headerSections {
            cell.backgroundColor = headerColour
        }
        else {
            if row < headerRows {
                cell.backgroundColor = headerColour
                if row == 4 && viewControllerType == .timetable
                    || row == 4  && viewControllerType == .deferralDates {
                    cell.titleLabel.text = headerWeekdayTitles[column - 1]
                    
                    if textFieldDisplayed && currentOrientation == "landscape" {fontSize = 7} else {fontSize = 12}
                    cell.titleLabel.font = UIFont.systemFont(ofSize: CGFloat(fontSize), weight: .light)
                }
            }
            
            if row >= (headerRows - 3) { /// since cell dates are set in the 3 rows above the cell representing 12am (the first non-header cell)
                timeBlockDateSetup(cell: cell, column: column, row: row, layout: customLayout)
                
                if row == customLayout.rows - 1 && column == customLayout.cols - 1 {          /// so it's called on the FINAL cell dequeued
                    processTimeBlocksSinceLastLogin(layout: customLayout)
                }
            }
        }
        
        resetTitleLabel(cell: cell, row: row, col: column, layout: customLayout)
        
        if viewControllerType == .archive {cell.backgroundColor = defaultColour}
        
        return cell
    }
    
    func resetTitleLabel(cell: BaseCell, row: Int, col: Int, layout: CustomFlowLayout) {              //print("resetting title label")
        if let safeCell = cell as? CustomCell {
            
            if self.downcastLayout!.embeddedInNavController {
                safeCell.titleLabel.numberOfLines = 0
                safeCell.titleLabel.lineBreakMode = .byWordWrapping
                
                if let currentWidth = currentCellWidth, let currentHeight = currentCellHeight {
                    safeCell.titleLabel.frame.size.width = currentWidth
                    safeCell.titleLabel.frame.size.height = currentHeight   ///print("just sized title label width to \(currentWidth), height to \(currentHeight)")
                }
                
                safeCell.titleLabel.sizeToFit()
            }
            
        } else {
            print("unsuccessful downcast @ (\(row),\(col))")
            cell.titleLabel.translatesAutoresizingMaskIntoConstraints = false
        }
    }
}

///For cell title label text truncation
/*if row == 5 && column == 1 {
 if viewControllerType == .hours {findAverageLetterWidthWithCellLabelFont(cell: cell)} /// done here so it's only called once, but can access a cell
 }*/


//        for cell in timetableVC.collectionView.visibleCells {
//
//            guard let cell = cell as? BaseCell else {
//                print("could not downcast to base cell in cell reference")
//                return
//            }
//
//            let col = cell.xyCoordinate[0]
//            let row = cell.xyCoordinate[1]
//            resetTitleLabel(cell: cell, row: row, col: col)
//        }

