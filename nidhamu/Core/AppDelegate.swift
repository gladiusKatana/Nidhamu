// AppDelegate      ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

@UIApplicationMain class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    lazy var orientationLock = UIInterfaceOrientationMask.all     // set orientations you want allowed by default
    
    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        return orientationLock
    }
    
    func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        var statusBar = UIView()
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = windowBackgroundColour
        window?.makeKeyAndVisible()
        
        modelName = UIDevice.modelName
        getOrientationAtLaunch()                                    ; print("launching on \(modelName) in \(launchOrientation) orientation")
        
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



