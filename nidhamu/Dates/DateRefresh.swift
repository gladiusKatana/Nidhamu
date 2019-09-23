// DateRefresh      ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

func processCurrentDate() {
    
    let (year, month, _ , day, weekday, _, hour, minute) = displayDate(Date(), roundedDown: true)
    nowRow = Calendar.current.component(.hour, from: Date()) + timetableLayout.lockedHeaderRows     /// for 'nowDate', a tabular representation of current date
    nowColumn = fullWeekdaysDefaultOrder.firstIndex(of: weekday)! + timetableLayout.lockedHeaderSections
    ///print(formattedDateString(Date(), comment: "process dates @ ", short: false))    //; print("nowCell \([nowColumn, nowRow])")
    
    if !reloadedFromHourTickingOver {
        if nowRow == timetableLayout.lockedHeaderRows && nowColumn == timetableLayout.lockedHeaderSections {
            
            print("new week")
            
            lastLoginDateComponents = [year, month, day, weekday, hour, minute]
            lastLoginDate = dateFromComponents(lastLoginDateComponents)
            
            //pryntLastLoginDate()                                  // ! maybe not just print, but save/load with prints////////////////
            //pryntCurrentDate()
        }
        else {print("new hour")}
        reloadedFromHourTickingOver = true
    }
}

extension CollectionVC {
    
    func periodicDateRefresh(completion: () -> ()) {                                                 //print("·", terminator: "")
        
        if "\(Date())".contains(":59:5") {reloadedFromHourTickingOver = false}
        
        if "\(Date())".contains(":00:") {
            if !reloadedFromHourTickingOver {
                
                DispatchQueue.main.asyncAfter(deadline: .now()) {
                    topVC.reloadCV()                                    // ! maybe save/load with prints////////////////////////////////////
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

