// AppLifecycle     ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension AppDelegate {
    
    func applicationDidBecomeActive(_ application: UIApplication) {                                             //print("🔅became active")/**/
        checkOrientation()
        //if currentOrientation == "landscape" {print("becameActive from landscape")}
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            checkOrientation()
            topVC.reloadCV()
//            topVC.rePresentThenReload(vc: topVC)
        }
        defaultLoadData(showDate: true)
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

