// NavTitle         ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension CollectionVC {
    
    func setNavBarTitle(customString: String?) {    //print("setting nav bar title")
        var title : String?
        
        if customString != nil {
            title = customString
        }
        else {
            if vcType == .hours {
                title = "Timetable"
            }
            else if vcType == .archive {
                title = "Archive"
            }
            else if vcType == .deferralDates {
                title = "Select date to defer '\(globalEventIdentifier)'"
            }
            else { /// if vcType is the other navigation-controller-embedded collection view controller used in this application, ie todoList VC.   Note, will add more soon (see Notes.swift)
                title = formattedDateString(selectedCellDate, roundedDown: true, showYear: false, prefix: "Tasks", suffix: "", dateFormat: .hourlyTimeBlock)
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

