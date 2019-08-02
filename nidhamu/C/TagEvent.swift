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
        }
        else {                                                                                      //print("paths to process empty")
            self.downcastLayout?.autoFitHScale = 1
//            //DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {self.reloadCV()}
            
            eventArraysToProcess.removeAll() //* see note at-bottom of DateRange.swift
            
            if vcType == .hours {
                defaultSaveData(showDate: true)
                defaultLoadData(showDate: false)
                print("✔︎done processing events... \n...event arrays to process: \(eventArraysToProcess)... paths to process: \(pathsToProcess)")
            }
            
//            //DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {self.reloadCV()}
        }
    }
    
    func presentPopupViewToMarkEvents(column: Int, row: Int) {                                      //print("presenting popup")
        if !classifierViewDisplayed {   classifierViewDisplayed = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {                     //* time delay of 0.3 works stably (thus far) on my iPhone 7
                
                let layout = self.downcastLayout!;      let widthMultiplier = CGFloat(2)
                let cellWidth = layout.widthPlusSpace;  let cellHeight = layout.heightPlusSpace
                
                let classifierLayout = classifierVC.downcastLayout!
                classifierLayout.cellWidth = cellWidth * widthMultiplier;  classifierLayout.cellHeight = cellHeight
                
                let cols = CGFloat(classifierLayout.cols)
                var x = cellWidth * CGFloat(column + 1)
                var y = CGFloat(navBarHeight + statusBarHeight) + cellHeight * CGFloat(row)
                
                if column >= 6 {x = cellWidth * CGFloat(column - 2)}
                if row > 21 {y = CGFloat(navBarHeight + statusBarHeight) + cellHeight * CGFloat(row)}
                
                let frame = CGRect(x: x, y: y, width: cellWidth * cols * widthMultiplier, height: cellHeight * 5)
                classifierVC.downcastLayout?.customFrame = frame
                classifierVC.collectionView.frame = frame
                
                let hscale = timetableVC.downcastLayout!.autoFitHScale! //* make sure this is extensible (ie,  if column >= 6 )
                classifierVC.collectionView?.scrollIndicatorInsets = UIEdgeInsets(top: classifierVC.downcastLayout!.cellHeight! * hscale,
                                                                                  left: 0, bottom: 0, right: 0)
                
                self.view.addSubview(classifierVC.view)
//                globalKeyWindow.addSubview(classifierVC.view)
                timetableVC.popupReload()
                
                                  ; print("----------------added popup") //; print("popup frame \(frame)")
                
                //timetableVC.resignFirstResponder()
                //classifierVC.becomeFirstResponder()
                //timetableVC.canBecomeFirstResponder
                
                classifierVC.keepScrollIndicatorsVisible()
            }
        }
        else {print("popup already displayed...")}
    }
}

