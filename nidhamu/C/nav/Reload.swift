//  Reload.swift
//  nidhamu  ∙  1st commit July. 08, 2019  ∙  Created by Garth Snyder, aka gladiusKatana ⚔️
import UIKit

extension UICollectionViewController {
    
    func setupTitleAndPresentViewController(vc: CollectionVC, completion: () -> ()) {           //print("\ndismissing/presenting") // vc: \(vc)
        setupAndPresent(vc: vc)
        completion()
    }
    
    func setupAndPresent(vc: UICollectionViewController) {
        setupViewTitle("", numLines: 1, alignment: .left)                           //* header titles is changed promptly from "" anyway
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
    
    
    //-------------------------------------------------------------------------------------------------------
    @objc func reloadCV() {
        self.collectionView.reloadData()                                                        //; print("↺")
    }
    
    func reloadWithDelay(after timeDelay: Double) {
        DispatchQueue.main.asyncAfter(deadline: .now() + timeDelay) {
            self.reloadCV()
        }
    }
}

