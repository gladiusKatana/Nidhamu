// TFSetup          ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension CollectionVC {
    
    func rePresentTextField() {                                     //print("re-presenting text field & keyboard")
        ///taskField.placeholder = "..."
        ///taskField.removeFromSuperview() ///causes a blink if keyboard locked, since it dismisses & re-presents keyboard & text field on every reload-Data().
        taskField.becomeFirstResponder()
        
        if viewControllerType != .archive {
            let contents = taskField.text!
            /**/
            formatAndPresentTextField(contents)
        }
        
        var str = ""
        if rowLongPressed != -1 {
            str = "Edit Task"
        } else {str = viewControllerType == CollectionViewType.taskList ? "Add Task to Time Block " : "Add Task to Timetable"}
        setNavBarTitle(customString: str)
    }
    
    func setTaskFieldPlaceholder() {
        //        var pre = ""
        //        let suf = "]"
        //        if textFieldEditingMode {
        //            pre = "New Task Name ["
        //        }
        //        else {pre = "Add Task [Due:"}
        //        let str = formattedDateString(selectedCellDate, roundDown: false, showYear: false, prefix: pre, suffix: suf,
        //                                      dateFormat: .fullDayShortForm)/// ! probably needs smaller font on iPhone SE in portrait
        
        let timeBlockDescriptor = getSelectedTimeBlockDescriptor()
        let taskInstruction = rowLongPressed != -1 ? "Edit Task" : "Add Task"
        taskField.placeholder = "\(taskInstruction): \(timeBlockDescriptor)"
    }
    
    func getSelectedTimeBlockDescriptor() -> String {
        
        let date = selectedCellDate - TimeInterval(3600 * timeBlockSize)///text field text below refers to date of timeblock task is on (not deadline)
        let dayOfWeek = customWkdysDefaultOrder[Calendar.current.component(.weekday, from: date) - 1]
        let dateAndMonth = formattedDateString(date, roundDown: false, showYear: true,
                                               prefix: "", suffix: "", dateFormat: .monthAndDayNoPrefix)
        let str = dayQuartersLong[selectedTimeBlockPath[1] - 5]
        return "\(dayOfWeek). \(str) (\(dateAndMonth))"
    }
}

