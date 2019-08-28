// TagEvents        ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension CollectionVC {
    
    func tagEventsSinceLastLogin(layout: CustomFlowLayout) {
        
        if !pathsToProcess.isEmpty {
            
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

