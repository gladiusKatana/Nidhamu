// AppLifecycle     ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension AppDelegate {
    
    func applicationDidBecomeActive(_ application: UIApplication) {                                                 let s = "🔅became active"
        /*if firstReenteredForeground {
            customApplicationStatusPrint(applicationState: str)
        } else {*/                                                              print(s)
        //}
        /*if currentOrientation == "landscape" { print("STILL in landscape")
            DispatchQueue.main.asyncAfter(deadline: .now()) {
                AppUtility.lockOrientation(.landscapeRight)
            }
        }*/

        DispatchQueue.main.asyncAfter(deadline: .now()) {topVC.reloadCV()}
       
        defaultLoadData(showDate: false)
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {                                          print("🌔will enter foreground")
        firstReenteredForeground = true
        // 1-way bool (stays true, since dismissing then reopening app causes visual glitch over remaining lifecycle)
    }
    
    func applicationWillResignActive(_ application: UIApplication) {        customApplicationStatusPrint(applicationState: "⏸will resign active")
        if !classifierViewDisplayed {defaultSaveData(showDate: false)}
        
        savedTimeBlocksForProcessing = false
        
//        if classifierViewDisplayed {
//            classifierVC.view.removeFromSuperview()                         ; print("----------------removed popup")
//            classifierViewDisplayed = false
//        }
    
        /*checkOrientation()
        if currentOrientation != "landscape" {
            DispatchQueue.main.asyncAfter(deadline: .now()) {
                AppUtility.lockOrientation(.landscapeRight, andRotateTo: .landscapeRight)
                checkOrientation() //; if currentOrientation == "landscape" {print("ok we're in landscape")}
            }
        }*/
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {      customApplicationStatusPrint(applicationState: "🌘entered background")
        lastActiveOrientation = currentOrientation
        
        /*if currentOrientation == "landscape" {
            DispatchQueue.main.asyncAfter(deadline: .now()) {
                AppUtility.lockOrientation(.landscapeRight)
                autorotateFromBackgroundThenForeground = false  ; print("still in landscape; rot'd? \(autorotateFromBackgroundThenForeground)\n")
            }
        }*/
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        print("terminated")
    }
    
    func customApplicationStatusPrint(applicationState: String) { print("\n\(applicationState)")}
}

