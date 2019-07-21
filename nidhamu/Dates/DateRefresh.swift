// DateRefresh      ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

func processCurrentDate() {
    (year, month, day, weekday, weekdayLong, hour, minute) = displayDate(Date(), roundedDown: true)
    //; print(formattedDateString(Date(), comment: "process dates @ ", short: false))
    
    nowRow = Calendar.current.component(.hour, from: Date()) + 1
    nowColumn = weekdaysAbbreviated.firstIndex(of: weekday)! + 1
    
//    if selectedTimeBlockPath == [0, 0] {selectedTimeBlockPath = [nowColumn, nowRow]}
//    if timeBlock == TimeBlock(values:(0, 0)) {timeBlock = TimeBlock(values:(nowColumn, nowRow))}
//    
//    if previousSelectedTimeBlockPath == [0, 0] {previousSelectedTimeBlockPath = [nowColumn, nowRow]}
//    if previousTimeBlock == TimeBlock(values:(0, 0)) {previousTimeBlock = TimeBlock(values:(nowColumn, nowRow))}
}

extension CollectionVC {
    
    func periodicDateRefresh(completion: () -> ()) {                                            //print("·")
        if "\(Date())".contains(":00:") {                                                       //print("the hour ticked over")
            if nowRow == timetableLayout.rows - 1 && nowColumn == timetableLayout.cols - 1 {    //print("the week just rolled over")
                lastLoginDateComponents = [year, month, day, weekday, hour, minute]
                lastLoggedInDate = dateFromComponents(lastLoginDateComponents)
                pryntLastLoginDate()
                pryntCurrentDate()
            }
            if !reloadedFromHourTickingOver {
                DispatchQueue.main.asyncAfter(deadline: .now()) { [weak self] in
                    self?.reloadCV()
                }
                reloadedFromHourTickingOver = true
            }
            else {
                reloadedFromHourTickingOver = false
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

