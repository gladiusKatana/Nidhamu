// GoToVC           ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension CollectionVC {
    
    func gotoView(vc: CollectionVC) {                                                       //print("\nshowing vc \(vc)")
        
        ///timetableVC.downcastLayout?.autoFitHeightScale = 1
        
        if topVC != vc {
            
            if topVC.backgroundColour != .white {/// if it is, seeing any other colour for a split second (ie, background view), is visually jarring. Status bar & nav bar are white in this app
                globalWindow.backgroundColor = vc.backgroundColour
                backgroundVC.view.backgroundColor = vc.backgroundColour                     ///print("reset background colours to \(vc.backgroundColour)")
            }
            
            setupTitleAndPresentViewController(vc: vc) { () -> () in
                ///(empty; may remove the completion handler from this method)
            }
            
        } else {print("you're already looking at the \(vc.viewControllerType)-view")}
    }
    
    func setupTitleAndPresentViewController(vc: CollectionVC, completion: () -> ()) {       //print("\ndismissing/presenting vc: \(vc)")
        setupAndPresent(vc: vc)
        completion()
    }
    
    func setupAndPresent(vc: UICollectionViewController) {                                  //print("setup and present")
        dismissNavController {
            let newVC = UINavigationController(rootViewController: vc)
            
            //if !tempGotoAnimationBool {
            newVC.modalPresentationStyle = .fullScreen  /// disabling this prevents CollectionVCs with non-nav-bar-embedded layouts from being presented
            //}
            //else {
            //newVC.modalPresentationStyle = . //...
            //}
            
            navController?.present(newVC, animated: tempRescalingBool, completion: nil)
            self.setTopViewController()// try commenting this, you should see: vc of type 'initial' was root vc when this method was called
        }
    }
    
    func dismissNavController(completion: @escaping () -> ()) {
        navController?.dismiss(animated: false, completion: nil)
        completion()
    }
}

