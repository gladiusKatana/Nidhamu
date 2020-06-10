// DateRefresh      ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

func processCurrentDate() {
    
    let (year, _, month, _ , day, weekday, _, hour, minute, _) = getChosenDateComponents(Date(), roundedDown: true)
    
    let timeOfDay = Calendar.current.component(.hour, from: Date()) / timeBlockSize
    
    nowRow = timeOfDay + timetableLayout.lockedHeaderRows /// for 'nowCell': tabular position of current date
    nowColumn = fullWeekdaysDisplayedOrder.firstIndex(of: weekday)! + timetableLayout.lockedHeaderSections
    //print("finding current date (now-cell [\(nowColumn),\(nowRow)])")
    
    if !reloadedFromHourTickingOver {
        if nowRow == timetableLayout.lockedHeaderRows && nowColumn == timetableLayout.lockedHeaderSections {  /// if the now-cell is at Monday, 12am
            
            lastLoginDateComponents = [year, month, day, weekday, hour, minute]
            lastLoginDate = dateFromComponents(lastLoginDateComponents)
            print("new week\n") ///pryntLastLoginDate(); pryntCurrentDate()
        }
        else {print("new hour\n")}
        reloadedFromHourTickingOver = true
    }
}

extension CollectionVC {
    
    func periodicDateRefresh(completion: () -> ()) {            //print("·", terminator: "")
        
        if "\(Date())".contains(":59:5") {                      //print("DATE: \(Date())")
            reloadedFromHourTickingOver = false
        }
        
        if "\(Date())".contains(":00:") {
            if !reloadedFromHourTickingOver {
                
                cachedBlocksAndTheirPaths = false
                searchForDST()
                
                DispatchQueue.main.asyncAfter(deadline: .now()) { /// keep on main queue: periodic callback inside completion handler called on a background thread
                    topVC.reloadCV()
                }
                pryntLastLoginDate(); pryntCurrentDate()
            }
        }
        completion()
    }
    
    func kickoffTimer() {
        DispatchQueue.global(qos: .userInteractive).asyncAfter(deadline: .now() + 3) { [weak self] in
            self?.periodicDateRefresh(){self!.kickoffTimer()}
        }
    }
}

