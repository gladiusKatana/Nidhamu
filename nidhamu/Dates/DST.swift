// DST              ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit


///Note, the 'spring-forward time block' and the 'fall-back time block' are the time blocks which, when they *end* (ie, clock rolls over from :59 -> :00, either while app is in foreground or background),
///cause the setting forward or backward of clocks.  Therefore, these time blocks' dates may *seem* to differ from the daylight savings time you look up online (eg, https://www.timeanddate.com/time/change/canada?year=2020) , since these are the hours in which the time-changes occur, at the *start* of the hour.

func findFallbackDate(startingDate: Date, setting: Bool) {
    
    let startDate = truncateMinutesOf(startingDate) ///print("start date \(formattedDateString(startDate, roundedDown: false, showYear: true, prefix: "", suffix: "", dateFormat: .fullDay))")
    var testDate = startDate
    
    for _ in (0 ... 380 * 24) { /// 380 = 365 + margin of 15 to account for variance in fall-back date, year-to-year. No harm in overshooting, unless it were *all the way* to next fall-back
        
        let tz = NSTimeZone.local
        let oneHourAfterTestDate = testDate + TimeInterval(3600)
        
        if tz.isDaylightSavingTime(for: testDate)
            && !(tz.isDaylightSavingTime(for: oneHourAfterTestDate)) {
            
            if !foundNextFallBackDate {
                if setting {fallBackDate = testDate}
                print("next fall-back day: \(formattedDateString(testDate, roundedDown: false, showYear: true, prefix: "", suffix: "", dateFormat: .fullDayWithYear))") //; setting? \(setting)
                foundNextFallBackDate = true
            }
        }
        
        testDate += TimeInterval(3600)
    }
}

func findSpringForwardDate(startingDate: Date, setting: Bool) {
    
    let startDate = truncateMinutesOf(startingDate) ///print("start date \(formattedDateString(startDate, roundedDown: false, showYear: true, prefix: "", suffix: "", dateFormat: .fullDay))")
    var testDate = startDate
    
    for _ in (0 ... 400 * 24) { /// 380 = 365 + margin of 15 to account for variance in fall-back date, year-to-year. No harm in overshooting, unless it were *all the way* to next fall-back
        
        let tz = NSTimeZone.local
        let oneHourAfterTestDate = testDate + TimeInterval(3600)
        
        if !(tz.isDaylightSavingTime(for: testDate))
            && tz.isDaylightSavingTime(for: oneHourAfterTestDate) {
            
            if !foundNextSpringForwardDate {
                if setting {springForwardDate = testDate}
                print("next spring-forward day: \(formattedDateString(testDate, roundedDown: false, showYear: true, prefix: "", suffix: "\n", dateFormat: .fullDayWithYear))") //; setting? \(setting)
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

func dstMarker(_ date: Date) -> String { /// creates a string notifying whether input date is a daylight-savings date (correct to 1 hr, which is time block size)
    let fbk = (truncateMinutesOf(date) == truncateMinutesOf(fallBackDate)) ? "(fall-back)" : ""
    let spf = (truncateMinutesOf(date) == truncateMinutesOf(springForwardDate)) ? "(spring-forward)" : ""
    return "\(fbk)\(spf)"
}

