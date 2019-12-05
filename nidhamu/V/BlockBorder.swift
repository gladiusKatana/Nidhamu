// BlockBorder      ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension CollectionVC {
    
    
    func addBorderAroundTimeBlockCurrentlyBeingMarked() {
        
        for cell in timetableVC.collectionView.visibleCells {
            
            guard let cell = cell as? BaseCell else {
                print("could not downcast to base cell in cell reference")
                return
            }
            
            let row = cell.xyCoordinate[1]; let column = cell.xyCoordinate[0]
            
            if row >= timetableLayout.lockedHeaderRows && column >= timetableLayout.lockedHeaderSections {
                
                guard let cell = cell as? CustomCell else {
                    print("could not downcast to custom cell in cell reference")
                    return
                }
                
                if indexPathsToProcess.count > 0 {
                    earliestTaskAddress = indexPathsToProcess.first!
                }
                
                timetableVC.showKeyTimeBlockDates(cell: cell, layout: downcastLayout!)
            }
            
        }
    }
    
}

