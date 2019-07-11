//  PopupVC.swift
//  nidhamu  ∙  1st commit July. 08, 2019  ∙  Created by Garth Snyder, aka gladiusKatana ⚔️
import UIKit

class PopupMenuVC: UICollectionViewController {
    
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
        collectionView.bounces = false
        collectionView?.isScrollEnabled = true
        collectionView?.isUserInteractionEnabled = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let scaleMult = timetableVC.downcastLayout!.autoFitHScale!
        collectionView?.scrollIndicatorInsets = UIEdgeInsets(top: self.downcastLayout!.cellHeight! * scaleMult, left: 0, bottom: 0, right: 0)
        collectionView.reloadData()
    }
}

