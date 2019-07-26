// CellContents     ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension CollectionVC {
    
    func setCellContents (cell: CustomCell, column: Int, row: Int, layout: CustomFlowLayout) {         //cell. titleLabel.text = "\(column),\(row)"
        
        if vcType == .hours {
            
            setupHourlyCells(cell: cell, column: column, row: row, layout: layout, looping: loopWeeks, withColours: demarcateWeeksByColour)
            
            let cellTimeBlock = TimeBlock(values:(column, row))
            
            if let events = eventsAtIndexPath[cellTimeBlock] {
                if events.count == 1 {
                    cell.titleLabel.text = events[0].eventDescription
                }
                else {
                    cell.titleLabel.text = "(\(events.count) items)"
                }
            }
        }
            
        else if vcType == .todoList {
            
            cell.cellDate = selectedCellDate
            
            guard let eventAtTimeBlock = eventsAtIndexPath[timeBlock] else {    //eventsAtIndexPath[previous TimeBlock]
                cell.titleLabel.text = "(no items yet)"; return
            }
            
            if column == 0 {
                cell.titleLabel.text = eventAtTimeBlock[row].eventDescription
                cell.titleLabel.textColor = .black
            }
            else {
                cell.titleLabel.textColor = grayTwo
                if column == 1 {
                    cell.titleLabel.text = formattedDateString(eventAtTimeBlock[row].eventDate, roundedDown: true, prefix: "", suffix: "", short: true)
                }
                else {
                    cell.titleLabel.text = "\(eventAtTimeBlock[row].eventStatus)"
                }
            }
            
        } else {print("[setCellContents(:)] unrecognized collection view type")}//not called, but will add more vcs from project DMY-Tabs-Calendar
    }
}

