// GoToVC           ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension CollectionVC {
    
    
    func gotoView(vc: CollectionVC) {                                                       //print("\nshowing vc \(vc)")
        
        if topVC != vc || rePresentedVCManually {
            
            if vc == todoListVC {                                                           //print("time block being tested: \(timeBlock)")
                if let events = eventsAtIndexPath[timeBlock] {                              //eventsAt IndexPath[imeBlock]
                    todoListVC.downcastLayout!.rows = events.count
                }
            }
            
            setupTitleAndPresentViewController(vc: vc) { () -> () in
                reloadWithDelay(after: 0.02)
            }
            
        } else {print("you're already looking at the \(vc.vcType)-view   nav'd by button?\(rePresentedVCManually)")}
    }
    
    
    func setupTitleAndPresentViewController(vc: CollectionVC, completion: () -> ()) {       //print("\ndismissing/presenting") // vc: \(vc)
        setupAndPresent(vc: vc)
        completion()
    }
    
    
    func setupAndPresent(vc: UICollectionViewController) {
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            self.dismissNavController {
                let newVC = UINavigationController(rootViewController: vc)
                navController?.present(newVC, animated: false, completion: nil)
                self.setTopViewController()// try commenting this, you should see: vc of type 'initial' was root vc when this method was called
            }
        }
    }
    
    func dismissNavController(completion: @escaping () -> ()) {
        navController?.dismiss(animated: false, completion: nil)
        completion()
    }
    
}

