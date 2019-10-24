// EventData        ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit


var eventsAtIndexPath = Dictionary<TimeBlock<Int,Int>,[SimpleEvent]>()      /// Dictionary lookup for arrays of events (ie to-do-lists), keyed by collection view index path

///var eventsAtDate = Dictionary<ArchiveBlock<Int,Int,Int,Int>,[SimpleEvent]>()                 /// Dictionary lookup for arrays of archived events, keyed by event-date components (y,m,d,h)


/// Adding events to time-blocks (ie cells, visually speaking)
var timeBlock = TimeBlock(values:(0, 0))
var defaultPathOutOfView = [-1, -1];                var earliestEventAddress = defaultPathOutOfView
var selectedTimeBlockPath = defaultPathOutOfView;   var previousTimeBlockPathSelected = defaultPathOutOfView /// for animations: see Tap.swift


/// Processing time blocks for tagging
var eventArraysToProcess = [[SimpleEvent]]();       var eventDescriptionsToProcess = [[String]]()
var pathsToProcess = [[Int]]()


/// Deferring tasks
var deferralPath = [Int]();     var deferredDescription = ""


/// Saving time blocks' components via separate UserDefaults arrays
var timeBlockPaths = [[Int]]()
var sortedTimeBlockPaths = [[Int]]();               var sortingTransform = [Int]()

var eventDateArrays = [[[Int(), String(), Int(), String(), String(), Int(), Int()] as [Any]]]
var eventDescriptionArrays = [[String]]()
var eventStatusArrays = [[Int]]() /* Populated with raw values of enum EventStatus*/


/// Saving archived time blocks' components via separate UserDefaults arrays
var archiveEvents = [SimpleEvent]()
var archiveEventDescriptions = [String]()
var archiveEventStatuses = [Int]();                 var archiveEventStatusStrings = [String]()
var archiveEventDateComponentArrays = [[Int]]();    var archiveEventDateStrings = [String]()

/*
//var archiveEventDescriptionArrays = [[String]]();                                               var allArchiveEventDescriptions = [String]()
//var archiveEventStatusArrays = [[Int]](); /* Populated with raw values of enum EventStatus*/    var allArchiveEventStatuses = [Int]()
//var archiveEventDateArrays = [[Date]]();                                                        var allArchiveEventDates = [Date]()
//var sortedArchiveEventDateArrays = [[Date]]()
*/

