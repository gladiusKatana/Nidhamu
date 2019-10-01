// EventData        ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit


var eventsAtIndexPath = Dictionary<TimeBlock<Int,Int>,[SimpleEvent]>();                         var sortingTransform = [Int]()

var eventsAtDate = Dictionary<ArchiveDate<Int,Int,Int,Int>,[SimpleEvent]>()


var timeBlock = TimeBlock(values:(0, 0))

var eventArraysToProcess = [[SimpleEvent]]()



var pathsToProcess = [[Int]]()                                                                  ///; var sortedPathsToProcess = [[Int]]()

var timeBlockPaths = [[Int]]();                                                                  var sortedTimeBlockPaths = [[Int]]()

var eventDateArrays = [[[Int(), String(), Int(), String(), String(), Int(), Int()] as [Any]]]   ///; var sortedEventDateArrays = [Any]()

var eventDescriptionArrays = [[String]]()                                                       ///; var sortedEventDescriptionArrays = [Any]()
var eventStatusArrays = [[Int]]() /* Populated with raw values of enum EventStatus*/            //var sortedEventStatusArrays = [Any]()



var defaultPathOutOfView = [-1, -1];                var earliestEventAddress = defaultPathOutOfView
var selectedTimeBlockPath = defaultPathOutOfView;   var previousTimeBlockPathSelected = defaultPathOutOfView /// for animations: see Tap.swift

