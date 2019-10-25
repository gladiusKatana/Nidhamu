// NavBar           ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension CollectionVC {
    
    func setupNavBarButtons(_ withCustomColour: UIColor?, atIndex: Int?) {  //print("setting up nav bar buttons")
        
        let timetableButton = setupButton(selector: #selector(buttonWrapperMethodforTimetableVC), title: "timetableImage")
        let archiveButton = setupButton(selector: #selector(buttonWrapperMethodforArchiveVC), title: "calendarImage")
        ///let reloadButton = setupButton(selector: #selector(reloadCVWrapperMethod), title: "reloadButton")
        let lockKeyboardButton = setupButton(selector: #selector(keyboardLockWrapper), title: "wrench")
        
        var barButtonColours = [UIColor]()
        
        let buttons = [timetableButton, archiveButton, /*reloadButton,*/ lockKeyboardButton]
        
        navigationItem.rightBarButtonItems = buttons
        
        for _ in buttons {
            if barButtonColours.count <= buttons.count {barButtonColours.append(graySeven)} /// default colour, for the buttons that present all but the current vc
        }
        
        ///let barButtonColours = [graySeven, graySeven, graySeven, graySeven,]   /// hardcoding button colours (may be easier, depends how many more buttons & colour exceptions)
        
        for button in navigationItem.rightBarButtonItems! {
            ///if button == reloadButton {button.tintColor = grayBarelyThere}
            /*else */if button == lockKeyboardButton {button.tintColor = grayTwo}
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
    
}

