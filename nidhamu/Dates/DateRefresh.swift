// DateRefresh      ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension CustomFlowLayout {
    
    func processCurrentDate() { // only called by prepare()
        let (year, month, _ , day, weekday, _, hour, minute) = displayDate(Date(), roundedDown: true)
        //print(formattedDateString(Date(), comment: "process dates @ ", short: false))
        
        nowRow = Calendar.current.component(.hour, from: Date()) + timetableLayout.lockedHeaderRows//for 'nowDate': tabular representation of now
        nowColumn = headerWeekdayTitles.firstIndex(of: String(weekday.prefix(3)))! + timetableLayout.lockedHeaderSections
        //; print("nowCell \([nowColumn, nowRow])")
        
        if !reloadedFromHourTickingOver {
            if nowRow == timetableLayout.lockedHeaderRows && nowColumn == timetableLayout.lockedHeaderSections {
                
                print("new week")
                
                lastLoginDateComponents = [year, month, day, weekday, hour, minute]
                lastLoginDate = dateFromComponents(lastLoginDateComponents)
                //pryntLastLoginDate()
                //pryntCurrentDate()
            }
            else {print("new hour")}
            reloadedFromHourTickingOver = true
        }
    }
}

extension CollectionVC {
    
    func periodicDateRefresh(completion: () -> ()) {                                                 //print("·", terminator: "")
        
        if "\(Date())".contains(":59:5") {
            reloadedFromHourTickingOver = false
        }
        
        if "\(Date())".contains(":00:") {
            if !reloadedFromHourTickingOver {
                
                DispatchQueue.main.asyncAfter(deadline: .now()) {
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

