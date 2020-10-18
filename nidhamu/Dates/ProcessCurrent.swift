// ProcessCurrent   ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

func processCurrentDate() {
    let (year, _, month, _ , day, weekday, _, hour, minute, _) = getChosenDateComponents(Date(), roundedDown: true)
    let timeOfDay = Calendar.current.component(.hour, from: Date()) / timeBlockSize
    
    nowRow = timeOfDay + timetableLayout.lockedHeaderRows /// for 'nowCell': tabular position of current date
    nowColumn = fullWeekdaysDisplayedOrder.firstIndex(of: weekday)! + timetableLayout.lockedHeaderSections
    //print("finding current date (now-cell [\(nowColumn),\(nowRow)])")
    
    if !reloadedFromHourTickingOver {
        if nowRow == timetableLayout.lockedHeaderRows && nowColumn == timetableLayout.lockedHeaderSections { /// if the now-cell is at Monday, 12am
            lastLoginDateComponents = [year, month, day, weekday, hour, minute]
            lastLoginDate = dateFromComponents(lastLoginDateComponents)
            //print("new week") ///pryntLastLoginDate(); pryntCurrentDate()
        } //else {print("\nnew minute")}
        reloadedFromHourTickingOver = true
    }
}

