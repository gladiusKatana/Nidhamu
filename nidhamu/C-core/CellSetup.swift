// CellSetup        ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension CollectionVC {
    
    func timeBlockDateSetup (cell: CustomCell, column: Int, row: Int, layout: CustomFlowLayout) { //cell. titleLabel.text = "\(column),\(row)"
        
        switch vcType {
            
        case .hours:
            
            setHourlyCellDates(cell: cell, column: column, row: row, layout: layout, looping: loopWeeks, withColours: demarcateWeeksByColour)
            
            if let events = eventsAtIndexPath[TimeBlock(values:(column, row))] {
                if events.count == 1 {
                    let eventName = events[0].eventDescription
                    cell.titleLabel.text = eventName
                    
                    let truncTrailSize = truncationTrail.stringSize(font: cell.titleLabel.font).width
                    let limit = layout.cellWidth! - truncTrailSize //+ averageLetterWidth * 1.3
                    
                    ///print("limit: \(limit)")
                    ///print("dots: \(truncTrailSize)  avgLetter:\(averageLetterWidth)")
                    
                    cell.titleLabel.text = truncateString(eventName, sizeLimit: limit, font: cell.titleLabel.font)
                }
                else {cell.titleLabel.text = "(\(events.count))"}
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

