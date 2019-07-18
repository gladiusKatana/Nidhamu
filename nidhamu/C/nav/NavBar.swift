// NavBar           ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension UICollectionViewController { //CollectionVC {//***
    
    func setupNavBarButtons(_ withCustomColour: UIColor?, atIndex: Int?) {
        let timetableButton = setupButton(selector: #selector(buttonWrapperMethodforTimetableVC), title: "timetableImage")
        //let todoListButton = setupButton(selector: #selector(buttonWrapperMethodforTodoListVC), title: "calendarImage")
        let hiddenReloadButton = setupButton(selector: #selector(reloadCV), title: "reloadButton") // for developer use: user should never need it
        
        navigationItem.rightBarButtonItems = [timetableButton, hiddenReloadButton]
        
        var barButtonColours = [graySeven, .clear]
        
        for button in navigationItem.rightBarButtonItems! {
            if let index = navigationItem.rightBarButtonItems?.firstIndex(of: button) {
                button.tintColor = barButtonColours[index]
            }
        }
        
        if let customColour = withCustomColour {
            if let colourIndex = atIndex {
                navigationItem.rightBarButtonItems?[colourIndex].tintColor = customColour
            } else {print("<no custom colour index>")}
        } else {print("<no custom colour>")}
    }
    
    func setupButton(selector: Selector, title: String) -> UIBarButtonItem {
        let image = UIImage(named: title)?.withRenderingMode(.alwaysTemplate)
        let button = UIBarButtonItem(image: image, landscapeImagePhone: image, style: .plain, target: self, action: selector)
        return button
    }
    
    @objc func buttonWrapperMethodforTimetableVC() {presentViaVCButton(vc: timetableVC)}
    //@objc func buttonWrapperMethodforTodoListVC() {presentViaVCButton(vc: todoListVC)}
    
    func presentViaVCButton(vc: CollectionVC) {
        rePresentedVCFromButton = true
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            self.gotoView(vc: vc)
        }
    }
}

