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
        
        view.addSubview(taskField)
        taskField.becomeFirstResponder()
        textFieldDisplayed = true
    }
}

