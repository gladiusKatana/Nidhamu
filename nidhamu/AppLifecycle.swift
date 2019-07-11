//  AppLifecycle.swift
//  nidhamu  ∙  1st commit July. 08, 2019  ∙  Created by Garth Snyder, aka gladiusKatana ⚔️
import UIKit

extension AppDelegate {
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        let str = "🔅became active"
        if firstReenteredForeground {customApplicationStatusPrint(applicationState: str)}
        else {print(str)}
        
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            topVC.reloadCV()
        }
        defaultLoadData(showDate: true)
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        customApplicationStatusPrint(applicationState: "⏸will resign active")
        defaultSaveData(showDate: true)
        
        savedTimeBlocksForProcessing = false
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        customApplicationStatusPrint(applicationState: "🌘entered background")
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        print("🌔will enter foreground")
        
        //if !firstReenteredForeground {print("entered foreground for the first time")}
        firstReenteredForeground = true // 1-way bool: never reset (calling above 2 methods causes layout exception over the whole life cycle)
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        print("terminated")
    }
    
    func customApplicationStatusPrint(applicationState: String) {
        print("\n\(applicationState)")
    }
}

