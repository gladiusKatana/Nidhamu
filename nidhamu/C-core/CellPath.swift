// CellPath         ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension CollectionVC {
    
    override func collectionView(_ collectionView: UICollectionView,
                                 cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
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
                cell.titleLabel.text = "\(hoursOfTheDay[row - headerRows])\(ampm)"
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
                
                if row == customLayout.rows - 1 && column == customLayout.cols - 1 {      //; print("events to process: \(events ToProcess)")//*
                    
                    if vcType == .hours {
                        if eventArraysToProcess.count > 0 { //* or, could have used paths ToProcess.count > 0
                            
                            if !savedTimeBlocksForProcessing {
                                eventsInBlockToBeProcessed = eventArraysToProcess.first!.count
                                //; print("\n*eventsInBlock \(eventsInBlockToBeProcessed)")
                                //print("events left (initial): \(eventsInBlockToBeProcessed)\n"); print("paths to process: \(pathsToProcess)")
                                
                                sortedPathsToProcess = pathsToProcess.sorted(by: {lastEventFromPath($0).eventDate < lastEventFromPath($1).eventDate})
                                pathsToProcess = sortedPathsToProcess                             //; print("sorted paths: \(sortedPathsToProcess)")
                                
                                let sortedEventArraysToProcess = eventArraysToProcess.sorted(by: {$0.last!.eventDate < $1.last!.eventDate})
                                var sortedDescriptions = [String]()                               //; print("sorted arrays: \(sortedDescriptions)")
                                for eventsses in sortedEventArraysToProcess {sortedDescriptions.append(eventsses.last!.eventDescription)}
                                eventArraysToProcess = sortedEventArraysToProcess
                                
                                self.tagEventsSinceLastLogin(layout: customLayout)
                                
                                //if !savedTimeBlocksForProcessing {
                                if thereWillBeARowException {
                                    self.downcastLayout?.autoFitHScale = CGFloat(customLayout.rows) / CGFloat(customLayout.rows + 9) /*+ 0.01*/
                                    //reloadCV()
                                    self.reloadWithDelay(after: 0)     //; print("reloaded for size adjustment")
                                }
                                //}
                                
                                savedTimeBlocksForProcessing = true
                            }
                        } else {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                AppUtility.lockOrientation(.all)
                            }
                        }
                    }
                }
            }
        }
        return cell
    }
    
    func doRestOfLeftCellProcessing(cell: LeftAlignedCell, indexPath: IndexPath) -> LeftAlignedCell  {
        
        cell.backgroundColor = headerColour
        cell.titleLabel.font = UIFont.systemFont(ofSize: 9, weight: .ultraLight)
        cell.titleLabel.textColor = grayTwo
        
        cell.titleLabel.textAlignment = .left
        cell.titleLabel.numberOfLines = 0
        cell.titleLabel.lineBreakMode = .byCharWrapping
        
        let (yr, mnthString, dayI, wkday, _, hr, min) = displayDate(lastLoggedInDate, roundedDown: false)
        
        let longWeekday = getFullWeekdayName(shortWeekday: wkday)
        var minTwoDigits = "\(min)"
        if min < 10 {minTwoDigits = "0\(min)"}
        
        if indexPath.section == 0 { // to do this in column 1, you need to rewrite the layout attributes (zIndex)
            cell.titleLabel.text = " Last login \(longWeekday), \(mnthString) \(dayI), \(yr) @ \(hr):\(minTwoDigits)"
        }
        else {cell.titleLabel.text = ""}
        
        return cell
    }
}

