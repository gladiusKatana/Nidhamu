// CellSetup        ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension CollectionVC {
    
    func timeBlockDateSetup (cell: CustomCell, column: Int, row: Int, layout: CustomFlowLayout) { //cell. titleLabel.text = "\(column),\(row)"
        
        switch vcType {
            
        case .hours:
            
            setHourlyCellDates(cell: cell, column: column, row: row, layout: layout, looping: loopWeeks, withColours: demarcateWeeksByColour)
            
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
                cell.titleLabel.text = "(no items yet)"; return // not really needed since todo list vc is only go-to-able via a time block
            }
            
            let status = eventAtTimeBlock[row].eventStatus
            
            cell.titleLabel.textColor = .black
            
            if column == 0 {
                cell.titleLabel.text = eventAtTimeBlock[row].eventDescription
                if status == .occurred || status == .upcoming {cell.titleLabel.font = UIFont.systemFont(ofSize: 12, weight: .bold)}
            }
                
            else {cell.titleLabel.text = "\(eventAtTimeBlock[row].eventStatus)"}
            
        default: print("[timeBlockDateSetup(:)] unrecognized collection view type")}
    }
}

