// DateData         ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

func dateFromComponents(_ array: [Any]) -> Date {
    let yearLoaded = array[0] as! Int                               //; print("year loaded: \(yearLoaded)")     // will probably replace with...
    let monthLoaded = array[1] as! String                           //; print("month loaded: \(monthLoaded)")   //... conditional downcasts,...
    let monthLoadedInt = months.firstIndex(of: monthLoaded)! + 1    //; print("int: \(monthLoadedInt)")         //...rather than forced downcasts,
    let dayLoaded = array[2] as! Int                                //; print("day loaded: \(dayLoaded)")       //...for all bindings here
    //let weekdayLoaded = array[3] as! String                       //; print("weekday loaded: \(weekdayLoaded)")
    let hourLoaded = array[4] as! Int                               //; print("hour loaded: \(hourLoaded)")
    let minuteLoaded = array[5] as! Int                             //; print("minute loaded: \(minuteLoaded)")
    
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy/MM/dd HH:mm"
    
    guard let date = formatter.date(from: "\(yearLoaded)/\(monthLoadedInt)/\(dayLoaded) \(hourLoaded):\(minuteLoaded)") else {
        print("could not create date with loaded input, returning current date instead")
        return Date()
    }
    
    return date
}


func truncateMinutesOfDate(_ inputDate: Date) -> Date {
    //let hr = Calendar.current.component(.hour, from: inputDate)
    let mn = 0
    let (yr, mnth, day, _, _, hr, _) = displayDate(inputDate, roundedDown: false)
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy/MM/dd HH:mm"
    
    guard let date = formatter.date(from: "\(yr)/\(mnth)/\(day) \(hr):\(mn)") else {
        print("could not create truncated date with input, returning current date instead")
        return Date()
    }
    
    return date
}


func formatDatesFromComponentsArray(_ cells: [[[Any]]]) -> [[String]] {
    var formattedDatesArrays = [[String]]()
    
    for timeBlock in cells {
        var timeBlockDateStrings = [String]()
        
        for eventDateComponents in timeBlock {
            let date = dateFromComponents(eventDateComponents)
            let dateString = formattedDateString(date, roundedDown: true, prefix: "", suffix: " ", short: false)//2nd space to match default left one
            timeBlockDateStrings.append(dateString)
        }
        formattedDatesArrays.append(timeBlockDateStrings)
    }
    
    return formattedDatesArrays
}
