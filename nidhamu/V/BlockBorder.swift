// BlockBorder      ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension CollectionVC {
    
    func addBorderAroundTimeBlockCurrentlyBeingMarked() {
        
        for cell in timetableVC.collectionView.visibleCells {
            
            guard let customCell = cell as? BaseCell else {
                print("could not downcast to custom cell in cell reference"); return
            }
            
            let column = customCell.xyCoordinate[0]; let row = customCell.xyCoordinate[1]
            
            if pathsToProcess.count > 0 {
                
                earliestEventAddress = pathsToProcess.first!
                
                if row == earliestEventAddress[1] && column == earliestEventAddress[0] {
                    cell.layer.borderColor = UIColor.white.cgColor                              //; print("highlighted cell white")
                } else {cell.layer.borderColor = UIColor.clear.cgColor}
                
            } else {cell.layer.borderColor = UIColor.clear.cgColor}
        }
    }
    
}

