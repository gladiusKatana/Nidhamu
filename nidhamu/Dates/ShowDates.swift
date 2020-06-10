// ShowDates        ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension CollectionVC {
    
    func showKeyTimeBlockDates(cell: CustomCell, layout: CustomFlowLayout) {
        let column = cell.xyCoordinate[0];  let row = cell.xyCoordinate[1]          /// for now: may pass in row & column from caller instead
        
        if row == earliestTaskAddress[1] && column == earliestTaskAddress[0] {
            
            cell.layer.borderColor = UIColor.white.cgColor                          //; print("highlighted cell white")
            
            if let tasks = tasksAtIndexPath[TimeBlock(values:(column, row))], tasks.count > 1 {
                
                cell.titleLabel.text = "(\(taskIndex + 1)/\(tasks.count))"          ///= "(\(tasks.count - tasksInBlockToBeProcessed + 1)/\(tasks.count))"
                cell.titleLabel.font = defaultTimetableCellFont
                
            }
                
            else {cell.titleLabel.text = globalTaskIdentifier}          /// when evets.count == 1, can just use previously set task's description via this var
        }
    }
    
    func showNowCell(_ cell: CustomCell, column: Int, row: Int, forSpringForward: Bool) {
        if tasksAtIndexPath[TimeBlock(values:(column, row))] == nil {
            cell.titleLabel.text = showTimeInTitleLabels(Date())
        }                                                                           ///;print("verified now cell @ [\(column),\(row)]")
    }
    
    func showDateInTitleLabels(date: Date, cell: CustomCell) { /// for testing; not used often
        cell.titleLabel.text = (formattedDateString(date, roundDown: false, showYear: true,
                                                    prefix: "", suffix: "", dateFormat: .monthAndDay))
    }
    
    func showTimeInTitleLabels(_ date: Date) -> String {
        return formattedDateString(date, roundDown: false, showYear: false, prefix: "", suffix: "", dateFormat: .hourAndMinute)
    }
}

