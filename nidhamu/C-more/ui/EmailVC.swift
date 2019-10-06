// EmailVC          ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
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
        emailComposeVC.mailComposeDelegate = self                                               ///as? MFMailComposeViewControllerDelegate
        let tempEmails = ["garthsnyder1@gmail.com"]
        emailComposeVC.setToRecipients(tempEmails)//(currentClientEmails)           //print("email recipient:\n\(currentClientEmails)")
        
        let path = archiveVC.createArchiveUrl()
        
        let messageText = "\(archiveEventDescriptions.count) new Tagged Events\nFrom\(archiveEventDateStrings.first!)\nTo\(archiveEventDateStrings.last!)"
        
        emailComposeVC.setMessageBody(messageText, isHTML: false)                               /// <p> is for isHTML: true
        
        emailComposeVC.setSubject("Export to Excel")
        
        do {
            let attachmentData = try Data(contentsOf: path)
            emailComposeVC.addAttachmentData(attachmentData, mimeType: "text/csv", fileName: "Tagged events (\(dateString)).csv")    ///"text/comma-separated-values"   ///application/vnd.ms-excel
            ///emailComposeVC.mailComposeDelegate = self
            self.present(emailComposeVC, animated: true
                , completion: nil)
        } catch let error {
            print("We have encountered error \(error.localizedDescription)")
        }
        
        return emailComposeVC
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController,
                               didFinishWith result: MFMailComposeResult, error: Error?) {      //print("\nEMAIL dismissed📪\n")
        
        backgroundVC.view.removeFromSuperview()
        emailComposer.emailComposeVC.view.removeFromSuperview()
    }
}

