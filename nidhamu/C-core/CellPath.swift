// CellPath         ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension CollectionVC {
    
    override func collectionView(_ collectionView: UICollectionView,
                                 cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCell.reuseIdentifier, for: indexPath) as! CustomCell
        let customLayout = downcastLayout!;
        let row = indexPath.item;                       let column = indexPath.section;                         cell.xyCoordinate = [column, row]
        let headerRows = customLayout.lockedHeaderRows; let headerSections = customLayout.lockedHeaderSections
        
        if column < headerSections {
            cell.backgroundColor = headerColour
            
            if row > headerRows - 1 {                   // time-of-day labels
                var ampm = ""
                if row < headerRows + 12 {ampm = "am"}
                else {ampm = "pm"}
                cell.titleLabel.text = "\(hoursOfTheDay[row - headerRows])\(ampm)"
            }
        }
        else {
            if row < headerRows {
                cell.backgroundColor = headerColour
                if row == 0  {cell.titleLabel.text = weekdaysAbbreviated[column - 1]}
                if (1 ... headerRows - 1).contains(row) {
                    timeBlockDateSetup(cell: cell, column: column, row: row, layout: customLayout)
                }
            } else {
                cell.backgroundColor = cellDefaultColour;  cell.cellColour = cellDefaultColour
                timeBlockDateSetup(cell: cell, column: column, row: row, layout: customLayout)
                
                if row == customLayout.rows - 1 && column == customLayout.cols - 1 {      //; print("events to process: \(events ToProcess)")//*
                    
                    if eventArraysToProcess.count > 0 { //* or, could have used paths ToProcess.count > 0
                        
                        if !savedTimeBlocksForProcessing {
                            eventsInBlockToBeProcessed = eventArraysToProcess.first!.count//; print("\n*eventsInBlock \(eventsInBlockToBeProcessed)")
                            savedTimeBlocksForProcessing = true
                        }
                        
                        //print("events left (initial): \(eventsInBlockToBeProcessed)\n")   ; print("paths to process: \(pathsToProcess)")
                        
                        sortedPathsToProcess = pathsToProcess.sorted(by: {lastEventFromPath($0).eventDate < lastEventFromPath($1).eventDate})
                        //print("sorted paths: \(sortedPathsToProcess)")
                        
                        pathsToProcess = sortedPathsToProcess
                        
                        let sortedEventArraysToProcess = eventArraysToProcess.sorted(by: {$0.last!.eventDate < $1.last!.eventDate})
                        var sortedDescriptions = [String]()
                        for eventsses in sortedEventArraysToProcess {sortedDescriptions.append(eventsses.last!.eventDescription)}
                        //print("sorted arrays: \(sortedDescriptions)")
                        
                        eventArraysToProcess = sortedEventArraysToProcess
                        
                        tagEventsSinceLastLogin(layout: customLayout)
                    }
                    else {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                            AppUtility.lockOrientation(.all)
                        }
                    }
                }
            }
        }
        return cell
    }
}

