// VCCellPath       ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension CollectionVC {
    
    override func collectionView(_ collectionView: UICollectionView,
                                 cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCell.reuseIdentifier, for: indexPath) as! CustomCell
        let customLayout = downcastLayout!
        let row = indexPath.item;   let column = indexPath.section;   cell.xyCoordinate = [column, row]
        
        if row < customLayout.lockedHeaderRows && row != 1 // row 1 is not a normal header here: it contains dates, thus is handled in the else{}
            || column < customLayout.lockedHeaderSections {
            
            setDefaultColours(cell: cell, cellIsInHeader: true)
            
            setTimeAndDayLabels(cell: cell, column: column, row: row, layout: customLayout)
        
        } else {
            
            setDefaultColours(cell: cell, cellIsInHeader: false)
            
            timeBlockDateSetup(cell: cell, column: column, row: row, layout: customLayout)
            
            if row == customLayout.rows - 1 && column == customLayout.cols - 1 {              //; print("events to process: \(events ToProcess)")//*
                if eventArraysToProcess.count > 0 { // or could have used pathsToProcess.count > 0
                    
                    if !savedTimeBlocksForProcessing {
                        eventsInBlockToBeProcessed = eventArraysToProcess.first!.count
                        //print("\neventsInBlock first set to \(eventsInBlockToBeProcessed)")
                    }
                    
                    ///print("block events remaining (initial): \(eventsInBlockToBeProcessed)\n"); print("paths to process: \(pathsToProcess)")
                    
                    processEventsSinceLastLogin(layout: customLayout)
                    savedTimeBlocksForProcessing = true
                    
//                    if classifierViewDisplayed {
//                    print("classifier displayed")
//                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
//                            classifierVC.collectionView.reloadData()
//                        }
//                    }
//                    else {print("um, it ain't displayed")}
                    
                }
            }
        }
        return cell
    }
}

