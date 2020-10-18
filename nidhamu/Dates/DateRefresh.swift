// DateRefresh      ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension CollectionVC {
    func periodicDateRefresh(completion: () -> ()) {                    //print("Date: \(Date())") //print("·", terminator: "")
        ///        print(formattedDateString(Date(), roundDown: false, showYear: false, prefix: "", suffix: "", dateFormat: .second), terminator: ",")
        let finalSeconds = [56,57,58,59]
        var finalSecondStrings = [String]()
        
        var i=0
        for secs in finalSeconds {
            finalSecondStrings.append(":\(secs) +")
            
            if "\(Date())".contains(finalSecondStrings[i]) {            //print("DATE: \(Date())")
                reloadedFromHourTickingOver = false
                if !taggingViewDisplayed {
                    defaultSaveData(saveDate: true, resetLastLogin: false, showDate: false, pryntTasks: false)
                } else {
                    defaultSaveData(saveDate: false, resetLastLogin: false, showDate: false, pryntTasks: false)
                }
            }
            i+=1
        }
        
        if ("\(Date())".contains(":0") ///or :00: for hourly
                && !reloadedFromHourTickingOver) {
            searchForDST()
            if !animating {
                topVC.reloadCollectionViewAfterDelay(0) /// keep on main queue: periodic callback in completion handler called on a background thread
            }
            //pryntLastLoginDate(); pryntCurrentDate()
        }
        completion()
    }
    
    func kickoffTimer() {
        DispatchQueue.global(qos: .userInteractive).asyncAfter(deadline: .now() + 3) { [weak self] in
            self?.periodicDateRefresh(){self!.kickoffTimer()}
        }
    }
}

