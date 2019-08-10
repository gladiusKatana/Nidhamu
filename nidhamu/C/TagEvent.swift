// TagEvent         ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension CollectionVC {
    
    func processEventsSinceLastLogin(layout: CustomFlowLayout) {
        
        if !pathsToProcess.isEmpty {
            let column = pathsToProcess.first![0]; let row = pathsToProcess.first![1]
            globalEventIdentifier = "\(eventArraysToProcess.first![eventIndex].eventDescription)"   //; print("event id: \(globalEventIdentifier)")
            
            presentPopupViewToMarkEvents(column: column, row: row)
            
            if !savedTimeBlocksForProcessing {
                if thereWillBeARowException {
                    self.downcastLayout?.autoFitHScale = CGFloat(layout.rows) / CGFloat(layout.rows + 4) //+ 0.01
                }
            }
        } else {                                                                                    //print("paths to process empty")
            self.downcastLayout?.autoFitHScale = 1
            eventArraysToProcess.removeAll() //* see note at-bottom of DateRange.swift
            
            if vcType == .hours {
                defaultSaveData(showDate: true)
                defaultLoadData(showDate: false)
                //print("✔︎done processing events... \n...event arrays to process: \(eventArraysToProcess)... paths to process: \(pathsToProcess)")
            }
        }
    }
}

