// CellSetup        ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension CollectionVC {
    
    func timeBlockDateSetup (cell: CustomCell, column: Int, row: Int, layout: CustomFlowLayout) { //cell. titleLabel.text = "\(column),\(row)"
        
        switch vcType {
            
        case .hours:
            
            setHourlyCellDates(cell: cell, column: column, row: row, layout: layout, looping: loopWeeks, withColours: demarcateWeeksByColour)
            
            if let events = eventsAtIndexPath[TimeBlock(values:(column, row))] {
                if events.count == 1 {
                    let eventName = events[0].eventDescription
                    cell.titleLabel.text = eventName
                    
                    let truncTrailSize = truncationTrail.stringSize(font: cell.titleLabel.font).width
                    let limit = layout.cellWidth! - truncTrailSize //+ averageLetterWidth * 1.3
                    ///print("limit: \(limit)")  ///; print("dots: \(truncTrailSize)  avgLetter:\(averageLetterWidth)")
                    
                    cell.titleLabel.text = truncateString(eventName, sizeLimit: limit, font: cell.titleLabel.font)
                }
                else {
                    if eventsInBlockToBeProcessed == 0 {
                        cell.titleLabel.text = "(\(events.count))"
                    }
                    else {cell.titleLabel.text = ""}
                }
            }
            
        case .todoList:
            
            cell.cellDate = selectedCellDate
            
            guard let eventAtTimeBlock = eventsAtIndexPath[timeBlock] else {
                cell.titleLabel.text = "(no items yet)"; return // will not be executed since todo list vc is only go-to-able via a time block
            }
            
            let status = eventAtTimeBlock[row].eventStatus
            
            cell.titleLabel.textColor = .black
            
            if column == 0 {
                cell.titleLabel.text = eventAtTimeBlock[row].eventDescription
                if status == .occurred || status == .upcoming {cell.titleLabel.font = UIFont.systemFont(ofSize: 12, weight: .bold)}
            }
                
            else if column == 1 {
                cell.titleLabel.text = formattedDateString(eventAtTimeBlock[row].eventDate, roundedDown: false, showYear: true, prefix: "", suffix: "", dateFormat: .fullDayShortForm)
            }
                
            else {cell.titleLabel.text = "\(eventAtTimeBlock[row].eventStatus)"}
            
        case .archive:
            
            cell.titleLabel.textColor = .darkGray
            
//            allArchiveEventDescriptions.removeAll(); allArchiveEventStatuses.removeAll(); allArchiveEventDates.removeAll()
//            archiveEventDescriptionArrays.removeAll(); archiveEventStatusArrays.removeAll(); archiveEventDateArrays.removeAll()  ///; datesFromKeys.removeAll()
//            for vals in eventsAtDate.values {
//                if vals.count >= 1 {
//                    var eventDescriptions = [String]()
//                    var eventStatuses = [Int]()
//                    var eventDates = [Date]()
//
//                    for event in vals {
//                        eventDescriptions.append(event.eventDescription)
//                        eventStatuses.append(event.eventStatus.rawValue)
//                        eventDates.append(event.eventDate)
//                    }
//                    archiveEventDescriptionArrays.append(eventDescriptions)
//                    archiveEventStatusArrays.append(eventStatuses)
//                    archiveEventDateArrays.append(eventDates)
//                }
//            }
            
//            sortedArchiveEventDateArrays = archiveEventDateArrays.sorted(by: {$0.last! < $1.last!})  /// dates will all be the same for events in a given time block
//            let dateSortingTransform = findDateSortingTransform(archiveEventDateArrays, output: sortedArchiveEventDateArrays)
//            ///; print("T:\(dateSortingTransform)\n")
//
//            let sortedEventDescriptionArrays = applySortingTransform(archiveEventDescriptionArrays, transform: dateSortingTransform) as! [[String]]
//            let sortedEventStatusArrays = applySortingTransform(archiveEventStatusArrays, transform: dateSortingTransform) as! [[Int]]
            
            
//            for items in sortedArchiveEventDateArrays {
//                for item in items {
//                    allArchiveEventDates.append(item)
//                }
//            }
//            for items in sortedEventDescriptionArrays {
//                for item in items {
//                    allArchiveEventDescriptions.append(item)
//                }
//            }
//            for items in sortedEventStatusArrays {
//                for item in items {
//                    allArchiveEventStatuses.append(item)
//                }
//            }
            
            if column == 0 {
                cell.titleLabel.text = formattedDateString(dateFromInts(archiveEventDateComponentArrays[row]), roundedDown: false, showYear: true, prefix: "", suffix: "", dateFormat: .fullDayShortForm)
            }
                
            else if column == 1 {cell.titleLabel.text = "\(archiveEventDescriptions[row])"}
                
            else {
                let rawVal = archiveEventStatuses[row]
                cell.titleLabel.text = EventStatus(rawValue: rawVal)!.caseName()
            }
            
//            if column == 0 {
//                cell.titleLabel.text = formattedDateString(allArchiveEventDates[row], roundedDown: false, showYear: true, prefix: "", suffix: "", dateFormat: .fullDayShortForm)
//            }
//
//            else if column == 1 {cell.titleLabel.text = "\(allArchiveEventDescriptions[row])"}
//
//            else {
//                let index = allArchiveEventStatuses[row]
//                cell.titleLabel.text = EventStatus(rawValue: index)?.caseName()
//            }
            
        default: print("[timeBlockDateSetup(:)] unrecognized collection view type")}
    }
}

