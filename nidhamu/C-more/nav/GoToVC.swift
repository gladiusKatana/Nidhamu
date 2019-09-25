// GoToVC           ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension CollectionVC {
    
    
    func gotoView(vc: CollectionVC) {                                                       //print("\nshowing vc \(vc)")
        
        if topVC != vc {
            
            setupTitleAndPresentViewController(vc: vc) { () -> () in
                ///(empty; may remove the completion handler from this method)
            }
            
        } else {print("you're already looking at the \(vc.vcType)-view")}
    }
    
    
    func setupTitleAndPresentViewController(vc: CollectionVC, completion: () -> ()) {       //print("\ndismissing/presenting") // vc: \(vc)
        setupAndPresent(vc: vc)
        completion()
    }
    
    
    func setupAndPresent(vc: UICollectionViewController) {
        dismissNavController {
            let newVC = UINavigationController(rootViewController: vc)
            navController?.present(newVC, animated: false, completion: nil)
            self.setTopViewController()// try commenting this, you should see: vc of type 'initial' was root vc when this method was called
        }
    }
    
    func dismissNavController(completion: @escaping () -> ()) {
        navController?.dismiss(animated: false, completion: nil)
        completion()
    }
}

