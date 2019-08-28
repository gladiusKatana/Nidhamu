// CellPath         ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension CollectionVC {
    
    override func collectionView(_ collectionView: UICollectionView,
                                 cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCell.reuseIdentifier, for: indexPath) as! CustomCell
        let customLayout = downcastLayout!
        let row = indexPath.item;   let column = indexPath.section;   cell.xyCoordinate = [column, row]
        
        if row < customLayout.lockedHeaderRows
            && !((1 ..< customLayout.lockedHeaderRows).contains(row))                   // rows 1-3 contain dates, thus are handled in the else{}
            || column < customLayout.lockedHeaderSections {
            
            setDefaultColours(cell: cell, layout: customLayout, cellIsInHeader: true)
            setTimeAndDayLabels(cell: cell, column: column, row: row, layout: customLayout)
            
        } else {
            
            setDefaultColours(cell: cell, layout: customLayout, cellIsInHeader: false)
            timeBlockDateSetup(cell: cell, column: column, row: row, layout: customLayout)
            
            if row == customLayout.rows - 1 && column == customLayout.cols - 1 {        //; print("events to process: \(events ToProcess)")//*
                
                if eventArraysToProcess.count > 0 {                                     //* or, could have used pathsToProcess.count > 0
                    
                    if !savedTimeBlocksForProcessing {
                        eventsInBlockToBeProcessed = eventArraysToProcess.first!.count  //; print("\n*eventsInBlock \(eventsInBlockToBeProcessed)")
                        savedTimeBlocksForProcessing = true
                    }
                    
                    //print("events left (initial): \(eventsInBlockToBeProcessed)\n")   ; print("paths to process: \(pathsToProcess)")
                    
                    tagEventsSinceLastLogin(layout: customLayout)
                }
            }
        }
        
        return cell
    }
}

