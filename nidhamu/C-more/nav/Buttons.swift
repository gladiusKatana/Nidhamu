// Buttons          ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension CollectionVC {
    
    func setupButton(selector: Selector, title: String) -> UIBarButtonItem {
        let image = UIImage(named: title)?.withRenderingMode(.alwaysTemplate)
        let button = UIBarButtonItem(image: image, landscapeImagePhone: image, style: .plain, target: self, action: selector)
        return button
    }
    
    
    @objc func reloadCVWrapperMethod() { print("*reload")
        reloadCV() //exitTaskAddingMode()
    }
    
    
    @objc func keyboardLockWrapper() {
        
        if textFieldDisplayed && keyboardLocked {
            exitTaskAddingMode()
            previousTimeBlockPathSelected = defaultPathOutOfView
            reloadCV()
        }
        
        keyboardLocked = !keyboardLocked
        
        setupNavBarButtons(grayTwo, greyIndex: colourIndex)
    }
    
    
    @objc func buttonWrapperMethodforArchiveVC() {
        archiveVC.downcastLayout!.rows = archiveTaskDescriptions.count
        gotoView(vc: archiveVC)
    }
    
    
    @objc func buttonWrapperMethodforTaskListVC() {}//gotoView(vc: taskListVC)
    
    
    @objc func buttonWrapperMethodforTimetableVC() {
        ///timetableVC.downcastLayout?.autoFitHScale = 1
        gotoView(vc: timetableVC)}
    
}

