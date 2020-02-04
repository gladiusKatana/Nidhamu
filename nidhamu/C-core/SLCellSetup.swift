// SLCellSetup      ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

func singleLineCellSetup(_ cell: BaseCell, indexPath: IndexPath, paths: [(Int, Int)])  {
    
    let row = indexPath.row; let col = indexPath.section
    
    cell.backgroundColor = headerColour
    
    cell.xyCoordinate = [col, row]
    
    cell.titleLabel.numberOfLines = 1
    cell.titleLabel.lineBreakMode = .byCharWrapping
    
    testForCellBannerNotification(cell, row: row, col: col, notificationColour: defaultCellTextColour, notificationText: "")
}

