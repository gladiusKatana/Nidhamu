// NavBar           ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension CollectionVC {
    
    func setupNavBarButtons(_ withCustomColour: UIColor?, atIndex: Int?) {
        
        let timetableButton = setupButton(selector: #selector(buttonWrapperMethodforTimetableVC), title: "timetableImage")
        //let todoListButton = setupButton(selector: #selector(buttonWrapperMethodforTodoListVC), title: "calendarImage")
        let reloadButton = setupButton(selector: #selector(reloadCVWrapperMethod), title: "reloadButton")
        
        navigationItem.rightBarButtonItems = [timetableButton, reloadButton]
        
        let barButtonColours = [graySeven]
        
        for button in navigationItem.rightBarButtonItems! {
            if button == reloadButton {button.tintColor = .clear}
            else {
                if let index = navigationItem.rightBarButtonItems?.firstIndex(of: button) {
                    button.tintColor = barButtonColours[index]
                }
            }
        }
        
        if let customColour = withCustomColour {
            if let colourIndex = atIndex {
                navigationItem.rightBarButtonItems?[colourIndex].tintColor = customColour
            } //else {print("<no custom colour index>")}
        } //else {print("<no custom colour>")}
    }
    
    func setupButton(selector: Selector, title: String) -> UIBarButtonItem {
        let image = UIImage(named: title)?.withRenderingMode(.alwaysTemplate)
        let button = UIBarButtonItem(image: image, landscapeImagePhone: image, style: .plain, target: self, action: selector)
        return button
    }
    
    
    @objc func reloadCVWrapperMethod() {
        
        self.downcastLayout!.autoFitHScale = 1
        
        reloadCV(); print("↺")
        
        
        
//        if selectedTimeBlockPath[1] >= 18 {                                                 //print("resizing h-scale")
//            DispatchQueue.main.asyncAfter(deadline: .now()) {  //+ 0.5// [weak self] in
//                keyboardCellHeightMultiple = Int(keyboardHeight / timetableVC.downcastLayout!.cellHt)
//                
//                //print("\nkeyboard height: \(keyboardHeight) (\(keyboardCellHeightMultiple) cells tall)")
//                
//                let rows = self.downcastLayout!.rows
//                let gap = CGFloat(5) / (self.downcastLayout!.cellHt)                   // extra gap for better aesthetics
//                self.downcastLayout!.autoFitHScale =
//                    (CGFloat(rows - keyboardCellHeightMultiple) - gap) / CGFloat(rows)
//                
//                print("scale: \(self.downcastLayout!.autoFitHScale!)")
//                
//                //topVC.reloadCV() //; print("reloaded after height change\n")
//                topVC.reloadWithDelay(after: 0) //0.3
//            }
//            self.downcastLayout!.autoFitHScale = 1
//            print("k[1]")
//        }
    }
    
    @objc func buttonWrapperMethodforTimetableVC() {presentViaVCButton(vc: timetableVC)}
    @objc func buttonWrapperMethodforTodoListVC() {presentViaVCButton(vc: todoListVC)}
    
    func presentViaVCButton(vc: CollectionVC) {
        rePresentedVCFromButton = true
//        DispatchQueue.main.asyncAfter(deadline: .now()) {
//            self.
        gotoView(vc: vc)
//        }
    }
    
}

