// TimeVars         ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit


var lastLoginDateComponents = [Int(), String(), Int(), String(), String(), Int(), Int()] as [Any]




var lastLoginDate = Date()
var selectedCellDate = Date()

var springForwardDate = makeDateFrom(year: 1970, month: 1, day: 1, hr: 1, min: 1, sec: 1)   /// so timeIntervalSince1970 = 0
var fallBackDate = makeDateFrom(year: 1970, month: 1, day: 1, hr: 1, min: 1, sec: 1)        /// ""




var nowRow = 0;                                 var nowColumn = 0

var dstNotificationCellPath = (0, 1)

var dstOffset = 0.0




var foundNextFallBackDate = false
var foundNextSpringForwardDate = false




var selectedTimeBlockDateDescription = "(selected date)"

var months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
var monthsAbbreviated = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "July", "Aug", "Sept", "Oct", "Nov", "Dec"]

var headerWeekdayTitles = ["Mon", "Tues", "Wed", "Thu", "Fri", "Sat", "Sun"] //["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]
var customWkdysDefaultOrder = ["Sun", "Mon", "Tues", "Wed", "Thurs", "Fri", "Sat"]

var fullWeekdaysDefaultOrder = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
var fullWeekdaysDisplayedOrder = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]

var amPmHours = ["12", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11"]

