// NavBar           ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension CollectionVC {
    
    func setupNavBarButtons(_ greyoutColour: UIColor?, greyIndex: Int?, disabler: Bool) {  //print("setting up nav bar buttons")
        
        let timetableButton = setupButton(disabler: disabler, title: "timetableButton.001 copy",
                                          selector: #selector(buttonWrapperMethodforTimetableVC))
        
        let archiveButton = setupButton(disabler: disabler, title: "historyButton",
                                        selector: #selector(buttonWrapperMethodforArchiveVC))
        
        let reloadButton = setupButton(disabler: disabler, title: "reloadButton",
                                       selector: #selector(reloadCVWrapperMethod))
        
        var barButtonColours = [UIColor]()
        
        let buttons = [archiveButton, timetableButton, reloadButton]
        navigationItem.rightBarButtonItems = buttons
        
        for _ in buttons {
            if barButtonColours.count <= buttons.count {barButtonColours.append(.black)} /// default colour, for buttons that present all but current vc
        }
        
        for button in buttons {
            guard let greyout = greyoutColour else {print("no greyout colour"); return}
            guard let index = buttons.firstIndex(of: button) else {print("error finding button index"); return}
            
            let defaultColour = barButtonColours[index]
            button.tintColor = defaultColour
            
            if index == greyIndex {button.tintColor = greyout}
            
            if button == reloadButton {button.tintColor = .clear} //grayBarelyThere
            
            if disabler && ![reloadButton].contains(button) {button.tintColor = greyout}
        }
    }
}

