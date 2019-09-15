// TimeVars         ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

var lastLoggedInDate = Date()
var selectedCellDate = Date()

var lastLoginDateComponents = [Int(), String(), Int(), String(), String(), Int(), Int()] as [Any]

//--------------------------------------------------------------------
var eventsAtIndexPath = Dictionary<TimeBlock<Int,Int>,[SimpleEvent]>();                         var sortingTransform = [Int]()

var timeBlock = TimeBlock(values:(0, 0))

var eventArraysToProcess = [[SimpleEvent]]()

var pathsToProcess = [[Int]]();                                                                 //var sortedPathsToProcess = [[Int]]()

var timeBlockPaths = [[Int]]();                                                                  var sortedTimeBlockPaths = [[Int]]()

var eventDateArrays = [[[Int(), String(), Int(), String(), String(), Int(), Int()] as [Any]]];  //var sortedEventDateArrays = [Any]()

var eventDescriptionArrays = [[String]]();                                                      //var sortedEventDescriptionArrays = [Any]()
var eventStatusArrays = [[Int]](); /* Populated with raw values of enum EventStatus*/           //var sortedEventStatusArrays = [Any]()
//--------------------------------------------------------------------

var timerForShowScrollIndicator: Timer?

var defaultPathOutOfView = [-3, -3]
var selectedTimeBlockPath = defaultPathOutOfView;   var previousSelectedTimeBlockPath = defaultPathOutOfView

var nowRow = 0;                                     var nowColumn = 0
var eventIndex = 0;                                 var eventsInBlockToBeProcessed = 0

var reloadedFromHourTickingOver = true;             var rotatedFromResignActive = false
var textFieldDisplayed = false;                     var textFieldFirstDisplayed = false
var savedTimeBlocksForProcessing = false;           var classifierViewDisplayed = false

var eventWillBeRecurring = false

var selectedTimeBlockDateDescription = "(selected date)"

var globalEventIdentifier = "(event)";              var defaultEmptyEventDescription = "❒"

var months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
var monthsAbbreviated = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "July", "Aug", "Sept", "Oct", "Nov", "Dec"]

var headerWeekdayTitles = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]
var wkdysDefaultOrder = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
var customWkdysDefaultOrder = ["Sun", "Mon", "Tues", "Wed", "Thurs", "Fri", "Sat"]
var fullWeekdaysDefaultOrder = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]

var amPmHours = ["12", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11"]
//var militaryHours = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23"]

