// VCLifecycle      ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit; import NotificationCenter

extension CollectionVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = windowBackgroundColour                 // shown on top of UIWindow's background colour
        if vcType == .todoList {collectionView.backgroundColor = bluishGray}
        collectionView.bounces = false
        setupNotificationForStatusBarHeightChange()
        
        if vcType != .initial { var str = ""
            if !consoleLegendAppeared {str = loadSymbolLegend} else {str = ""}
            print("💾\(vcType)\(str)")                                          // disk emoji means loaded 💾
            setTopViewController()
        }
        periodicDateRefresh(){kickoffTimer()}                   // checks the date then does the timer kickoff ('starts on the 0th callback')
        //kickoffTimer()                                        // does the timer kickoff then checks the date ('starts on the 1st callback')
        
        NotificationCenter.default.addObserver(self, selector: #selector(showKBoard), name: UIResponder.keyboardWillShowNotification, object: nil
        )
    }
    
    @objc func showKBoard(_ notification: Notification) {                                       //print("keyboard will show")
        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            keyboardHeight = keyboardRectangle.height
            
            textFieldDisplayed = true //; print("⌨️")
            reloadCV() //; print("r")
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if vcType != .eventClassifier {setTopViewController(); reloadCV()}
        setupNavBarButtons(grayTwo, atIndex: colourIndex)
        setupPinching()
        
        if vcType == .hours {
            setupViewTitle("Timetable", numLines: 1, alignment: .left)
        } else {                                                            // if vcType is the other nav-controller-embedded one, ie todoList VC
            setupViewTitle(formattedDateString(selectedCellDate, roundedDown: true, prefix: "Tasks", suffix: "", short: true), numLines: 1, alignment: .left)
        }
//        if rePresentedVCFromButton {
            var str = ""
            rePresentedVCFromButton = false
            if !consoleLegendAppeared {str = appearSymbolLegend} else {str = ""}
            print("🏞 \(vcType)\(str)")                                    // picture-emoji means appeared 🏞
            consoleLegendAppeared = true
//        } //*above method called early (before actually appears) to print on first appearance + avoid additional reset of rePresentedVCFromButton
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if vcType == .todoList {
            if textFieldDisplayed {
                eventField.resignFirstResponder()
                eventField.removeFromSuperview()                            //; print("removed text field")
                textFieldDisplayed = false
            }
            previousSelectedTimeBlockPath = defaultPathOutOfView
        }
    }
}

