// CellData         ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension CollectionVC {
    
    func getCellContents(cell: CustomCell, column: Int, row: Int, layout: CustomFlowLayout) { //cell. titleLabel.text = "\(column),\(row)"
        
        if viewControllerType == .timetable || viewControllerType == .deferralDates {
            if let loopWeeks = loopWeeks, let demarcateWeeksByColour = demarcateWeeksByColour {
                setHourlyCellDates(cell: cell, column: column, row: row, layout: layout, looping: loopWeeks, withColours: demarcateWeeksByColour)
            } else {print("cell dates not set up: initialization bool(s) set to nil")}
            
            if viewControllerType != .deferralDates {
                if let tasks = tasksAtIndexPath[TimeBlock(values:(column, row))] {
                    
                    let truncTrailSize = truncationTrail.stringSize(font: cell.titleLabel.font).width
                    let limit = (layout.cellWidth! - truncTrailSize) * 0.95
                    ///print("limit: \(limit)")  ///; print("dots: \(truncTrailSize)  avgLetter:\(averageLetterWidth)")
                    
                    if !([column, row] == indexPathsToProcess.first) {
                        
                        let taskDescriptions = tasks.map {"\($0.taskDescription)"}
                        var truncTaskDescr = [String]()
                        
                        var i = 1
                        for descr in taskDescriptions {
                            let truncDescr = truncateString(descr, sizeLimit: limit, font: cell.titleLabel.font)
                            let limit = currentOrientation == "portrait" ? 5 : 3
                            if i <= limit {truncTaskDescr.append(truncDescr)}
                            if i == limit + 1{truncTaskDescr.append("...")}
                            i += 1
                        }
                        
                        cell.titleLabel.text = truncTaskDescr.joined(separator: "\n") //= tasks.isEmpty ? "" : "(\(tasks.count))"
                    }
                }
                
                if [column, row] == deferralPath {
                    var deadline = Date(); let baseDeadline = cell.cellDate + TimeInterval(3600 * timeBlockSize)
                    
                    if (column, row) == (nowColumn, nowRow) {
                        deadline = baseDeadline + TimeInterval(86400 * 7)
                    } else {deadline = baseDeadline}
                    
                    cell.titleLabel.text = deferredDescription
                    addToTimeBlock(atColumn: column, atRow: row, textEntered: "\(deferredDescription)",
                        taskDeadline: deadline, withStatus: .deferred)
                    deferralPath = defaultPathOutOfView
                }
            }
        }
            
        else if viewControllerType == .taskList {
            cell.cellDate = selectedCellDate
            cell.backgroundColor = defaultColour
            
            guard let taskAtTimeBlock = tasksAtIndexPath[timeBlock], !taskAtTimeBlock.isEmpty else {
                cell.titleLabel.text = "(no items yet)"; return
            }
            let status = taskAtTimeBlock[row].taskStatus
            cell.titleLabel.textColor = .black
            
            if column == 0 {
                cell.titleLabel.text = taskAtTimeBlock[row].taskDescription
                if status == .upcoming {cell.titleLabel.font = UIFont.systemFont(ofSize: 12, weight: .bold)}
            }
                
            else if column == 1 {
                cell.titleLabel.text = formattedDateString(taskAtTimeBlock[row].deadline, roundDown: false, showYear: false, prefix: "", suffix: "", dateFormat: .fullDayShortForm)
            }
                
            else {cell.titleLabel.text = "\(taskAtTimeBlock[row].taskStatus)"}
        }
            
        else if viewControllerType == .archive {
            cell.titleLabel.textColor = .black;  cell.titleLabel.font = UIFont.systemFont(ofSize: 10, weight: .regular)
            
            if column == 0 {
                cell.titleLabel.text = archiveTaskDateComponentArrays.isEmpty ? "" : formattedDateString(dateFromInts(archiveTaskDateComponentArrays[row]), roundDown: false, showYear: true, prefix: "", suffix: "", dateFormat: .fullDayShortForm)
            }
                
            else if column == 1 {cell.titleLabel.text = archiveTaskDescriptions.isEmpty ? "" : "\(archiveTaskDescriptions[row])"}
            else {cell.titleLabel.text = archiveTaskStatusStrings.isEmpty ? "" : "\(archiveTaskStatusStrings[row])"}
        }
            
        else {print("[timeBlockDateSetup(:)] unrecognized collection view type")}
    }
}

