// VCLifecycle      ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension CollectionVC {
    
    override func viewDidLoad() {                                   super.viewDidLoad()
        collectionView.backgroundColor = .clear
        collectionView.bounces = false
        
        setTopViewController()
        let str = (showConsoleLegend) ? loadSymbolLegend : ""       ; print("💾\(topVC.vcType)\(str)")// disk emoji means loaded 💾
        
        statusBarHeightChangeNotificationSetup()
        keyboardNotificationSetup()
        processCurrentDate()
        periodicDateRefresh(){kickoffTimer()}                       // checks the date then does the timer kickoff ('starts on the 0th callback')
        //kickoffTimer()                                            // does the timer kickoff then checks the date ('starts on the 1st callback')
    }
    
    override func viewWillAppear(_ animated: Bool) {                super.viewWillAppear(animated)
        setNavBarTitle(customString: nil)
        setupNavBarButtons(grayTwo, atIndex: colourIndex)
    }
    
    override func viewDidAppear(_ animated: Bool) {                 super.viewDidAppear(animated)
        if vcType != .eventClassifier {
            setTopViewController()
        }
        
        if vcType == .todoList {setupPinchToExit()}
        
        if !showLoadAndAppearIndicationInConsole { // if the below print hasn't been done already for this vc
            let str = (showConsoleLegend) ? appearSymbolLegend : ""; print("🏞\(topVC.vcType)\(str)") // picture-emoji means appeared 🏞
            showLoadAndAppearIndicationInConsole = true
            if showConsoleLegend {showConsoleLegend = false}        // legend only needs to be shown once
        }
        reloadCV()
    }
    
    override func viewWillDisappear(_ animated: Bool) {             super.viewWillDisappear(animated)
        if vcType == .todoList {        ///since it's not (currently) possible, anyway, to navigate away from the timetable vc when in event-adding mode (ie when text field is displayed)
            if textFieldDisplayed {
                exitEventAddingMode()
                textFieldDisplayed = false
            }
        }
    }
}

