// NavTitle         ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension CollectionVC {
    
    func setNavBarTitle(customString: String?) {    //print("setting nav bar title")
        var title : String?
        
        if customString != nil {
            title = customString
        }
        else {
            if viewControllerType == .timetable {
                title = "Timetable"
            }
            else if viewControllerType == .archive {
                title = "Past-Due Tasks"
            }
            else if viewControllerType == .deferralDates {
                title = "Select date to defer '\(globalTaskIdentifier)'"
            }
            else { /// ie if viewControllerType is the task list VC.   Note, will add more VCs soon (see Notes.swift)
                title = formattedDateString(selectedCellDate, roundDown: true, showYear: false,
                                            prefix: "Tasks Due", suffix: "", dateFormat: .hourlyTimeBlock)
            }
        }
        
        setupViewTitle(title!, numLines: 1, alignment: .left)
    }
}

extension UIViewController {
    
    func setupViewTitle(_ titleText: String, numLines: Int, alignment: NSTextAlignment) {
        var navbarTitleLabel = UILabel();
        navbarTitleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 1366, height: 20)) //1366 is width (# of points) of the ipad pro 12.9"
        navbarTitleLabel.backgroundColor = .clear
        navbarTitleLabel.text = titleText; navbarTitleLabel.numberOfLines = numLines
        navbarTitleLabel.textAlignment = alignment
        navbarTitleLabel.font = UIFont(name: "Helvetica Neue", size: 13)
        navbarTitleLabel.textColor = .black
        navbarTitleLabel.isUserInteractionEnabled = false
        navigationItem.titleView = navbarTitleLabel
    }
}

