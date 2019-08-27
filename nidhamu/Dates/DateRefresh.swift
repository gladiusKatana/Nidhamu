// DateRefresh      ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

func processCurrentDate() {                                                                             print("processing current date")
    (year, month, day, weekday, weekdayLong, hour, minute) = displayDate(Date(), roundedDown: true)
    
    //print(formattedDateString(Date(), comment: "process dates @ ", short: false))
    
    nowRow = Calendar.current.component(.hour, from: Date()) + timetableLayout.lockedHeaderRows
    nowColumn = weekdaysAbbreviated.firstIndex(of: weekday)! + timetableLayout.lockedHeaderSections;    //print("nowCell: \([nowColumn, nowRow])")
    
    if !reloadedFromHourTickingOver {
        if nowRow == timetableLayout.lockedHeaderRows && nowColumn == timetableLayout.lockedHeaderSections {
            
            print("new week")
            
            lastLoginDateComponents = [year, month, day, weekday, hour, minute]
            lastLoggedInDate = dateFromComponents(lastLoginDateComponents)
            //pryntLastLoginDate()
            //pryntCurrentDate()
        }
        else {print("new hour")}
        
        reloadedFromHourTickingOver = true
    }
}

extension CollectionVC {
    
    func periodicDateRefresh(completion: () -> ()) {                                                    //print("·", terminator: "")
        
        if "\(Date())".contains(":59:5") {
            reloadedFromHourTickingOver = false
        }
        
        if "\(Date())".contains(":00:") {
            if !reloadedFromHourTickingOver {
                DispatchQueue.main.asyncAfter(deadline: .now()) { [weak self] in
                    self?.reloadCV()
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

