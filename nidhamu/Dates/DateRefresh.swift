// DateRefresh      ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

func processCurrentDate() {
    
    let (year, _, month, _ , day, weekday, _, hour, minute, _) = getChosenDateComponents(Date(), roundedDown: true)
    
    nowRow = Calendar.current.component(.hour, from: Date()) + timetableLayout.lockedHeaderRows                 /// for 'nowCell': tabular position of current date
    nowColumn = fullWeekdaysDisplayedOrder.firstIndex(of: weekday)! + timetableLayout.lockedHeaderSections
    
    ///print(formattedDateString(Date(), comment: "process dates @ ", short: false))   ///print("finding current date (now-cell [\(nowColumn),\(nowRow)])")
    
    if !reloadedFromHourTickingOver {
        if nowRow == timetableLayout.lockedHeaderRows && nowColumn == timetableLayout.lockedHeaderSections {    /// if the now-cell is at Monday, 12am
            
            lastLoginDateComponents = [year, month, day, weekday, hour, minute]
            lastLoginDate = dateFromComponents(lastLoginDateComponents)
            print("new week\n") ///pryntLastLoginDate(); pryntCurrentDate()
        }
        else {print("new hour\n")}
        reloadedFromHourTickingOver = true
    }
}

extension CollectionVC {
    
    func periodicDateRefresh(completion: () -> ()) {                            //print("·", terminator: "")
        
        if "\(Date())".contains(":59:5") {                                      //print("DATE: \(Date())")
            reloadedFromHourTickingOver = false
        }
        
        if "\(Date())".contains(":00:") {
            if !reloadedFromHourTickingOver {
                
                cachedBlocksAndTheirPaths = false
                
                let dateString = formattedDateString(Date(), roundedDown: true,
                                                     showYear: true, prefix: "", suffix: "", dateFormat: .fullDayWithYear)
                let fallBackDateString = formattedDateString(fallBackDate, roundedDown: true,
                                                             showYear: true, prefix: "", suffix: "", dateFormat: .fullDayWithYear)
                let springForwardDateString = formattedDateString(springForwardDate + TimeInterval(3600), roundedDown: true,
                                                             showYear: true, prefix: "", suffix: "", dateFormat: .fullDayWithYear)
                
                if dateString == fallBackDateString || dateString == springForwardDateString {
                    foundNextFallBackDate = false; foundNextSpringForwardDate = false
                    findFallbackDate(startingDate: Date(), setting: true)
                    findSpringForwardDate(startingDate: Date(), setting: true)
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now()) { /// must be on main queue: periodic callback inside the completion handler, is called on a background thread
                    topVC.reloadCV()
                }
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

