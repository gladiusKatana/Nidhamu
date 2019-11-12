// DateRefresh      ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

func processCurrentDate() {
    
    let (year, _, month, _ , day, weekday, _, hour, minute, _) = getChosenDateComponents(Date(), roundedDown: true)
    
    nowRow = Calendar.current.component(.hour, from: Date()) + timetableLayout.lockedHeaderRows                 /// for 'nowCell': tabular position of current date
    nowColumn = fullWeekdaysDisplayedOrder.firstIndex(of: weekday)! + timetableLayout.lockedHeaderSections
    
    ///print(formattedDateString(Date(), comment: "process dates @ ", short: false))    //; print("nowCell \([nowColumn, nowRow])")
    
    if !reloadedFromHourTickingOver {
        if nowRow == timetableLayout.lockedHeaderRows && nowColumn == timetableLayout.lockedHeaderSections {    /// if the now-cell is at Monday, 12am
            
            print("new week")
            
            lastLoginDateComponents = [year, month, day, weekday, hour, minute]
            lastLoginDate = dateFromComponents(lastLoginDateComponents)
            
            //pryntLastLoginDate(); pryntCurrentDate()
        }
        else {print("new hour")}
        reloadedFromHourTickingOver = true
    }
}

extension CollectionVC {
    
    func periodicDateRefresh(completion: () -> ()) {                                                            //print("·", terminator: "")
        
        if "\(Date())".contains(":59:5") {      print("DATE: \(Date())")
            reloadedFromHourTickingOver = false
        }
        
        if "\(Date())".contains(":00:") {
            if !reloadedFromHourTickingOver {
                
                cachedBlocksAndTheirPaths = false
                
                let cellDateString = formattedDateString(Date(), roundedDown: true,
                                                         showYear: false, prefix: "", suffix: "", dateFormat: .fullDayWithYear)
                let fallBackDateString = formattedDateString(fallBackDate, roundedDown: true,
                                                             showYear: false, prefix: "", suffix: "", dateFormat: .fullDayWithYear)
                
                if cellDateString == fallBackDateString {   ///if viewControllerType == .timetable {}
                    
                    if nowRow == 6 {
//                        fellBack = true
                        foundNextFallBackDate = false
                        findDSTDates(startingDate: Date() + TimeInterval(3600 * 24)) /// find the next fall-back date, start search 1 day from last fall-back date
                        
//                        dstCancelor = 1
                        ///lastLoginDate = Date()
                    }
                }
//                else {
//                    fellBack = false
//                }
                
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

