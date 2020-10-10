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
                    
                    if [column, row] != indexPathsToProcess.first {
                        
                        let taskDescriptions = tasks.map {"\($0.taskDescription)"}
                        var truncTaskDescr = [String]()
                        
                        var i = 1
                        for descr in taskDescriptions {
                            let truncDescr = truncateString(descr, cell: cell, layout: layout)
                            let limit = currentOrientation == "portrait" ? 5 : 3
                            if i <= limit {truncTaskDescr.append(" \(truncDescr)")}
                            if i == limit + 1{truncTaskDescr.append("...")}
                            i += 1
                        }
                        
                        cell.titleLabel.text = truncTaskDescr.joined(separator: " \n") //= tasks.isEmpty ? "" : "(\(tasks.count))"
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
            cell.backgroundColor = .clear
            
            guard let taskAtTimeBlock = tasksAtIndexPath[timeBlock], !taskAtTimeBlock.isEmpty else {
                cell.titleLabel.text = "(no items yet)"; return
            }
            
            cell.titleLabel.textColor = .black
            
            if (taskListOffset ... taskAtTimeBlock.count - 1 + taskListOffset).contains(row) {
                let status = taskAtTimeBlock[row - taskListOffset].taskStatus
                
                if column == 0 {
                    cell.titleLabel.text = " \(taskAtTimeBlock[row - taskListOffset].taskDescription)"
                    if status == .upcoming {cell.titleLabel.font = UIFont.systemFont(ofSize: 12, weight: .bold)}
                }
                    
                else if column == 1 {
                    cell.titleLabel.text = formattedDateString(taskAtTimeBlock[row - taskListOffset].deadline, roundDown: false, showYear: false, prefix: "", suffix: "", dateFormat: .fullDayShortForm)
                }
                    
                else {cell.titleLabel.text = "\(taskAtTimeBlock[row - taskListOffset].taskStatus)"}
                
            } else {cell.titleLabel.text = ""}
        }
            
        else if viewControllerType == .archive {
            cell.backgroundColor = .clear
            cell.titleLabel.textColor = grayThree
            cell.titleLabel.font = UIFont.systemFont(ofSize: 13, weight: .bold)
            
            let archivedTasks = archiveTaskDateComponentArrays.count
            var text = ""; let defaultText = "  History empty \n  (your Tasks appear here after you tag them)"
            cell.titleLabel.text = defaultText
            
            if archivedTasks == 0 {
                if row == downcastLayout!.rows / 2 {cell.titleLabel.text = defaultText} else {cell.titleLabel.text = ""}
            }
            else {
                if row < archivedTasks {
                    
                    if column == 0 {
                        text = formattedDateString(dateFromInts(archiveTaskDateComponentArrays[row]), roundDown: false, showYear: true, prefix: "", suffix: "", dateFormat: .fullDayShortForm)
                    }
                        
                    else if column == 1 {text = "\(archiveTaskDescriptions[row])"}
                    else {text = "\(archiveTaskStatusStrings[row])"}
                    
                    let truncDescr = truncateString(text, cell: cell, layout: layout)
                    cell.titleLabel.text = truncDescr
                }
            }
        }
        else {print("[timeBlockDateSetup(:)] unrecognized collection view type")}
    }
}

