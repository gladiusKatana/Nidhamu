// CellContents     ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension CollectionVC {
    
    func timeBlockDateSetup (cell: CustomCell, column: Int, row: Int, layout: CustomFlowLayout) {     //cell. titleLabel.text = "\(column),\(row)"
        
        switch vcType {
            
        case .hours:
            
            setupHourlyCells(cell: cell, column: column, row: row, layout: layout, looping: loopWeeks, withColours: demarcateWeeksByColour)
            
            if let events = eventsAtIndexPath[TimeBlock(values:(column, row))] {
                if events.count == 1 {
                    cell.titleLabel.text = events[0].eventDescription
                }
                else {
                    cell.titleLabel.text = "(\(events.count))"
                }
            }
            
        case .todoList:
            
            cell.cellDate = selectedCellDate
            
            guard let eventAtTimeBlock = eventsAtIndexPath[timeBlock] else {
                cell.titleLabel.text = "(no items yet)"; return
            }
            
            if column == 0 {
                cell.titleLabel.text = eventAtTimeBlock[row].eventDescription
                cell.titleLabel.textColor = .black
            }
            else {
                cell.titleLabel.textColor = grayTwo
                if column == 1 {
                    cell.titleLabel.text = formattedDateString(eventAtTimeBlock[row].eventDate,
                                                               roundedDown: true, prefix: "", suffix: "", short: false)
                }
                else {
                    cell.titleLabel.text = "\(eventAtTimeBlock[row].eventStatus)"
                }
            }
            
        default: print("[setCellContents(:)] unrecognized collection view type")}
    }
}

