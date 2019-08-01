// AppDelegate      ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

@UIApplicationMain class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
//    var orientationLock = UIInterfaceOrientationMask.portrait         // set orientations you want to be allowed in this property by default
//    //var enableAllOrientation = true
//     var restrictRotation:UIInterfaceOrientationMask = .portrait
    
    func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        
//        func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask
//        {
//            return .portrait //self.restrictRotation
//        }
        

//        func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
//
////            if (enableAllOrientation == true) {
////                return UIInterfaceOrientationMask.allButUpsideDown
////            }
//
//            return UIInterfaceOrientationMask.portrait
//        }
        
        
//        func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
//
//            if let rootViewController = window?.rootViewController?.presentedViewController {
//
//                // Using class kind
//
////                 if rootViewController.isKind(of: YourViewControllerClass.self) {
////                 return .allButUpsideDown
////                 }
//
//                // Or Using a selector -> Put this in the ViewController you want to rotate: @objc func canRotate() -> Void {}
//
//                if (rootViewController.responds(to: Selector("canRotate"))) {
//                    return .allButUpsideDown;
//                }
//            }
//
//            // Only allow portrait (standard behaviour)
//            return .portrait;
//        }
        
        
//        func application(_ application: UIApplication,
//                         supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
//            //return [.portrait, .landscape]
//            //return .landscape
//            //return .portrait
//            return self.orientationLock
//        }
        
        
        var statusBar = UIView()
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = windowBackgroundColour
        window?.makeKeyAndVisible()
        
        modelName = UIDevice.modelName
        getOrientationAtLaunch()                                ; print("launching on \(modelName) in \(launchOrientation) orientation")
        
        statusBar = UIApplication.shared.value(forKey: "statusBar") as! UIView
        if statusBar.responds(to:#selector(setter: UIView.backgroundColor)) {
            statusBar.backgroundColor = .clear
        }
        
        UINavigationBar.appearance().barTintColor = .white //bluishGrey
        UINavigationBar.appearance().shadowImage = UIImage()
        
        //print(formattedDateString(Date(), roundedDown: false, prefix: "                      on", suffix: "", short: false))
        return true
    }
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let backgroundVC = UIViewController()
        
        backgroundVC.view.frame = globalKeyWindow.frame
        backgroundVC.view.backgroundColor = windowBackgroundColour  // must match window's background colour, for when rotating landscape->portrait
        
        navController = UINavigationController(rootViewController: backgroundVC)    // temporary, unseen initial root view controller
        window?.rootViewController = navController                  //; print("VCs*: \(String(describing: nav Controller?.viewControllers))")
        
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            timetableVC.setupAndPresent(vc: timetableVC)            // just need a uiviewcontroller (any of them) to call this method
        }
        return true
    }
}





//struct AppUtility {
//    
//    static func lockOrientation(_ orientation: UIInterfaceOrientationMask) {                //print("---------------------locked")
//        
//        if let appDelgat = UIApplication.shared.delegate as? AppDelegate {
//            appDelgat.orientationLock = orientation
//        }
//    }
//    
//    // OPTIONAL Added method to adjust lock and rotate to the desired orientation
//    
//    static func lockOrientation(_ orientation: UIInterfaceOrientationMask,
//                                andRotateTo rotateOrientation:UIInterfaceOrientation) {     print("---------------------locked & rotated")
//        
//        self.lockOrientation(orientation)
//        
//        UIDevice.current.setValue(rotateOrientation.rawValue, forKey: "orientation")
//    }
//}

