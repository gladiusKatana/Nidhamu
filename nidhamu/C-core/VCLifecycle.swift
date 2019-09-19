// VCLifecycle      ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension CollectionVC {
    
    override func viewDidLoad() {                                   super.viewDidLoad()
        if vcType == .todoList {collectionView.backgroundColor = .white}
        else {collectionView.backgroundColor = windowBackgroundColour}
        collectionView.bounces = false
        
        setTopViewController()
        let str = (showConsoleLegend) ? loadSymbolLegend : ""       ; print("💾\(topVC.vcType)\(str)")// disk emoji means loaded 💾
        
        statusBarHeightChangeNotificationSetup()
        keyboardNotificationSetup()
        periodicDateRefresh(){kickoffTimer()}                       // checks the date then does the timer kickoff ('starts on the 0th callback')
        //kickoffTimer()                                            // does the timer kickoff then checks the date ('starts on the 1st callback')
    }
    
    override func viewWillAppear(_ animated: Bool) {                super.viewWillAppear(animated)
        if vcType == .hours {setupViewTitle("Timetable", numLines: 1, alignment: .left)}
        else { // if vcType is the other nav-controller-embedded one, ie todoList VC
            setupViewTitle(formattedDateString(selectedCellDate, roundedDown: true, showYear: false, prefix: "Tasks", suffix: "", dateFormat: .hourlyTimeBlock), numLines: 1, alignment: .left)
        }
        setupNavBarButtons(grayTwo, atIndex: colourIndex)
    }
    
    override func viewDidAppear(_ animated: Bool) {                 super.viewDidAppear(animated)
        if vcType != .eventClassifier {
            setTopViewController()
            reloadCV()
        }
        
        if vcType == .todoList {setupPinchToExit()}
        
        if rePresentedVCManually {
            let str = (showConsoleLegend) ? appearSymbolLegend : ""; print("🏞\(topVC.vcType)\(str)") // picture-emoji means appeared 🏞
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {             super.viewWillDisappear(animated)
        if vcType == .todoList {
            if textFieldDisplayed {
                eventField.resignFirstResponder()
                eventField.removeFromSuperview()                    //; print("removed text field")
                textFieldDisplayed = false
            }
            previousTimeBlockPathSelected = defaultPathOutOfView
        }
    }
}

