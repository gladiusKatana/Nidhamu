// PopupVC          ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

class PopupMenuVC: UICollectionViewController, UIGestureRecognizerDelegate {
    
    var downcastLayout : CustomFlowLayout? 
    
    override init(collectionViewLayout layout: UICollectionViewLayout) {
        super.init(collectionViewLayout: layout)
        self.downcastLayout = layout as? CustomFlowLayout
    }
    
    required init?(coder aDecoder: NSCoder) {fatalError("init(coder:) has not been implemented")}
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (downcastLayout!.loadsHorizontally) ? downcastLayout!.cols : downcastLayout!.rows
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return (downcastLayout!.loadsHorizontally) ? downcastLayout!.rows : downcastLayout!.cols
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()                     //; collectionView.frame = downcastLayout!.customFrame
        
        collectionView.backgroundColor = .clear //.orange // * to experiment with later: why should i see any orange (if it's orange), upon rotation?
        collectionView.register(CustomCell.self, forCellWithReuseIdentifier: CustomCell.reuseIdentifier)
        collectionView?.isUserInteractionEnabled = true
        
        collectionView.bounces = false
        collectionView?.isScrollEnabled = true
        
        let hscale = timetableVC.downcastLayout!.autoFitHScale!
        collectionView?.scrollIndicatorInsets = UIEdgeInsets(top: self.downcastLayout!.cellHeight! * hscale, left: 0, bottom: 0, right: 0)
        collectionView.reloadData()
    }
    
//    override func viewDidAppear(_ animated: Bool) {
//        collectionView?.isUserInteractionEnabled = true
//    }
}

