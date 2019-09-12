// TagEvents        ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension CollectionVC {
    
    func tagEventsSinceLastLogin(layout: CustomFlowLayout) {
        
        if !pathsToProcess.isEmpty { // already (sort of) checked for this, in the caller (but used  event ArraysToProcess)
            
            let column = pathsToProcess.first![0]; let row = pathsToProcess.first![1]       //; print("presenting popup at (\(column), \(row))")
            
            globalEventIdentifier = "\(eventArraysToProcess.first![eventIndex].eventDescription)"
            
            //print("event id: \(globalEventIdentifier)")
            
            presentPopupViewToTagEvents(column: column, row: row)
        }
            
        else {                                                                                      //print("\npaths to process empty\n")
            self.downcastLayout?.autoFitHScale = 1
            eventArraysToProcess.removeAll()        //* see note at-bottom of LoginInterval.swift
        }
    }
    
    func lastEventFromPath(_ path: [Int]) -> SimpleEvent {
        let err = "no item @ path [sort attempt]"
        var lastEvent = SimpleEvent(eventDescription: err, eventDate: Date(), eventStatus: .done) // arbitrary parameters to satisfy initializer
        
        if let eventsToProcess = eventsAtIndexPath[TimeBlock(values:(path[0], path[1]))] {
            lastEvent = eventsToProcess.last!
        }
        else {print(err)}
        
        return lastEvent
    }
}

