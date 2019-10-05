// Email            ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit
import MessageUI

class EmailComposer: UIViewController, MFMailComposeViewControllerDelegate {
    
    lazy var emailComposeVC = MFMailComposeViewController()
    
    override func viewDidLoad() {                                                               //print("email Composer didLoad")
        super.viewDidLoad()
    }
    func canSendEmail() -> Bool {                                                               /// A wrapper function to indicate whether or not an email
        return MFMailComposeViewController.canSendMail()                                        /// can be sent from the user's device
    }
    
    func configureEmailComposeVC()  -> MFMailComposeViewController {
        emailComposeVC = MFMailComposeViewController()
//        emailComposeVC.mailComposeDelegate = self                                               ///as? MFMailComposeViewControllerDelegate
        let tempEmails = ["garthsnyder1@gmail.com"]
        emailComposeVC.setToRecipients(tempEmails)//(currentClientEmails)           //print("email recipient:\n\(currentClientEmails)")

        let path = archiveVC.createArchiveUrl()
        
        let messageText = "\(archiveEventDescriptions.count) new Tagged Events\nFrom\(archiveEventDateStrings.first!)\nTo\(archiveEventDateStrings.last!)"
        
        emailComposeVC.setMessageBody(messageText, isHTML: false)                               /// <p> is for isHTML: true
        
        emailComposeVC.setSubject("Export to Excel")
        
        do {
         let attachmentData = try Data(contentsOf: path)
             emailComposeVC.addAttachmentData(attachmentData, mimeType: "text/csv", fileName: "Tagged events (\(dateString)).csv")    ///application/vnd.ms-excel
             emailComposeVC.mailComposeDelegate = self                                           ///"text/comma-separated-values"
             self.present(emailComposeVC, animated: true
                 , completion: nil)
         } catch let error {
             print("We have encountered error \(error.localizedDescription)")
         }

        ///emailComposeVC.addAttachmentData([path] , mimeType: "image/.jpeg", fileName: "image.jpeg")
        return emailComposeVC
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController,
                               didFinishWith result: MFMailComposeResult, error: Error?) {      print("\nEMAIL dismissed📪\n")
        
        /*navigationController?.setNavigationBarHidden(false, animated: false)*/
        
        backgroundVC.view.removeFromSuperview()
        emailComposer.emailComposeVC.view.removeFromSuperview()
        
        /*
//        controller.dismiss(animated: true) ///timetableVC.navigationController?.dismiss(animated: false, completion: nil)
        
//        navController!.dismiss(animated: false, completion: nil)
        
//        topVC.setupTitleAndPresentViewController(vc: timetableVC) { () -> () in }
        
//        self.dismiss(animated: true) ///timetableVC.navigationController?.dismiss(animated: false, completion: nil)
//        topVC.setupNavBarButtons(grayTwo, atIndex: 1)
//        controller.resignFirstResponder()
//        topVC.gotoView(vc: timetableVC)*/
    }
}

extension CollectionVC {
    
    func presentEmail() { print("\n📪EMAIL\n")
        
        if emailComposer.canSendEmail() {
            emailComposer.emailComposeVC = emailComposer.configureEmailComposeVC()
            
            backgroundVC.view.backgroundColor = .white
            UIApplication.shared.keyWindow!.addSubview(backgroundVC.view)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
                UIApplication.shared.keyWindow!.addSubview(emailComposer.emailComposeVC.view)
            }
            
/*
//            navigationController?.setNavigationBarHidden(true, animated: false)
//            topVC.view.addSubview(emailComposer.emailComposeVC.view)
            
//            self.navigationController?.present(emailComposer.emailComposeVC,
//                                               animated: true, completion: nil) ///try with completion: completion (calls presentEmail 2x)
            
//            present(emailComposer.emailComposeVC, animated: true, completion: nil)///try with completion: completion (calls sendMessageBasedOnSetting 2x)
            
//            self.view.addSubview(emailComposer.emailComposeVC.view)*/
        }
        else {                                                                     //print("\nemail did not work yet\n")
            let alert = UIAlertController(title: "Cannot Send Email", message: "Your device is not able to send email.\nNOTE: If you have not installed the default Mail application for iOS, try simply installing Mail from the App Store, then closing and re-opening this app.", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .`default`, handler: { _ in
                NSLog("The \"OK\" alert occured.")
            }))
            present(alert, animated: true, completion: nil)
        }
    }
}


extension CollectionVC {
    
    func createArchiveUrl() -> URL {
        
        dateString = formattedDateString(Date(), roundedDown: false, showYear: true,
                                             prefix: "", suffix: "", dateFormat: .archiveCSVTitle)
        
        fileName = "Tagged events (\(dateString)).csv" ///don't insert a space after "as of" : formattedDateString(:) already builds one in

        var returnPath = NSURL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent("☹️")
        
        if let path = NSURL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent(fileName) {
            
            var csvText = ""
            
            csvText.append("Description; Status; Date\n")
            
            var i = 0
            for _ in archiveEventDescriptions {
                csvText.append("\(archiveEventDescriptions[i]);\(archiveEventStatusStrings[i]);\(archiveEventDateStrings[i])\n")
                i += 1
            }
            
            do {
                try csvText.write(to: path, atomically: true, encoding: String.Encoding.utf8)
            } catch {
                print("Failed to create csv file")
                print("\(error)")
            }
            
            returnPath = path
        }
        
        else {print("failed to create url")}
        
        return returnPath ?? NSURL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent("☹️")!
    }
}

