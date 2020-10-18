// ShowDates        ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension CollectionVC {
    
    func showKeyTimeBlockDates(cell: CustomCell, layout: CustomFlowLayout) {
        
        let column = cell.xyCoordinate[0];  let row = cell.xyCoordinate[1]          /// for now: may pass in row & column from caller instead
        if row == earliestTaskAddress[1] && column == earliestTaskAddress[0] {
            
            cell.layer.borderColor = UIColor.white.cgColor                          //; print("highlighted cell white")
            cell.layer.borderWidth = 4
            
            if let tasks = tasksAtIndexPath[TimeBlock(values:(column, row))]/*, tasks.count > 1*/ {
                var description = ""; let newLineAndSpace = "\n   "
                if tasks.count != 0 {
                    description = "\(newLineAndSpace)\(tasks[0].taskDescription)"
                } else {
                    description = "\(newLineAndSpace)✔︎"
                    if downcastLayout?.autoFitHeightScale != 1 {
                        downcastLayout?.autoFitHeightScale = 1      //; print("reset hScale to 1 on \(topVC.viewControllerType)")
                    }
                }
                
                cell.titleLabel.text = description
                cell.titleLabel.font = defaultTimetableCellFont
            } else {cell.titleLabel.text = globalTaskIdentifier}   /// when evets.count == 1, can just use previously set task's description via this var
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
        let dateFormat = CustomDateFormat.hourAndMinuteNewlined
        return formattedDateString(date, roundDown: false, showYear: false, prefix: "", suffix: "", dateFormat: dateFormat)
    }
}

