// DateStrings      ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

func getChosenDateComponents(_ inputDate: Date, roundedDown: Bool)
    
    -> (Int, Int, String, String, Int, String, String, Int, Int, Int) {
        
        let year = Calendar.current.component(.year, from: inputDate)
        
        let monthInt = Calendar.current.component(.month, from: inputDate)
        
        let month = months[monthInt - 1]
        let mnth = monthsAbbreviated[monthInt - 1]
        
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
        
        let second = Calendar.current.component(.second, from: inputDate)
        
        return (year, monthInt, month, mnth, day, weekday, wkdy, hour, minute, second)  /// MAY CRASH IF DEVICE  NOT  ON 24HR TIME (double check bug is gone;)
}

