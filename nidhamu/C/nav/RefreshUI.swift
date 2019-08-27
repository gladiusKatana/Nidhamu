// RefreshUI        ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension CollectionVC {
    
    func setupTitleAndPresentViewController(vc: CollectionVC, completion: () -> ()) {       //print("\ndismissing/presenting") // vc: \(vc)
        setupAndPresent(vc: vc)
        completion()
    }
    
    func setupAndPresent(vc: UICollectionViewController) {
        setupViewTitle("", numLines: 1, alignment: .left)                                   //* header title is changed promptly from "" anyway
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
    
    func rePresentThenReload(vc: CollectionVC) {                          // reload again (and /or potentially re-present)
//        if previousOrientation == "landscape" && currentOrientation == "portrait" // (needed when, e.g., toggling views while in landscape)
//            || firstReenteredForeground
//        {
            rePresentedVCFromButton = false
        
            //if vcType == .hours {print("\n---------------------presented then reloaded \(vc.vcType) cv ")}
            
            setupTitleAndPresentViewController(vc: vc) { () -> () in
                previousOrientation = currentOrientation                //* check whether able to factor out
                reloadWithDelay(after: 0.05)                            //+ 0.1 //+ 0.2  //time delays previously tried, on an iPhone 7*
                //reloadCV()
            }
        
//        } else {
//            previousOrientation = currentOrientation
//            reloadCV() //reloadWithDelay(after: 0.02)//?use delay, as in above completion block? (*will test over time, with different devices)
//        }
    }
    
    //----------------------------------------------------------------- reloading
    @objc func reloadCV() {
        self.collectionView.reloadData()                                //; print("↺")
    }
    
    func reloadWithDelay(after timeDelay: Double) {
        DispatchQueue.main.asyncAfter(deadline: .now() + timeDelay) {
            self.reloadCV()
        }
    }
}

