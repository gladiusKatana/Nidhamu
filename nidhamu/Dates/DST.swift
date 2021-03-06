// DST              ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

func searchForDST() {
    let dateString = formattedDateString(Date(), roundDown: true,
                                         showYear: true, prefix: "", suffix: "", dateFormat: .fullDayWithYear)
    let fallBackDateString = formattedDateString(fallBackDate, roundDown: true,
                                                 showYear: true, prefix: "", suffix: "", dateFormat: .fullDayWithYear)
    let springForwardDateString = formattedDateString(springForwardDate + TimeInterval(3600), roundDown: true,
                                                      showYear: true, prefix: "", suffix: "", dateFormat: .fullDayWithYear)
    
    if dateString == fallBackDateString || dateString == springForwardDateString {      //print("\nDST\n")
        foundNextFallBackDate = false; foundNextSpringForwardDate = false
        findFallbackDate(startingDate: Date(), printDSTDates: showDSTDates)
        findSpringForwardDate(startingDate: Date(), printDSTDates: showDSTDates)
    }
}

/// Note, the 'spring-forward time block' & 'fall-back time block' are the time blocks which, when they END (*),
/// cause the setting forward or backward of clocks.  Therefore, these time blocks' dates may *seem* different from the daylight savings time you look up online
/// (eg, https://www.timeanddate.com/time/change/canada?year=2020), since those are the hours in which the time-changes occur at the *start* of the hour.
/// (*)  ie, clock rolls over from :59 -> :00 either while app is in foreground or background*

func findFallbackDate(startingDate: Date, printDSTDates: Bool) {
    
    let startDate = truncateMins(startingDate)
    ///print("start date \(formattedDateString(startDate, roundedDown: false, showYear: true, prefix: "", suffix: "", dateFormat: .fullDay))")
    var testDate = startDate
    
    for _ in (0 ... 380 * 24) {
        /// 380 = 365 + margin to account for variance in fall-back date, year-to-year. No harm in overshooting, unless it were *all the way* to next fall-back (and there is no accumulation)
        
        let tz = NSTimeZone.local
        let oneHourAfterTestDate = testDate + TimeInterval(3600)
        
        if tz.isDaylightSavingTime(for: testDate)
            && !(tz.isDaylightSavingTime(for: oneHourAfterTestDate)) {
            
            if !foundNextFallBackDate {
                fallBackDate = testDate
                if printDSTDates {print("next fall-back day: \(formattedDateString(testDate, roundDown: false, showYear: true, prefix: "", suffix: "", dateFormat: .fullDayWithYear))")}
                foundNextFallBackDate = true
            }
        }
        testDate += TimeInterval(3600)
    }
}

func findSpringForwardDate(startingDate: Date, printDSTDates: Bool) {
    
    let startDate = truncateMins(startingDate)
    ///print("start date \(formattedDateString(startDate, roundedDown: false, showYear: true, prefix: "", suffix: "", dateFormat: .fullDay))")
    var testDate = startDate
    
    for _ in (0 ... 400 * 24) { /// see comment after similar for-loop in findFallbackDate(:)
        
        let tz = NSTimeZone.local
        let oneHourAfterTestDate = testDate + TimeInterval(3600)
        
        if !(tz.isDaylightSavingTime(for: testDate))
            && tz.isDaylightSavingTime(for: oneHourAfterTestDate) {
            
            if !foundNextSpringForwardDate {
                springForwardDate = testDate
                if printDSTDates {print("next spring-forward day: \(formattedDateString(testDate, roundDown: false, showYear: true, prefix: "", suffix: "\n", dateFormat: .fullDayWithYear))")}
                foundNextSpringForwardDate = true
            }
        }
        testDate += TimeInterval(3600)
    }
}

// DST-related prynts: (yes that's spelled with a y on purpose)

func dstMarkerForConsole(_ date: Date) -> String { /// creates a string notifying whether input date is a DST date (correct to 1 hr, which is time block size)
    let fbk = (truncateMins(date) == truncateMins(fallBackDate)) ? "(fall-back)" : ""
    let spf = (truncateMins(date) == truncateMins(springForwardDate)) ? "(spring-forward)" : ""
    return "\(fbk)\(spf)"
}

