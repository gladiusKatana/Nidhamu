// RefreshUI        ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension UICollectionViewController {
    
    func setupTitleAndPresentViewController(vc: CollectionVC, completion: () -> ()) {   //print("\ndismissing/presenting") // vc: \(vc)
        setupAndPresent(vc: vc)
        completion()
    }
    
    func setupAndPresent(vc: UICollectionViewController) {
        setupViewTitle("", numLines: 1, alignment: .left)                               //* header titles is changed promptly from "" anyway
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            self.dismissNavController {
                let newVC = UINavigationController(rootViewController: vc)
                navController?.present(newVC, animated: false, completion: nil)
            }
        }
    }
    
    func dismissNavController(completion: @escaping () -> ()) {
        navController?.dismiss(animated: false, completion: nil)
        completion()
    }
    
    @objc func re_Reload__PossiblyAfterRe_Presenting(vc: CollectionVC) {                // reload again (and /or potentially re-present)
        classifierVC.view.removeFromSuperview()                                         // for visual continuity
        
        if previousOrientation == "landscape" && currentOrientation == "portrait"       // (needed when, e.g., toggling views while in landscape)
            || firstReenteredForeground {
            rePresentedVCFromButton = false                            ; print("\n---------------------presented then reloaded \(vc.vcType) cv ")
            
            setupTitleAndPresentViewController(vc: vc) { () -> () in
                previousOrientation = currentOrientation               //* check whether able to factor out
                reloadWithDelay(after: 0.05)                           //+ 0.1 //+ 0.2  //time delays previously tried, on an iPhone 7*
            }
        } else {
            previousOrientation = currentOrientation
            reloadCV() //reloadWithDelay(after: 0.02)//?use time delay, as in above completion block? (*will test over time, with different devices)
        }
    }
    
    //--------------------------------------------------------------------------------------------------------
    @objc func reloadCV() {
        self.collectionView.reloadData()                                                        //; print("↺")
    }
    
    func reloadWithDelay(after timeDelay: Double) {
        DispatchQueue.main.asyncAfter(deadline: .now() + timeDelay) {
            self.reloadCV()
        }
    }
}

