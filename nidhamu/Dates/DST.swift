// DST              ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

func findDSTDates(startingDate: Date, setting: Bool) {
    
    let startDate = truncateMinutesOf(startingDate) ///print("start date \(formattedDateString(startDate, roundedDown: false, showYear: true, prefix: "", suffix: "", dateFormat: .fullDay))")
    var testDate = startDate
    
    for _ in (0 ... 380 * 24) { /// 380 = 365 + margin of 15 to account for variance in fall-back date, year-to-year. No harm in overshooting, unless it were *all the way* to next fall-back
        
        let tz = NSTimeZone.local
        let oneHourAfterTestDate = testDate + TimeInterval(3600)
        
        if tz.isDaylightSavingTime(for: testDate)
            && !(tz.isDaylightSavingTime(for: oneHourAfterTestDate)) {
            
            if !foundNextFallBackDate {
                if setting {fallBackDate = testDate}
                print("next fall-back day: \(formattedDateString(testDate, roundedDown: false, showYear: true, prefix: "", suffix: "\n", dateFormat: .fullDayWithYear))") //; setting? \(setting)
                foundNextFallBackDate = true
            }
        }
        
        if !(tz.isDaylightSavingTime(for: testDate))
            && tz.isDaylightSavingTime(for: oneHourAfterTestDate) {
            
            if !foundNextSpringForwardDate {
                if setting {springForwardDate = testDate}
                ///print("next spring-forward day: \(formattedDateString(testDate, roundedDown: false, showYear: true, prefix: "", suffix: "\n", dateFormat: .fullDayWithYear))") //; setting? \(setting)
                foundNextSpringForwardDate = true
            }
        }
        
        testDate += TimeInterval(3600)
    }
}

func hoursSince(_ startDate: Date, testDate: Date) -> Int {
    var truncStartDate = truncateMinutesOf(startDate)
    let truncTestDate = truncateMinutesOf(testDate)
    var hours = 0
    
    while truncStartDate < truncTestDate {
        truncStartDate += TimeInterval(3600)
        hours += 1
    }
    
    while truncTestDate < truncStartDate - TimeInterval(3600) {
        truncStartDate -= TimeInterval(3600)
        hours -= 1
    }
    return hours
}

func notifyIfDateIsDST(_ date: Date) -> String { /// creates a string notifying whether input date is a daylight-savings date (correct to 1 hr, which is time block size)
    let fbk = (truncateMinutesOf(date) == truncateMinutesOf(fallBackDate)) ? "(dst:fall-back)" : ""
    let spf = (truncateMinutesOf(date) == truncateMinutesOf(springForwardDate)) ? "(dst:spring-forward)" : ""
    return "\(fbk)\(spf)"
}

