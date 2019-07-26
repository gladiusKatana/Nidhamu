// VCLifecycle      ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension CollectionVC { //* will try to shorten this one, soon
    
    override func viewDidLoad() {
        collectionView.backgroundColor = windowBackgroundColour // shown on top of UIWindow's background colour
        if vcType == .todoList {collectionView.backgroundColor = bluishGray}
        collectionView.register(CustomCell.self, forCellWithReuseIdentifier: CustomCell.reuseIdentifier)
        collectionView.bounces = false
        setupNotificationForStatusBarHeightChange()
        
        if vcType != .initial { var str = ""
            if !consoleLegendAppeared {str = loadSymbolLegend} else {str = ""}
            print("💾\(vcType)\(str)")                          // disk emoji means loaded
            setTopViewController()
        }
        periodicDateRefresh(){kickoffTimer()}   // if you want to check the date then do the timer kickoff ('start on the 0th callback')
        //kickoffTimer()                        // if you want to do the timer kickoff then check the date ('start on the 1st callback')
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if vcType == .hours {
            setupViewTitle("Timetable", numLines: 1, alignment: .left)
        }
        else {                                                  // if vcType is the other nav-controller-embedded one, ie todoList VC
            setupViewTitle(formattedDateString(selectedCellDate, roundedDown: true, prefix: "Tasks", suffix: "", short: true), numLines: 1, alignment: .left)
        }
        
        if rePresentedVCFromButton { var str = ""
            rePresentedVCFromButton = false
            reloadCV()
            if !consoleLegendAppeared {str = appearSymbolLegend} else {str = ""}
            print("🏞\(vcType)\(str)")                          // picture-emoji means appeared
            consoleLegendAppeared = true
        } //cabove method called early (before actually appears) to print on first appearance + avoid an additional reset of rePresentedVCFromButton
    }
    
    override func viewDidAppear(_ animated: Bool) {             //print("path to time block\(selectedTimeBlockPath)")
        if vcType != .eventClassifier {setTopViewController()}
        setupNavBarButtons(grayTwo, atIndex: colourIndex)
        addPinchRecognizer()
    }
    
    override func viewWillDisappear(_ animated: Bool) {         //print("...\(vcType) will disappear...")
        if vcType == .todoList {
            if textFieldDisplayed {
                eventField.removeFromSuperview()                //; print("removed text field")
                textFieldDisplayed = false
            }
        }
    }
}

