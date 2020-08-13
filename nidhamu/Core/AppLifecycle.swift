// AppLifecycle     ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension AppDelegate {
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        
        /// first time this is called, causes this print to visually interrupt (be in the middle of) the didLoad and didAppear symbols (and the legend explaining them), which looks ugly.  (And, it's obvious anyway, the first time, that the app became active.)
        
        /*if firstBecameActive {print("🔅became active")}
         else {firstBecameActive = true}*/
        
        wakeupDateReset(withReload: true)
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {                 print("🌔will enter foreground\n")
        checkOrientation()
        if currentOrientation == "landscape" {print("returned from landscape")}
    }
    
    func applicationWillResignActive(_ application: UIApplication) {                    ///customApplicationStatusPrint("⏸will resign active")
        taglessSavingFlag = false /// maybe add conditional based on login date interval (time elapsed). if so, maybe move this to applicaatnDidBecomeActive(:)
        thereWillBeARowException = false
        
        if !taggingViewDisplayed {
            defaultSaveData(saveDate: true, resetLastLogin: false, showDate: false, pryntTasks: true)
        }
        
        cachedBlocksAndTheirPaths = false
        
        if tasksAtIndexPath.values.count > 0 {  // autorotate for smoother task-tagging if user dismisses app, then resumes it hours/days later
            if currentOrientation == "landscape" {                                      //print("becameActive from landscape")
                AppUtility.lockOrientation(.portrait, andRotateTo: .portrait)           //print("locking/rotating to portrait from resignActive")
                ///rotatedFromResignActive = true
            }
        } //else {print("no task items yet")}
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {                  print("\n🌘entered background")
        lastActiveOrientation = currentOrientation                                      //customApplicationStatusPrint("🌘entered background")
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        print("terminated")
    }
    
    func customApplicationStatusPrint(_ applicationState: String) { print("\n\(applicationState)")}
}

func wakeupDateReset(withReload: Bool) {
    findFallbackDate(startingDate: Date() - TimeInterval(3600), printDSTDates: showDSTDates) /// generally want =true for testing timetable around DST
    findSpringForwardDate(startingDate: Date(), printDSTDates: showDSTDates)                 /// see above.  (DST = daylight savings time)
    
    checkOrientation()
    defaultLoadData(showDate: true)
    topVC.reloadCV()
}

