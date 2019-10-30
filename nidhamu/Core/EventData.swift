// TaskData         ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit


var tasksAtIndexPath = Dictionary<TimeBlock<Int,Int>,[SimpleTask]>()      /// Dictionary lookup for arrays of tasks (ie to-do-lists), keyed by collection view index path

///var tasksAtDate = Dictionary<ArchiveBlock<Int,Int,Int,Int>,[SimpleTask]>()                 /// Dictionary lookup for arrays of archived tasks, keyed by task-date components (y,m,d,h)



/// Adding tasks to time-blocks (ie cells, visually speaking) --------------------------------------------------------------------
var timeBlock = TimeBlock(values:(0, 0))
var defaultPathOutOfView = [-1, -1];                var earliestTaskAddress = defaultPathOutOfView
var selectedTimeBlockPath = defaultPathOutOfView;   var previousTimeBlockPathSelected = defaultPathOutOfView /// for animations: see Tap.swift



/// Processing time blocks for tagging -----------------------------------------------------------------------------------------------
var taskArraysToProcess = [[SimpleTask]]();         var taskDescriptionsToProcess = [[String]]()
var indexPathsToProcess = [[Int]]()



/// Deferring tasks -------------------------------------------------------------------------------------------------------------------------
var deferralPath = [Int]();     var deferredDescription = ""




/// Saving time blocks' components via separate UserDefaults arrays ------------------------------------------------------
var timeBlockPaths = [[Int]]()
var sortedTimeBlockPaths = [[Int]]();               var sortingTransform = [Int]()

var taskDateArrays = [[[Int(), String(), Int(), String(), String(), Int(), Int()] as [Any]]]
var taskDescriptionArrays = [[String]]()
var taskStatusArrays = [[Int]]() /// populated with raw values of enum TaskStatus*/




/// Saving ARCHIVED time blocks' components via separate UserDefaults arrays -------------------------------------------
var archiveTasks = [SimpleTask]()
var archiveTaskDescriptions = [String]()
var archiveTaskStatuses = [Int]();                  var archiveTaskStatusStrings = [String]()
var archiveTaskDateComponentArrays = [[Int]]();     var archiveTaskDateStrings = [String]()

/*
//var archiveTaskDescriptionArrays = [[String]]();                                              var allArchiveTaskDescriptions = [String]()
//var archiveTaskStatusArrays = [[Int]](); /* Populated with raw values of enum TaskStatus*/    var allArchiveTaskStatuses = [Int]()
//var archiveTaskDateArrays = [[Date]]();                                                       var allArchiveTaskDates = [Date]()
//var sortedArchiveTaskDateArrays = [[Date]]()
*/

