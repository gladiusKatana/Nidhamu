// DateStrings      ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

func displayDate(_ inputDate: Date, roundedDown: Bool)
    
    -> (Int, String, String, Int, String, String, Int, Int) {
        
        let year = Calendar.current.component(.year, from: inputDate)
        
        let month = months[Calendar.current.component(.month, from: inputDate) - 1]
        let mnth = monthsAbbreviated[Calendar.current.component(.month, from: inputDate) - 1]
        
        let day = Calendar.current.component(.day, from: inputDate)
        
        let weekday = fullWeekdaysDefaultOrder[Calendar.current.component(.weekday, from: inputDate) - 1]
        let wkdy = customWkdysDefaultOrder[Calendar.current.component(.weekday, from: inputDate) - 1] //wkdysDefaultOrder[
        
        let hour = Calendar.current.component(.hour, from: inputDate)
        
        var minute : Int
        if roundedDown {
            minute = 0
        } else {
            minute = Calendar.current.component(.minute, from: inputDate)
        }
        
        //let second = Calendar.current.component(.second, from: inputDate)
        
        return (year, month, mnth, day, weekday, wkdy, hour, minute)      /// MAY CRASH IF DEVICE  NOT  ON 24HR TIME (seems bug is gone; will double check)
}