/*
 case .archive:
 
 /// Saving archived time blocks' components via separate UserDefaults arrays
 var archiveEventDescriptionArrays = [[String]]();                                       var allArchiveEventDescriptions = [String]()
 var archiveEventStatusArrays = [[Int]](); /* Populated with raw values of enum EventStatus*/   var allArchiveEventStatuses = [Int]()
 var archiveEventDateArrays = [[Date]]();                                                       var allArchiveEventDates = [Date]()
 var sortedArchiveEventDateArrays = [[Date]]()
 
 cell.titleLabel.textColor = .darkGray
 
 eventDescriptionArrays.removeAll(); eventStatusArrays.removeAll(); eventDateArrays.removeAll()  ///; datesFromKeys.removeAll()
 
 for vals in eventsAtDate.values {
     if vals.count >= 1 {
         var eventDescriptions = [String]()
         var eventStatuses = [Int]()
         var eventDates = [Date]()
         
         for event in vals {
             eventDescriptions.append(event.eventDescription)
             eventStatuses.append(event.eventStatus.rawValue)
             eventDates.append(event.eventDate)
         }
         archiveEventDescriptionArrays.append(eventDescriptions)
         archiveEventStatusArrays.append(eventStatuses)
         archiveEventDateArrays.append(eventDates)
     }
 }
 
 sortedArchiveEventDateArrays = archiveEventDateArrays.sorted(by: {$0.last! < $1.last!})  /// dates will all be the same for events in a given time block
 let dateSortingTransform = findDateSortingTransform(archiveEventDateArrays, output: sortedArchiveEventDateArrays)
 ///; print("T:\(dateSortingTransform)\n")
 
 let sortedEventDescriptionArrays = applySortingTransform(eventDescriptionArrays, transform: dateSortingTransform) as! [[String]]
 let sortedEventStatusArrays = applySortingTransform(eventStatusArrays, transform: dateSortingTransform) as! [[Int]]
 
 for items in sortedArchiveEventDateArrays {
     for item in items {
         allArchiveEventDates.append(item)
     }
 }
 for items in sortedEventDescriptionArrays {
     for item in items {
         allArchiveEventDescriptions.append(item)
     }
 }
 for items in sortedEventStatusArrays {
     for item in items {
         allArchiveEventStatuses.append(item)
     }
 }
 
 if column == 0 {
     cell.titleLabel.text = formattedDateString(allArchiveEventDates[row], roundedDown: false, showYear: true, prefix: "", suffix: "", dateFormat: .fullDayShortForm)
 }
     
 else if column == 1 {cell.titleLabel.text = "\(allArchiveEventDescriptions[row])"}
     
 else {
     let index = allArchiveEventStatuses[row]
     cell.titleLabel.text = EventStatus(rawValue: index)?.caseName()
 }
 */
 
