// Dates            ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

func dateFromComponents(_ array: [Any]) -> Date { /// Note, weekday is not needed to create a Date; it's 'along for the ride' , somewhat, and used for prints, eg in pryntLastLoginDate()
    
    let yearLoaded = array[0] as! Int                               //; print("year loaded: \(yearLoaded)")     // will probably replace with...
    let monthLoaded = array[1] as! String                           //; print("month loaded: \(monthLoaded)")   //... conditional downcasts,...
    let monthLoadedInt = months.firstIndex(of: monthLoaded)! + 1    //; print("int: \(monthLoadedInt)")         //...rather than forced ones,...
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


func truncateMinutesOf(_ inputDate: Date) -> Date {
    
    let mn = 0
    
    let (year, _, month, _ , day, _, _, hour, _, _) = getChosenDateComponents(inputDate, roundedDown: false)
    
    let formatter = DateFormatter();    formatter.dateFormat = "yyyy/MM/dd HH:mm"
    
    guard let date = formatter.date(from: "\(year)/\(month)/\(day) \(hour):\(mn)") else {
        print("could not create truncated date with input, returning current date instead")
        return Date()
    }
    
    return date
}

