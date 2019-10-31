// Orientation      ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension AppDelegate {
    
    func getOrientationAtLaunch() {
        
        let launchHeight = Double(globalWindow.frame.height)
        launchWidth = Double(globalWindow.frame.width)
        
        if launchHeight > launchWidth {
            launchOrientation = "portrait"
            lastStatusBarHeight = 20
        }
        else if launchHeight < launchWidth {
            launchOrientation = "landscape"
            lastStatusBarHeight = 0
        }
        else {
            launchOrientation = " ?"                        ; print("launch orientation undefined")
            lastStatusBarHeight = 99
        }
        
        currentOrientation = launchOrientation
        previousOrientation = launchOrientation
    }
}


func checkOrientation() {
    
    let currentHeight = Double(globalWindow.frame.height);   let currentWidth = Double(globalWindow.frame.width)
    
    if currentHeight > currentWidth {
        currentOrientation = "portrait"
    }
    else if currentHeight < currentWidth {
        currentOrientation = "landscape"
    }
    else {print("\n\nUm, global window frame height & width are equal...")} /// shouldn't get called... unless Apple decides to make a square device
    
    //print("check orientation: \(currentOrientation)")
}

