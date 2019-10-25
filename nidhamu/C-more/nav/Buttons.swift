// Buttons          ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension CollectionVC {
    
    func setupButton(selector: Selector, title: String) -> UIBarButtonItem {
        let image = UIImage(named: title)?.withRenderingMode(.alwaysTemplate)
        let button = UIBarButtonItem(image: image, landscapeImagePhone: image, style: .plain, target: self, action: selector)
        return button
    }
    
    
    @objc func reloadCVWrapperMethod() { //print("*")
        reloadCV() //exitEventAddingMode()
    }
    
    
    @objc func keyboardLockWrapper() {
        if !textFieldDisplayed {        /// else should probably grey out the button, since button is inactive in that scope
            keyboardLocked = true
        }
        else {
            if keyboardLocked {
                keyboardLocked = false
                exitEventAddingMode(); reloadCV()
            }
        }
    }
    
    
    @objc func buttonWrapperMethodforArchiveVC() {
        archiveVC.downcastLayout!.rows = archiveEventDescriptions.count
        gotoView(vc: archiveVC)
    }
    
    
    @objc func buttonWrapperMethodforTodoListVC() {}//gotoView(vc: todoListVC)
    
    
    @objc func buttonWrapperMethodforTimetableVC() {
        //        timetableVC.downcastLayout?.autoFitHScale = 1
        gotoView(vc: timetableVC)}
    
}

