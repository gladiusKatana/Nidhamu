// AppDelegate      ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

@UIApplicationMain class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    lazy var orientationLock = UIInterfaceOrientationMask.all       /// set orientations you want allowed by default
    
    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        return orientationLock
    }
    
    func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        modelName = UIDevice.modelName
        processCurrentDate()                            /// may move further down app lifecycle, to applicationDidBecomeActive(:)...
        window = UIWindow(frame: UIScreen.main.bounds)  /// ...but this further accommodates 'going back in time' via device settings, without glitches
        window?.backgroundColor = defaultColour
        window?.makeKeyAndVisible()
        
        globalWindow = window!
        globalWindow.backgroundColor = defaultColour
        
        backgroundVC = UIViewController()
        backgroundVC.view.backgroundColor = .clear      ///defaultColour /// must match window's background colour, for rotating landscape->portrait
        backgroundVC.view.frame = globalWindow.frame
        
        getOrientationAtLaunch()                        ; print("launching on \(modelName) in \(launchOrientation) orientation")
        
        switch modelName { /// will handle all other device sizes (& update UIDevice.mapToDevice(:)) soon
        case "iPhone12,5" :
            portraitKeyboardHeight = 216
            landscapeKeyboardHeight = 162
        default:
            portraitKeyboardHeight = 246
            landscapeKeyboardHeight = 192
        }
        
        if statusBarUIView!.responds(to:#selector(setter: UIView.backgroundColor)) {
            statusBarUIView!.backgroundColor = .clear
        }
        
        UINavigationBar.appearance().barTintColor = grayOneConverted
        UINavigationBar.appearance().shadowImage = UIImage()
        //print(formattedDateString(Date(), roundedDown: false, prefix: "                      on", suffix: "", short: false))
        return true
    }
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        navController = UINavigationController(rootViewController: backgroundVC) /// temporary, unseen initial root view controller
        window?.rootViewController = navController                  //; print("VCs*: \(String(describing: nav Controller?.viewControllers))")
        
        timetableVC.setupAndPresent(vc: timetableVC)
        return true
    }
    
    var statusBarUIView: UIView? {
        if #available(iOS 13.0, *) {
            let tag = 38482458385
            if let statusBar = globalWindow.viewWithTag(tag) {
                return statusBar
            } else {
                //let statusBarView = UIView(frame: UIApplication.shared.statusBarFrame)   // deprecated
                let statusBarView = UIView(frame: (globalWindow.windowScene?.statusBarManager!.statusBarFrame)!)
                statusBarView.tag = tag
                globalWindow.addSubview(statusBarView)
                return statusBarView
            }
        } else if responds(to: Selector(("statusBar"))) {
            return value(forKey: "statusBar") as? UIView
        } else {return nil}
    }
}