/**
 // CellSetup        ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
 import UIKit

 extension CollectionVC {
     
     func timeBlockDateSetup (cell: CustomCell, column: Int, row: Int, layout: CustomFlowLayout) { //cell. titleLabel.text = "\(column),\(row)"
         
         switch vcType {
             
         case .hours:
             
             setHourlyCellDates(cell: cell, column: column, row: row, layout: layout, looping: loopWeeks, withColours: demarcateWeeksByColour)
             
             if let events = eventsAtIndexPath[TimeBlock(values:(column, row))] {
                 if events.count == 1 {
                     let eventName = events[0].eventDescription
                     cell.titleLabel.text = eventName
                     
                     let truncTrailSize = truncationTrail.stringSize(font: cell.titleLabel.font).width
                     let limit = layout.cellWidth! - truncTrailSize //+ averageLetterWidth * 1.3
                     ///print("limit: \(limit)")  ///; print("dots: \(truncTrailSize)  avgLetter:\(averageLetterWidth)")
                     
                     cell.titleLabel.text = truncateString(eventName, sizeLimit: limit, font: cell.titleLabel.font)
                 }
                 else {
                     if eventsInBlockToBeProcessed == 0 {
                         cell.titleLabel.text = "(\(events.count))"
                     }
                     else {cell.titleLabel.text = ""}
                 }
             }
             
         case .todoList:
             
             cell.cellDate = selectedCellDate
             
             guard let eventAtTimeBlock = eventsAtIndexPath[timeBlock] else {
                 cell.titleLabel.text = "(no items yet)"; return // will not be executed since todo list vc is only go-to-able via a time block
             }
             
             let status = eventAtTimeBlock[row].eventStatus
             
             cell.titleLabel.textColor = .black
             
             if column == 0 {
                 cell.titleLabel.text = eventAtTimeBlock[row].eventDescription
                 if status == .occurred || status == .upcoming {cell.titleLabel.font = UIFont.systemFont(ofSize: 12, weight: .bold)}
             }
                 
             else if column == 1 {
                 cell.titleLabel.text = formattedDateString(eventAtTimeBlock[row].eventDate, roundedDown: false, showYear: true, prefix: "", suffix: "", dateFormat: .fullDayShortForm)
             }
                 
             else {cell.titleLabel.text = "\(eventAtTimeBlock[row].eventStatus)"}
             
         case .archive:
             
             cell.titleLabel.textColor = .darkGray
             
             var eventDescriptionArrays = [[String]]();                                              var allEventDescriptions = [String]()
             var eventStatusArrays = [[Int]](); /* Populated with raw values of enum EventStatus*/   var allEventStatuses = [Int]()
             var eventDateArrays = [[Date]]();                                                       var allEventDates = [Date]()
             
             eventDescriptionArrays.removeAll(); eventStatusArrays.removeAll(); eventDateArrays.removeAll()  ///; datesFromKeys.removeAll()
             
             for vals in eventsAtDate.values {
                 if vals.count >= 1 {
                     var eventDescriptions = [String]()
                     var eventStatuses = [Int]()
                     var eventDates = [Date]()
                     
                     for event in vals {
                         eventDescriptions.append(event.eventDescription)
                         eventStatuses.append(event.eventStatus.rawValue)
                         eventDates.append(event.eventDate)
                     }
                     eventDescriptionArrays.append(eventDescriptions)
                     eventStatusArrays.append(eventStatuses)
                     eventDateArrays.append(eventDates)
                 }
             }
             
             let sortedEventDateArrays = eventDateArrays.sorted(by: {$0.last! < $1.last!})  /// all the dates will be the same for each event in each time block
             let dateSortingTransform = findDateSortingTransform(eventDateArrays, output: sortedEventDateArrays)   ///; print("T:\(dateSortingTransform)\n")
             
             let sortedEventDescriptionArrays = applySortingTransform(eventDescriptionArrays, transform: dateSortingTransform) as! [[String]]
             let sortedEventStatusArrays = applySortingTransform(eventStatusArrays, transform: dateSortingTransform) as! [[Int]]
             
             for items in sortedEventDateArrays {
                 for item in items {
                     allEventDates.append(item)
                 }
             }
             for items in sortedEventDescriptionArrays {
                 for item in items {
                     allEventDescriptions.append(item)
                 }
             }
             for items in sortedEventStatusArrays {
                 for item in items {
                     allEventStatuses.append(item)
                 }
             }
             
             if column == 0 {
                 cell.titleLabel.text = formattedDateString(allEventDates[row], roundedDown: false, showYear: true, prefix: "", suffix: "", dateFormat: .fullDayShortForm)
             }
                 
             else if column == 1 {cell.titleLabel.text = "\(allEventDescriptions[row])"}
                 
             else {
                 let index = allEventStatuses[row]
                 cell.titleLabel.text = EventStatus(rawValue: index)?.caseName()
             }
             
         default: print("[timeBlockDateSetup(:)] unrecognized collection view type")}
     }
 }


 
 */
