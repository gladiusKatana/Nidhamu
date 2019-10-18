// CellSetup        ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension CollectionVC {
    
    func timeBlockDateSetup (cell: CustomCell, column: Int, row: Int, layout: CustomFlowLayout) { //cell. titleLabel.text = "\(column),\(row)"
        
        switch vcType {
            
        case .hours:
            if let loopWeeks = loopWeeks, let demarcateWeeksByColour = demarcateWeeksByColour {
                setHourlyCellDates(cell: cell, column: column, row: row, layout: layout, looping: loopWeeks, withColours: demarcateWeeksByColour)
            }
            else {print("cell dates not set up: initialization bool(s) set to nil")}
            
            if let events = eventsAtIndexPath[TimeBlock(values:(column, row))] {
                if events.count == 1 {
                    let eventName = events[0].eventDescription
                    cell.titleLabel.text = eventName
                    
                    let truncTrailSize = truncationTrail.stringSize(font: cell.titleLabel.font).width
                    let limit = layout.cellWidth! - truncTrailSize //+ averageLetterWidth * 1.3
                    ///print("limit: \(limit)")  ///; print("dots: \(truncTrailSize)  avgLetter:\(averageLetterWidth)")
                    
                    cell.titleLabel.text = truncateString(eventName, sizeLimit: limit, font: cell.titleLabel.font)
                }
                else {
                    if eventsInBlockToBeProcessed == 0 {
                        cell.titleLabel.text = "(\(events.count))"
                    }
                    else {cell.titleLabel.text = ""}
                }
            }
            
        case .todoList:
            
            cell.cellDate = selectedCellDate
            
            guard let eventAtTimeBlock = eventsAtIndexPath[timeBlock] else {
                cell.titleLabel.text = "(no items yet)"; return // will not be executed since todo list vc is only go-to-able via a time block
            }
            
            let status = eventAtTimeBlock[row].eventStatus
            
            cell.titleLabel.textColor = .black
            
            if column == 0 {
                cell.titleLabel.text = eventAtTimeBlock[row].eventDescription
                if status == .upcoming {cell.titleLabel.font = UIFont.systemFont(ofSize: 12, weight: .bold)}
            }
                
            else if column == 1 {
                cell.titleLabel.text = formattedDateString(eventAtTimeBlock[row].eventDate, roundedDown: false, showYear: true, prefix: "", suffix: "", dateFormat: .fullDayShortForm)
            }
                
            else {cell.titleLabel.text = "\(eventAtTimeBlock[row].eventStatus)"}
            
        case .archive:
            
            cell.titleLabel.textColor = .darkGray;  cell.titleLabel.font = UIFont.systemFont(ofSize: 10, weight: .ultraLight)
            
            if column == 0 {
                cell.titleLabel.text = formattedDateString(dateFromInts(archiveEventDateComponentArrays[row]), roundedDown: false, showYear: true, prefix: "", suffix: "", dateFormat: .fullDayShortForm)
            }
                
            else if column == 1 {cell.titleLabel.text = "\(archiveEventDescriptions[row])"}
                
            else if column == 2 {
                //let rawVal = archiveEventStatuses[row]
                cell.titleLabel.text = archiveEventStatusStrings[row]//EventStatus(rawValue: rawVal)!.caseName()
            }
                
            else {
                cell.titleLabel.text = "\(dateFromInts(archiveEventDateComponentArrays[row]))"
                cell.titleLabel.font = UIFont.systemFont(ofSize: 6, weight: .ultraLight)
            }
            
        default: print("[timeBlockDateSetup(:)] unrecognized collection view type")}
    }
}

