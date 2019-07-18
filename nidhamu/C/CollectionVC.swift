// CollectionVC     ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

class CollectionVC: UICollectionViewController, UITextFieldDelegate, UIGestureRecognizerDelegate {
    
    var vcType = CollectionViewType.days;       var downcastLayout: CustomFlowLayout?
    var colourIndex: Int?
    var demarcateWeeksByColour = false;         var loopWeeks = false
    
    lazy var eventField: UITextField = {
        let eventField =  UITextField(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        eventField.font = UIFont.systemFont(ofSize: 15)
        eventField.borderStyle = UITextField.BorderStyle.roundedRect
        eventField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        eventField.clearsOnBeginEditing = true
        eventField.keyboardType = UIKeyboardType.default
        eventField.returnKeyType = UIReturnKeyType.done
        eventField.autocorrectionType = UITextAutocorrectionType.no
        eventField.clearButtonMode = UITextField.ViewMode.whileEditing
        eventField.isEnabled = true
        return eventField
    }()
    
    init(_ vcType: CollectionViewType, loopWeeks: Bool, demarcateWeeksByColour: Bool,
         colourIndex: Int?, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(collectionViewLayout: layout)
        self.vcType = vcType
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
}

