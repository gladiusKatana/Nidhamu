//  CellContents.swift
//  nidhamu  ∙  1st commit July. 08, 2019  ∙  Created by Garth Snyder, aka gladiusKatana ⚔️
import UIKit

extension CollectionVC {
    
    func setCellContents (cell: CustomCell, row: Int, column: Int, layout: CustomFlowLayout) {         //cell. titleLabel.text = "\(column),\(row)"
        
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
            
            guard let eventAtTimeBlock = eventsAtIndexPath[previousTimeBlock] else {
                cell.titleLabel.text = "(no items yet)"; return
            }
            
            if column == 0 {cell.titleLabel.text = eventAtTimeBlock[row].eventDescription}
            else {
                cell.titleLabel.text = "\(eventAtTimeBlock[row].eventStatus)"
            }
            
        } else {print("[setCellContents(:)] unrecognized collection view type")}//not called, but will add more vcs from project DMY-Tabs-Calendar
    }
}

