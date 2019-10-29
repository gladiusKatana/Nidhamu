// CollectionVC     ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit
import MessageUI

class CollectionVC: UICollectionViewController, UITextFieldDelegate, UIGestureRecognizerDelegate/*, MFMailComposeViewControllerDelegate*/ {
    
    var viewControllerType = CollectionViewType.days;               var downcastLayout: CustomFlowLayout?
    var colourIndex: Int?;                              var loopWeeks: Bool?; var demarcateWeeksByColour: Bool?
    var showLoadAndAppearIndicationInConsole = false;   var backgroundColour = UIColor.clear
    
    lazy var eventField: UITextField = {
        let eventField =  UITextField(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        eventField.font = UIFont.systemFont(ofSize: 15)
        eventField.borderStyle = UITextField.BorderStyle.roundedRect
        eventField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        eventField.keyboardType = UIKeyboardType.default
        eventField.returnKeyType = UIReturnKeyType.done
        eventField.autocorrectionType = UITextAutocorrectionType.no
        eventField.clearButtonMode = UITextField.ViewMode.whileEditing
        eventField.isEnabled = true
        ///eventField.clearsOnBeginEditing = true
        return eventField
    }()
    
    init(_ vcType: CollectionViewType, backgroundColour: UIColor, loopWeeks: Bool?, demarcateWeeksByColour: Bool?,
         colourIndex: Int?, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(collectionViewLayout: layout)
        self.viewControllerType = vcType
        self.backgroundColour = backgroundColour
        self.loopWeeks = loopWeeks
        self.demarcateWeeksByColour = demarcateWeeksByColour
        self.colourIndex = colourIndex
        self.downcastLayout = layout as? CustomFlowLayout
    }
    
    required init?(coder aDecoder: NSCoder) {fatalError("init(coder:) has not been implemented")}
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (downcastLayout!.loadsHorizontally) ? downcastLayout!.cols : downcastLayout!.rows
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return (downcastLayout!.loadsHorizontally) ? downcastLayout!.rows : downcastLayout!.cols
    }
    
    func registerAndReturnCell(_ collectionView: UICollectionView, at indexPath: IndexPath) -> CustomCell {
        collectionView.register(CustomCell.self, forCellWithReuseIdentifier: CustomCell.reuseIdentifier)
        var cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCell.reuseIdentifier, for: indexPath) as! CustomCell
        cell = doRestOfCellProcessing(cell: cell, indexPath: indexPath)
        return cell
    }
}

