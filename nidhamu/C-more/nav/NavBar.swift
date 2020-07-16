// NavBar           ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension CollectionVC {
    
    func setupNavBarButtons(_ greyoutColour: UIColor?, greyIndex: Int?) {  //print("setting up nav bar buttons")
        
        let timetableButton = setupButton(selector: #selector(buttonWrapperMethodforTimetableVC), title: "timetableImage")
        let archiveButton = setupButton(selector: #selector(buttonWrapperMethodforArchiveVC), title: "calendarImage")
        let lockKeyboardButton = setupButton(selector: #selector(keyboardLockWrapper), title: "wrench")
        
        let reloadButton = setupButton(selector: #selector(reloadCVWrapperMethod), title: "reloadButton")
        
        var barButtonColours = [UIColor]()
        ///hardcoding button colours (may be easier, depends how many more buttons & colour exceptions)
        //let barButtonColours = [graySeven, graySeven, graySeven, graySeven,]
        
        let buttons = [timetableButton, archiveButton, lockKeyboardButton, reloadButton]
        
        navigationItem.rightBarButtonItems = buttons
        
        for _ in buttons {
            if barButtonColours.count <= buttons.count {barButtonColours.append(graySeven)} /// default colour, for buttons that present all but current vc
        }
        
        for button in buttons {
            
            guard let greyout = greyoutColour else {print("no greyout colour"); return}
            guard let index = buttons.firstIndex(of: button) else {print("error finding button index"); return}
            
            let defaultColour = barButtonColours[index]
            button.tintColor = defaultColour
            
            if index == greyIndex {
                button.tintColor = greyout
            }
            
            if index == buttons.firstIndex(of: lockKeyboardButton) {
                if keyboardLocked {button.tintColor = greyout}
                else {button.tintColor = defaultColour}
            }
            
            if button == reloadButton {button.tintColor = grayBarelyThere}
            
        }
    }
}

