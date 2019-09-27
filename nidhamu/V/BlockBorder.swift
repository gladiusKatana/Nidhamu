// BlockBorder      ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension CollectionVC {
    
    func addBorderAroundTimeBlockCurrentlyBeingMarked() {
        
        for cell in timetableVC.collectionView.visibleCells {
            
            guard let cell = cell as? BaseCell else {
                print("could not downcast to base cell in cell reference"); return
            }
            
            let column = cell.xyCoordinate[0]; let row = cell.xyCoordinate[1]
            
            if row >= timetableLayout.lockedHeaderRows {
                
                guard let cell = cell as? CustomCell else {
                    print("could not downcast to custom cell in cell reference"); return
                }
                
                if pathsToProcess.count > 0 {
                    
                    earliestEventAddress = pathsToProcess.first!
                    
                    if row == earliestEventAddress[1] && column == earliestEventAddress[0] {
                        cell.layer.borderColor = UIColor.white.cgColor                              //; print("highlighted cell white")
                    }
                    else {cell.layer.borderColor = UIColor.clear.cgColor}
                    
                }
                
                if row != 0 { /// the row in which there is a left-cell
                    checkDateStringMatchAndPrintLabel(nil, date: Date(), cell: cell , withBorder: true) /// re-identifies the now-cell
                }
                
            }
        }
    }
    
}

