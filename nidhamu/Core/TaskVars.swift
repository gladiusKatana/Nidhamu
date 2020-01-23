// TaskData         ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit


var taskIndex = 0;                      var tasksInBlockToBeProcessed = 0

var defaultTaskIdentifier = "Task"
var globalTaskIdentifier = "Task"

var tasksAtIndexPath = Dictionary<TimeBlock<Int,Int>,[SimpleTask]>()      /// Dictionary lookup for arrays of tasks (ie to-do-lists), keyed by index path of collection view

///var tasksAtDate = Dictionary<ArchiveBlock<Int,Int,Int,Int>,[SimpleTask]>()                 /// Dictionary lookup for arrays of archived tasks, keyed by task-date components (y,m,d,h)



// Adding tasks to time-blocks (ie cells, visually speaking) --------------------------------------------------------------------
var timeBlock = TimeBlock(values:(0, 0))
var defaultPathOutOfView = [-1, -1];                var earliestTaskAddress = defaultPathOutOfView
var selectedTimeBlockPath = defaultPathOutOfView;   var previousTimeBlockPathSelected = defaultPathOutOfView /// for animations: see Tap.swift



// Processing time blocks for tagging -------------------------------------------------------------------------------------------
var taskArraysToProcess = [[SimpleTask]]();         var taskDescriptionsToProcess = [[String]]()
var indexPathsToProcess = [[Int]]()



// Deferring tasks --------------------------------------------------------------------------------------------------------------
var deferralPath = [Int]();                         var deferredDescription = ""




// Saving time blocks' components via separate UserDefaults arrays --------------------------------------------------------------
var timeBlockPaths = [[Int]]()
var sortedTimeBlockPaths = [[Int]]();               var sortingTransform = [Int]()

var taskDeadlineArrays = [[[Int(), String(), Int(), String(), String(), Int(), Int()] as [Any]]]
var taskDescriptionArrays = [[String]]()
var taskStatusArrays = [[Int]]() /// populated with raw values of enum TaskStatus*/




// Saving ARCHIVED time blocks' components via separate UserDefaults arrays -----------------------------------------------------
var archiveTasks = [SimpleTask]()
var archiveTaskDescriptions = [String]()
var archiveTaskStatuses = [Int]();                  var archiveTaskStatusStrings = [String]()
var archiveTaskDateComponentArrays = [[Int]]();     var archiveTaskDateStrings = [String]()

