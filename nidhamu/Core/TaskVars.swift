// TaskData         ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit


var taskIndex = 0;                      var tasksInBlockToBeProcessed = 0

var globalTaskIdentifier = "Task";      var defaultTaskIdentifier = "Task"

var tasksAtIndexPath = Dictionary<TimeBlock<Int,Int>,[SimpleTask]>() /// Dictionary lookup for arrays of tasks, keyed by index path of collection view

///var tasksAtDate = Dictionary<ArchiveBlock<Int,Int,Int,Int>,[SimpleTask]>() /// Dict. lookup for arrays of archived tasks, keyed by task-date components (y,m,d,h)

///adding tasks to time-blocks (ie cells, visually speaking) --------------------------------------------------------------------
var timeBlock = TimeBlock(values:(0, 0))
var defaultPathOutOfView = [-1, -1];                var earliestTaskAddress = defaultPathOutOfView
var selectedTimeBlockPath = defaultPathOutOfView;   var previousTimeBlockPathSelected = defaultPathOutOfView    /// for animations: see Tap.swift


///processing time blocks for tagging -------------------------------------------------------------------------------------------
var taskArraysToProcess = [[SimpleTask]]();         var taskDescriptionsToProcess = [[String]]()
var indexPathsToProcess = [[Int]]()

///deferring tasks --------------------------------------------------------------------------------------------------------------
var deferralPath = [Int]();                         var deferredDescription = ""


///deleting tasks (not to be confused with classifying the actions done on them as .deleted)
var taskIsDeletable = false

///saving tasks' components via separate UserDefaults arrays ---------------------------------------------------------------------
///* will rewrite this construct to save the whole dictionary to NSUserDefaults
var timeBlockPaths = [[Int]]() /// index paths where tasks were added & saved
var sortedTimeBlockPaths = [[Int]]();               var sortingTransform = [Int]()

var taskDeadlineArrays = [[[Int(), String(), Int(), String(), String(), Int(), Int()] as [Any]]]
var taskDescriptionArrays = [[String]]()
var taskStatusArrays = [[Int]]() /// populated with raw values of enum TaskStatus*/

///saving ARCHIVED tasks' components via separate UserDefaults arrays -------------------------------------------------------------
///* will rewrite this construct to save the whole dictionary to NSUserDefaults
var archiveTasks = [SimpleTask]()
var archiveTaskDescriptions = [String]()
var archiveTaskStatuses = [Int]();                  var archiveTaskStatusStrings = [String]()
var archiveTaskDateComponentArrays = [[Int]]();     var archiveTaskDateStrings = [String]()

