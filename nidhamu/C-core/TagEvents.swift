// TagEvents        ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension CollectionVC {
    
    func lastEventFromPath(_ path: [Int]) -> SimpleEvent {
        
        let err = "no item @ path [sort attempt]"
        var lastEvent = SimpleEvent(eventDescription: err, eventDate: Date(), eventStatus: .done) // arbitrary parameters to satisfy initializer
        
        if let eventsToProcess = eventsAtIndexPath[TimeBlock(values:(path[0], path[1]))] {
            lastEvent = eventsToProcess.last!
        }
        else {print(err)}

        return lastEvent
    }
    
    func tagEventsSinceLastLogin(layout: CustomFlowLayout) {
        
        if !pathsToProcess.isEmpty { // already (sort of) checked for this, in the caller (but used  event ArraysToProcess)
            
            for cell in timetableVC.collectionView.visibleCells {
                guard let customCell = cell as? TemplateCell else {
                    print("could not downcast to custom cell in cell reference")
                    return
                }
                let column = customCell.xyCoordinate[0]; let row = customCell.xyCoordinate[1]
                if let earliestEventAddress = pathsToProcess.first {
                    if row == earliestEventAddress[1] && column == earliestEventAddress[0] {
                        cell.layer.borderColor = UIColor.white.cgColor; cell.layer.borderWidth = 2
                    }
                    else {cell.layer.borderColor = UIColor.clear.cgColor}
                }
                else {cell.layer.borderColor = UIColor.clear.cgColor}
            }
            
            let column = pathsToProcess.first![0]; let row = pathsToProcess.first![1]           //; print("presenting popup at (\(column), \(row))")
            
            globalEventIdentifier = "\(eventArraysToProcess.first![eventIndex].eventDescription)"   //; print("event id: \(globalEventIdentifier)")
            
            presentPopupViewToTagEvents(column: column, row: row)
            
            if !savedTimeBlocksForProcessing {
                if thereWillBeARowException {
                    self.downcastLayout?.autoFitHScale = CGFloat(layout.rows) / CGFloat(layout.rows + 4) //+ 0.01
                }
            }
        }
            
        else {                                                                                      //print("\npaths to process empty\n")
            self.downcastLayout?.autoFitHScale = 1
            eventArraysToProcess.removeAll()        //* see note at-bottom of LoginInterval.swift
        }
    }
}

