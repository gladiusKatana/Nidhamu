// AppLifecycle     ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension AppDelegate {
    
    func applicationDidBecomeActive(_ application: UIApplication) {                     //print("🔅became active")/**/
        checkOrientation()
        
        defaultLoadData(showDate: false)
        topVC.reloadCV()
    }
    
    
    func applicationWillEnterForeground(_ application: UIApplication) {                 //print("🌔will enter foreground")
        firstReenteredForeground = true
        // 1-way bool (stays true, since dismissing then reopening app causes visual glitch over remaining lifecycle)
        
        checkOrientation()
        if currentOrientation == "landscape" {print("returned from landscape")}
    }
    
    
    func applicationWillResignActive(_ application: UIApplication) {                    //customApplicationStatusPrint("⏸will resign active")
        if !classifierViewDisplayed {
            defaultSaveData(saveDate: true, showDate: false, pryntEvents: true)
        }
        
        savedTimeBlocksForProcessing = false
        
        if eventsAtIndexPath.values.count > 0 {  // autorotate for smoother event-tagging IF user dismisses app, then resumes it hours/days later
            if currentOrientation == "landscape" {                                      //print("becameActive from landscape")
                AppUtility.lockOrientation(.portrait, andRotateTo: .portrait)           //print("locking/rotating to portrait from resignActive")
                rotatedFromResignActive = true
            }
        } //else {print("no event items yet")}
    }
    
    
    func applicationDidEnterBackground(_ application: UIApplication) {                  //customApplicationStatusPrint("🌘entered background")
        lastActiveOrientation = currentOrientation
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        print("terminated")
    }
    
    func customApplicationStatusPrint(_ applicationState: String) { print("\n\(applicationState)")}
}

