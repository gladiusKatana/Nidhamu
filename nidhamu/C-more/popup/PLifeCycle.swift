// PLifeCycle       ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension PopupMenuVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()                                 //; collectionView.frame = downcastLayout!.customFrame
        
        collectionView.backgroundColor = iosSettingsGray    /// * experiment with:  why do i see this colour at all, upon rotation?
        collectionView.register(CustomCell.self, forCellWithReuseIdentifier: CustomCell.popupReuseIdentifier)
        collectionView?.isUserInteractionEnabled = true
        
        collectionView?.isScrollEnabled = false
        collectionView?.showsHorizontalScrollIndicator = false
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)                       //; collectionView.frame = downcastLayout!.customFrame!
        
        ///let hscale = timetableVC.downcastLayout!.autoFitHScale!
        ///collectionView?.scrollIndicatorInsets = UIEdgeInsets(top: self.downcastLayout!.cellHeight! * hscale, left: 0, bottom: 0, right: 0)  // obviated : all cells visible; no rotating in task-tagging mode
    }
    
    
    func dismissTaggingWizard() {
        taskRecurringSwitchView.removeFromSuperview()       ///; print("removing switch")
        taskTaggingViewController.view.removeFromSuperview(); taskTaggingViewController.resignFirstResponder()
        taggingViewDisplayed = false
    }
    
}

