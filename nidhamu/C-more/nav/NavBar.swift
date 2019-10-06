// NavBar           ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension CollectionVC {
    
    func setupNavBarButtons(_ withCustomColour: UIColor?, atIndex: Int?) {
        
        let timetableButton = setupButton(selector: #selector(buttonWrapperMethodforTimetableVC), title: "timetableImage")
        let todoListButton = setupButton(selector: #selector(buttonWrapperMethodforTodoListVC), title: "calendarImage")
        let archiveButton = setupButton(selector: #selector(buttonWrapperMethodforArchiveVC), title: "calendarImage")
        let reloadButton = setupButton(selector: #selector(reloadCVWrapperMethod), title: "reloadButton")
        
        navigationItem.rightBarButtonItems = [timetableButton, archiveButton, todoListButton, reloadButton]
        
        let barButtonColours = [graySeven, graySeven, graySeven]   /// buttons are dark by default, then greyed-out when their corresponding vc is presented
        
        for button in navigationItem.rightBarButtonItems! {
            if button == todoListButton {button.tintColor = .clear}
            else if button == reloadButton {button.tintColor = grayBarelyThere}
            else {
                if let index = navigationItem.rightBarButtonItems?.firstIndex(of: button) {
                    button.tintColor = barButtonColours[index]
                }
                else {print("error with button index")}
            }
        }
        
        if let customColour = withCustomColour {
            if let colourIndex = atIndex {
                navigationItem.rightBarButtonItems?[colourIndex].tintColor = customColour
            } //else {print("<no custom colour index>")}
        } //else {print("<no custom colour>")}
    }
    
    func setupButton(selector: Selector, title: String) -> UIBarButtonItem {
        let image = UIImage(named: title)?.withRenderingMode(.alwaysTemplate)
        let button = UIBarButtonItem(image: image, landscapeImagePhone: image, style: .plain, target: self, action: selector)
        return button
    }
    
    @objc func reloadCVWrapperMethod() { //print("*")
        //reloadCV()
        exitEventAddingMode()
    }
    
    @objc func buttonWrapperMethodforTimetableVC() {gotoView(vc: timetableVC)}
    @objc func buttonWrapperMethodforTodoListVC() {}//gotoView(vc: todoListVC)
    
    @objc func buttonWrapperMethodforArchiveVC() {
        archiveVC.downcastLayout!.rows = archiveEventDescriptions.count
        gotoView(vc: archiveVC)
    }
}

