// Buttons          ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension CollectionVC {
    
    func setupButton(disabler: Bool, title: String, selector: Selector) -> UIBarButtonItem {
        
        let image = UIImage(named: title)?.withRenderingMode(.alwaysTemplate)
        
        return UIBarButtonItem(image: image, landscapeImagePhone: image, style: .plain, target: self,
                               action: disabler && ![#selector(keyboardLockWrapper), #selector(reloadCVWrapperMethod)].contains(selector)
                                ? #selector(nullSelector)
                                : selector)
    }
    
    @objc func nullSelector() {
        print("button disabled")
    }
    
    @objc func reloadCVWrapperMethod() {
        print("↺ reload collection view via button")
        reloadCV()
    }
    
    
    @objc func keyboardLockWrapper() {
        if textFieldDisplayed && keyboardLocked {
            exitTaskAddingMode()
            previousTimeBlockPathSelected = defaultPathOutOfView
            reloadCV()
        }
        
        keyboardLocked = !keyboardLocked
        setupNavBarButtons(grayTwo, greyIndex: colourIndex, disabler: textFieldDisplayed)
    }
    
    
    @objc func buttonWrapperMethodforArchiveVC() {
        if archiveTaskDescriptions.count != 0 {
            archiveVC.downcastLayout!.rows = archiveTaskDescriptions.count
            archiveVC.downcastLayout!.cols = 3
        }
        gotoView(vc: archiveVC)
    }
    
    
    @objc func buttonWrapperMethodforTimetableVC() {
        ///timetableVC.downcastLayout?.autoFitHScale = 1
        gotoView(vc: timetableVC)
    }
}

