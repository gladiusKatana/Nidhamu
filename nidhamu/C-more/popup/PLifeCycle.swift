// PopupLife        ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension PopupMenuVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()                                 //; collectionView.frame = downcastLayout!.customFrame
        
        collectionView.backgroundColor = iosSettingsGray    /// * experiment with:  why do i see this colour at all, upon rotation?
        collectionView.register(CustomCell.self, forCellWithReuseIdentifier: CustomCell.popupReuseIdentifier)
        collectionView?.isUserInteractionEnabled = true
        collectionView?.isScrollEnabled = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)                       //; collectionView.frame = downcastLayout!.customFrame!
        
        let hscale = timetableVC.downcastLayout!.autoFitHScale!
        collectionView?.scrollIndicatorInsets = UIEdgeInsets(top: self.downcastLayout!.cellHeight! * hscale, left: 0, bottom: 0, right: 0)
    }
    
    
    func removePopupMenuAndSwitch() {
        eventRecurringSwitchView.removeFromSuperview()                                  ///; print("removing switch")
        classifierVC.view.removeFromSuperview(); classifierVC.resignFirstResponder()
        classifierViewDisplayed = false
    }
    
    
    func dismissPopupMenuAndSave() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {                        ///print("now paths to process: \(pathsToProcess)")
            self.removePopupMenuAndSwitch()
            earliestEventAddress = defaultPathOutOfView
            selectedEventWillRecur = false
            
            timetableVC.reloadCV()                                                      ///; print("block events remaining now: \(eventsInBlockToBeProcessed)\n")
            timetableVC.tagEventsSinceLastLogin(layout: timetableVC.downcastLayout!)
            
            if pathsToProcess.isEmpty {
                defaultSaveData(saveDate: true, resetLastLogin: true, showDate: true, pryntEvents: true)
                AppUtility.lockOrientation(.all)                                        ///; print("rotated back")
            }
            else {defaultSaveData(saveDate: true, resetLastLogin: false, showDate: true, pryntEvents: false)}
        }
    }
}

