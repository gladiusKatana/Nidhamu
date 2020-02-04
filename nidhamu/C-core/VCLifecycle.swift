// VCLifecycle      ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension CollectionVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = backgroundColour
        collectionView.bounces = false
        ///let str = (showConsoleLegend) ? loadSymbolLegend : "" //; print("💾\(topVC.viewControllerType)\(str)")// disk emoji means loaded 💾
        setTopViewController()
        statusBarHeightChangeNotificationSetup()
        keyboardNotificationSetup()
        
        periodicDateRefresh(){kickoffTimer()}               /// checks the date then does the timer kickoff ('starts on the 0th callback')
        ///kickoffTimer()                                                                                       // does the timer kickoff then checks the date ('starts on the 1st callback')
        
        if viewControllerType == .taskList {
            let longPress : UILongPressGestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress))
            longPress.minimumPressDuration = 0.5
            longPress.delegate = self
            longPress.delaysTouchesBegan = true
            self.collectionView?.addGestureRecognizer(longPress)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if !taskIsDeletable {setNavBarTitle(customString: nil)}
        setupNavBarButtons(grayTwo, greyIndex: colourIndex)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setTopViewController()
        if [.taskList, .archive].contains(viewControllerType) {setupPinchToExit()}
        ///if !showLoadAndAppearIndicationInConsole {                                                                                               // if the below print hasn't been done already for this vc
        ///let str = (showConsoleLegend) ? appearSymbolLegend : ""; print("🏞\(topVC.viewControllerType)\(str)")  // picture-emoji means appeared 🏞
        ///showLoadAndAppearIndicationInConsole = true
        if showConsoleLegend {showConsoleLegend = false}                              /// legend only needs to be shown once
        ///}
        reloadCV()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if viewControllerType == .taskList && textFieldDisplayed {
            exitTaskAddingMode()
            textFieldDisplayed = false
        }
        if viewControllerType == .deferralDates {collectionView.reloadData()}
    }
}

