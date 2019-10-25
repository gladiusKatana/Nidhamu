// AppLifecycle     ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension AppDelegate {
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        
        /// first time this is called, causes this print to visually interrupt (be in the middle of) the didLoad and didAppear symbols (and the legend explaining them), which looks ugly.  (And, it's obvious anyway, the first time, that the app became active.)
        
        /*if firstBecameActive {print("🔅became active")}
        else {firstBecameActive = true}*/
        
        checkOrientation()
        defaultLoadData(showDate: false)
        topVC.reloadCV()
    }
    
    
    func applicationWillEnterForeground(_ application: UIApplication) {                 print("🌔will enter foreground\n")
        checkOrientation()
        if currentOrientation == "landscape" {print("returned from landscape")}
    }
    
    
    func applicationWillResignActive(_ application: UIApplication) {                    ///customApplicationStatusPrint("⏸will resign active")
        if !classifierViewDisplayed {
            defaultSaveData(saveDate: true, resetLastLogin: false, showDate: true, pryntEvents: true)
        }
        
        savedBlocksAndPathsForProcessing = false
        
        if eventsAtIndexPath.values.count > 0 {  // autorotate for smoother event-tagging IF user dismisses app, then resumes it hours/days later
            if currentOrientation == "landscape" {                                      //print("becameActive from landscape")
                AppUtility.lockOrientation(.portrait, andRotateTo: .portrait)           //print("locking/rotating to portrait from resignActive")
                rotatedFromResignActive = true
            }
        } //else {print("no event items yet")}
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {                  print("\n🌘entered background")
        lastActiveOrientation = currentOrientation                                      ///customApplicationStatusPrint("🌘entered background")
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        print("terminated")
    }
    
    func customApplicationStatusPrint(_ applicationState: String) { print("\n\(applicationState)")}
}

