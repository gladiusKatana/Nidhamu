// AppLifecycle     ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension AppDelegate {
    
    func applicationDidBecomeActive(_ application: UIApplication) {         let s = "🔅became active"
        //        if firstReenteredForeground {
        //        customApplicationStatusPrint(applicationState: str)
        //        } else {
        print(s)
        //        }
        
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            topVC.reloadCV()
        }
        
        /*DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            if lastActiveOrientation == "landscape" {
                AppUtility.lockOrientation(.landscape)
            }
        }*/
        
        defaultLoadData(showDate: false)
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        print("🌔will enter foreground, orientation \(currentOrientation), was \(lastActiveOrientation)")
        
        //if !firstReenteredForeground {print("entered foreground for the first time")}
        firstReenteredForeground = true // 1-way bool (stays true, since dismissing then reopening app causes visual glitch over remaining lifecycle)
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        customApplicationStatusPrint(applicationState: "⏸will resign active") //, orientation was \(currentOrientation)
        defaultSaveData(showDate: false)
        savedTimeBlocksForProcessing = false
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {      customApplicationStatusPrint(applicationState: "🌘entered background")
        lastActiveOrientation = currentOrientation
    }
    
    func applicationWillTerminate(_ application: UIApplication) {           print("terminated")
    }
    
    func customApplicationStatusPrint(
        applicationState: String) { print("\n\(applicationState)")}
}

