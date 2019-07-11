//  VCCellPath.swift
//  nidhamu  ∙  1st commit July. 08, 2019  ∙  Created by Garth Snyder, aka gladiusKatana ⚔️
import UIKit

extension CollectionVC {
    
    override func collectionView(_ collectionView: UICollectionView,
                                 cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCell.reuseIdentifier, for: indexPath) as! CustomCell
        let customLayout = downcastLayout!
        let row = indexPath.item; let column = indexPath.section
        cell.xyCoordinate = [column, row]
        
        if row < customLayout.lockedHeaderRows || column < customLayout.lockedHeaderSections {
            setCellColours(cell: cell, cellIsInHeader: true)
            setTimeAndDayLabels(cell: cell, column: column, row: row, layout: customLayout)
        }
        else {
            setCellColours(cell: cell, cellIsInHeader: false)
            setCellContents(cell: cell, row: row, column: column, layout: customLayout)
            
            if row == customLayout.rows - 1 && column == customLayout.cols - 1 {              //; print("events to process: \(events ToProcess)")//*
                if eventArraysToProcess.count > 0 { // or could have used pathsToProcess.count > 0
                    
                    if !savedTimeBlocksForProcessing {
                        //self.downcastLayout?.autoFitHScale = 0.85
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                            classifierVC.collectionView.reloadData()
                            //self.reloadCV()
                        }
                    }
                    
                    savedTimeBlocksForProcessing = true
                    eventsInBlockToBeProcessed = eventArraysToProcess.first!.count          //; print("\neventsInBlock first set")// initial value
                    //print("block events remaining (initial): \(eventsInBlockToBeProcessed)\n"); print("paths to process: \(pathsToProcess)")
                    processEventsSinceLastLogin(layout: customLayout)
                }
            }
        }
        return cell
    }
}

