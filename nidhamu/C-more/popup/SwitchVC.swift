// SwitchVC         ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

class PopupSwitchView: UIView {
    
    var popupSwitch: UISwitch = {
        let popupSwitch = UISwitch();       var switchColour = platinum
        popupSwitch.tintColor = switchColour
        popupSwitch.thumbTintColor = switchColour
        popupSwitch.onTintColor = iosSettingsGray
        popupSwitch.addTarget(self, action: #selector(switchFlipped), for: .valueChanged)
        popupSwitch.translatesAutoresizingMaskIntoConstraints = false
        return popupSwitch
    }()
    
    let popupLabel: UILabel = {
        let label = UILabel()
        label.text = "Recurring?"
        label.font = defaultTimetableCellFont
        label.backgroundColor = .clear
        label.textColor = cellTextDefaultColour
        label.numberOfLines = 1
        label.isUserInteractionEnabled = false
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {  super.init(frame: frame)
        addSubview(popupSwitch);    addSubview(popupLabel)
        let quarterHeight = self.frame.height / 4
        /**/
        addConstraint(NSLayoutConstraint(item: popupSwitch, attribute: .centerY, relatedBy: .equal,
                                         toItem: self, attribute: .centerY, multiplier: 1, constant: quarterHeight / 2))
        
        addConstraint(NSLayoutConstraint(item: popupLabel, attribute: .centerY, relatedBy: .equal,
                                         toItem: self, attribute: .centerY, multiplier: 1, constant: -quarterHeight))
        
        addConstraint(NSLayoutConstraint(item: popupSwitch, attribute: .centerX, relatedBy: .equal,
                                         toItem: self, attribute: .centerX, multiplier: 1, constant: 0))
        
        addConstraint(NSLayoutConstraint(item: popupLabel, attribute: .centerX, relatedBy: .equal,
                                         toItem: self, attribute: .centerX, multiplier: 1, constant: 0))
        
        popupSwitch.isOn = eventWillBeRecurring
    }
    
    @objc func switchFlipped(mySwitch: UISwitch, switchBool: Bool) {
        if mySwitch.isOn {eventWillBeRecurring = true} else {eventWillBeRecurring = false}
    }
    
    required init?(coder aDecoder: NSCoder) {fatalError("init(coder:) has not been implemented")}
}

