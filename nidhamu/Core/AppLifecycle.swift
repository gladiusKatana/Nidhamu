// AppLifecycle     ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension AppDelegate {
    
    func applicationDidBecomeActive(_ application: UIApplication) {                                             //print("🔅became active")/**/
        checkOrientation()

        defaultLoadData(showDate: true)
        
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            topVC.reloadCV()
        }
    }
    
    
    func applicationWillEnterForeground(_ application: UIApplication) {                                         //print("🌔will enter foreground")
        firstReenteredForeground = true
        // 1-way bool (stays true, since dismissing then reopening app causes visual glitch over remaining lifecycle)
        
        checkOrientation()
        if currentOrientation == "landscape" {print("returned from landscape")}
    }
    
    
    func applicationWillResignActive(_ application: UIApplication) {        //customApplicationStatusPrint(applicationState: "⏸will resign active")
        if !classifierViewDisplayed {
            defaultSaveData(showDate: false)
        }
        
        // if eventsAtIndexPath not empty {
        //if classifierViewDisplayed {                                      print("locking to portrait from resign-active")
        if currentOrientation == "landscape" {                              //print("becameActive from landscape")
            AppUtility.lockOrientation(.portrait, andRotateTo: .portrait)
            rotatedFromResignActive = true
        }
        //}
        
        savedTimeBlocksForProcessing = false
    }
    
    
    func applicationDidEnterBackground(_ application: UIApplication) {      //customApplicationStatusPrint(applicationState: "🌘entered background")
        lastActiveOrientation = currentOrientation
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        print("terminated")
    }
    
    func customApplicationStatusPrint(applicationState: String) { print("\n\(applicationState)")}
}












/*let s = "🔅became active"
 if firstReenteredForeground {
 customApplicationStatusPrint(applicationState: s)
 } else {
 print(s)
 }*/

