// TimeVars         ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

var lastLoginDate = Date()
var selectedCellDate = Date()

var lastLoginDateComponents = [Int(), String(), Int(), String(), String(), Int(), Int()] as [Any]

var nowRow = 0;                                     var nowColumn = 0
var taskIndex = 0;                                  var tasksInBlockToBeProcessed = 0


var globalTaskIdentifier = "(task)";                var selectedTimeBlockDateDescription = "(selected date)"
           

var months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
var monthsAbbreviated = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "July", "Aug", "Sept", "Oct", "Nov", "Dec"]

var headerWeekdayTitles = ["Mon", "Tues", "Wed", "Thu", "Fri", "Sat", "Sun"] //["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]
var customWkdysDefaultOrder = ["Sun", "Mon", "Tues", "Wed", "Thurs", "Fri", "Sat"]

var fullWeekdaysDefaultOrder = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
var fullWeekdaysDisplayedOrder = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
///var wkdysDefaultOrder = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]

var amPmHours = ["12", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11"]
///var militaryHours = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23"]

