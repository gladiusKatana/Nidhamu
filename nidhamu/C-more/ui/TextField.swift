// TextField        ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension CollectionVC {
    
    func presentTextFieldAndReload(after delay: Double, forTaskAtRow row: Int?) {
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            self.prepareAndPresentTextField(forTaskAtRow: row)
            self.reloadCV()
        }
    }
    
    func prepareAndPresentTextField(forTaskAtRow row: Int?) {
        globalWindow.backgroundColor = iosKeyboardDefaultColourApprox
        backgroundVC.view.backgroundColor = globalWindow.backgroundColor
        
        var str = "(initial text)"
        
        guard let tasks = tasksAtIndexPath[timeBlock] else {
            formatAndPresentTextField(str)
            return
        }
        
        if row != nil {
            let taskDescription = tasks[row!].taskDescription
            str = taskDescription
        }
        
        formatAndPresentTextField(str)
    }
    
    func formatAndPresentTextField(_ textFieldContents: String) {
        let width = globalWindow.frame.width
        textFieldWidth = width * 3 / 4 /// 3/4 = 6/8 e.g. 8 - 2 columns (1 right, 1 left of text field)
        let eighthWidth = width / 8
        
        if textFieldEditingMode {
            taskField.text = textFieldContents
        }
        
        taskField.delegate = self
        taskField.frame = CGRect(x: eighthWidth, y: textFieldY, width: textFieldWidth, height: textFieldHeight)
        ///taskField.attributedPlaceholder = NSAttributedString(string: dateString, attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray])
        
        view.addSubview(taskField)
        taskField.becomeFirstResponder()
        textFieldDisplayed = true
    }
    
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

/*
 //    func prepareAndPresentTextField(forTaskAtRow row: Int?) {
 //        globalWindow.backgroundColor = iosKeyboardDefaultColourApprox
 //        backgroundVC.view.backgroundColor = globalWindow.backgroundColor
 //        let pre = rowLongPressed == -1 ? "Add task [Due:" : "Edit Task Due:"
 //        let suf = rowLongPressed == -1 ? "]" : ""
 //        let dateStr = formattedDateString(selectedCellDate, roundDown: false, showYear: false, prefix: pre, suffix: suf,
 //                                          dateFormat: .fullDayShortForm) /// ! probably needs smaller font on iPhone SE in portrait
 //        formatAndPresentTextField(dateStr)
 //    }
 */

/*
 //            var contents = ""
 //            if let placeholder = taskField.placeholder {
 //                contents = placeholder
 //            } else {contents = "."}
 */

