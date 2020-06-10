// SetTopVC         ･   collection-view-boilerplate   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension UICollectionViewController {
    
    func setTopViewController() {
        
        guard let viewControllers = self.navigationController?.viewControllers else { /// despite 's', should only contain 1 view controller at once (the one you go to)
            print("...could not bind view controller array")
            return
        }
        
        //print("view controllers: \(viewControllers)")
        
        guard viewControllers.count == 1 else {
            print("\n\nnavigation controller, somehow, contains more than one view controller at once  ... \n\nvc count: \(viewControllers.count)   \n\nvcs: \(viewControllers)'\n\n")
            return
        }
        
        guard let customVC = viewControllers[0] as? CollectionVC else {
            print("...could not downcast vc")
            return
        }
        
        topVC = customVC                        //; print("top vc is \(topVC.viewControllerType)")
    }
}

