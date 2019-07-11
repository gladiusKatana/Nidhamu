//  MarkEvent.swift
//  nidhamu  ∙  1st commit July. 08, 2019  ∙  Created by Garth Snyder, aka gladiusKatana ⚔️
import UIKit

extension CollectionVC {
    
    func processEventsSinceLastLogin(layout: CustomFlowLayout) {
        
        if !pathsToProcess.isEmpty {
            let column = pathsToProcess.first![0]; let row = pathsToProcess.first![1]
            globalEventIdentifier = "\(eventArraysToProcess.first![eventIndex].eventDescription)"  //; print("event identifier: \(globalEventIdentifier)")
            presentPopupViewToMarkEvents(column: column, row: row)
        }
        else {                                                                               //print("paths to process empty")
            self.downcastLayout?.autoFitHScale = 1
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {self.reloadCV()}
            defaultSaveData(showDate: true)
            defaultLoadData(showDate: false)            ; print("✔︎ Done processing events")
        }
    }
    
    func presentPopupViewToMarkEvents(column: Int, row: Int) {
        DispatchQueue.main.asyncAfter(deadline: .now()) { //time delay of 0.3 works stably (thus far) on my iPhone 7
            
            let layout = self.downcastLayout!
            let cellWidth = layout.widthPlusSpace;      let cellHeight = layout.heightPlusSpace
            let widthMultiplier = CGFloat(2)
            
            let classifierLayout = classifierVC.downcastLayout!
            classifierLayout.cellWidth = cellWidth * widthMultiplier;  classifierLayout.cellHeight = cellHeight
            
            let cols = CGFloat(classifierLayout.cols)
            var x = cellWidth * CGFloat(column + 1)
            var y = CGFloat(navBarHeight + statusBarHeight) + cellHeight * CGFloat(row)
            
            if column >= 6 {x = cellWidth * CGFloat(column - 2)}
            if row >= 19 {y = CGFloat(navBarHeight + statusBarHeight) + cellHeight * CGFloat(row)}
            
            let frame = CGRect(x: x, y: y, width: cellWidth * cols * widthMultiplier, height: cellHeight * 5)
            classifierVC.downcastLayout?.customFrame = frame
            classifierVC.collectionView.frame = frame
            
            self.view.addSubview(classifierVC.view)     ///globalKeyWindow.addSubview(classifierVC.view)
            classifierVC.keepScrollIndicatorsVisible()
        }
    }
}

