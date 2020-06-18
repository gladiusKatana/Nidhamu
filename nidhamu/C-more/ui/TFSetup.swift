// TFSetup          ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension CollectionVC {
    
    func rePresentTextField() {                                     //print("re-presenting text field & keyboard")
        
        ///taskField.placeholder = "..."
        ///taskField.removeFromSuperview() ///comment out: causes a blink if keyboard locked, since it dismisses & re-presents keyboard & text field on every reloadData().
        
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
        let pre = "Add Task [Due:" ; let suf = "]"
        let str = formattedDateString(selectedCellDate, roundDown: false, showYear: false, prefix: pre, suffix: suf,
                                      dateFormat: .fullDayShortForm)/// ! probably needs smaller font on iPhone SE in portrait
        taskField.placeholder = str
    }
}

