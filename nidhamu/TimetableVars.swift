// TimetableVars    ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit


var lastLoggedInDate = Date()
var selectedCellDate = Date()

var lastLoginDateComponents = [Int(), String(), Int(), String(), String(), Int(), Int()] as [Any]

var (year, month, day, weekday, weekdayLong, hour, minute) = (Int(), String(), Int(), String(), String(), Int(), Int())

//* Convention: reserving full-spelled date-component names for CURRENT date (Date(), ie RIGHT NOW; NOW is correct to within a 3s refresh period)

//--------------------------------------------------------------------
var eventsAtIndexPath = Dictionary<TimeBlock<Int,Int>,[SimpleEvent]>()

var timeBlock = TimeBlock(values:(0, 0))

var eventArraysToProcess = [[SimpleEvent]]();       var pathsToProcess = [[Int]]()

var eventStatusArrays = [[Int]]()   //* Populated with raw values of enum EventStatus
var eventPathArrays = [[Int]]()
var eventDescriptionArrays = [[String]]()
var eventDateArrays = [[[Int(), String(), Int(), String(), String(), Int(), Int()] as [Any]]] // or  [[[0, "", 0, "", 0, 0] as [Any]]]
//--------------------------------------------------------------------


var timerForShowScrollIndicator: Timer?

var defaultPathOffOfView = [-3, -3];
var selectedTimeBlockPath = defaultPathOffOfView;   var previousSelectedTimeBlockPath = [0, 0]

var nowRow = 0;                                     var nowColumn = 0
var eventIndex = 0;                                 var eventsInBlockToBeProcessed = 0

var reloadedFromHourTickingOver = true;             var textFieldDisplayed = false
var savedTimeBlocksForProcessing = false;           var classifierViewDisplayed = false

var globalEventIdentifier = "(event)";              var defaultEmptyEventDescription = "❒"

var months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
var monthsAbbreviated = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "July", "Aug", "Sept", "Oct", "Nov", "Dec"]

var weekdaysAbbreviated = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]
var wkdysDefaultOrder = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
var fullWeekdaysDefaultOrder = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]

var hoursOfTheDay = ["12", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11"]
//var militaryDayHours = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23"]

