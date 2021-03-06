//
//  ViewController.swift
//  globalstart
//
//  Created by Muluken on 2/17/17.
//  Copyright © 2017 globalstart. All rights reserved.
//

import UIKit
import MessageUI

class ViewController: UIViewController, MFMailComposeViewControllerDelegate {
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nav = self.navigationController?.navigationBar
        nav?.barStyle = UIBarStyle.black
       
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 38, height: 38))
        imageView.contentMode = .scaleAspectFit
        let image = UIImage(named: "img_take_action.jpg")
        imageView.image = image
        navigationItem.titleView = imageView
        nav?.tintColor = UIColor.white
        nav?.backgroundColor = UIColor(red: 38.0/255.0, green: 64.0/255.0, blue: 103.0/255.0, alpha: 1.0)
        nav?.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.orange]
        
    }
    
   

    
    
    @IBAction func testimony(_ sender: Any) {
        
    }
    
    @IBAction func contactUs(_ sender: Any) {
    let alertController = UIAlertController(title: "Find Us", message: "", preferredStyle: .alert)
                let buttonOne = UIAlertAction(title: "Find Us On Facebook", style: .default, handler: { (action) -> Void in
                    let url = URL(string: "https://www.facebook.com/GlobalStart-120065652005616/?modal=admin_todo_tour")!
                    if UIApplication.shared.canOpenURL(url) {
                        UIApplication.shared.open(url, options: [:], completionHandler: nil)
                        //If you want handle the completion block than
                        UIApplication.shared.open(url, options: [:], completionHandler: { (success) in
                            print("Open url : \(success)")
                        })
                    }
                })
                let buttonThree = UIAlertAction(title: "Email Us", style: .default, handler: { (action) -> Void in

                    
                    
                    let mailComposeViewController = self.configureMailController()
                    if MFMailComposeViewController.canSendMail() {
                        self.present(mailComposeViewController, animated: true, completion: nil)
                    } else {
                        self.showMailError()
                    }
                    
                    
//                            let vc = self.storyboard?.instantiateViewController(withIdentifier: "EmailUsViewController") as! EmailUsViewController
//                           //  vc.recCatIdArray = categoryIdArray[indexPath.row]
//                            //   self.navigationController?.pushViewController(vc, animated: true)
//                            self.present(vc, animated: true, completion: nil)
//                    let url = URL(string: "http://www.globalstart.cc")!
//                    if UIApplication.shared.canOpenURL(url) {
//                        UIApplication.shared.open(url, options: [:], completionHandler: nil)
//                        //If you want handle the completion block than
//                        UIApplication.shared.open(url, options: [:], completionHandler: { (success) in
//                            print("Open url : \(success)")
//                        })
//                    }
                })
        
                let buttonCancel = UIAlertAction(title: "OK", style: .cancel) { (action) -> Void in
                    print("Cancel Button Pressed")
                }
        
                alertController.addAction(buttonOne)
                alertController.addAction(buttonThree)
                alertController.addAction(buttonCancel)
        
                present(alertController, animated: true, completion: nil)
    }
    
    func configureMailController() -> MFMailComposeViewController {
        let mailComposerVC = MFMailComposeViewController()
        mailComposerVC.mailComposeDelegate = self
        
        mailComposerVC.setToRecipients(["mobilizeteens@gmail.com"])
//        mailComposerVC.setSubject("  ")
//        mailComposerVC.setMessageBody("Share Your story with us.", isHTML: false)
        
        return mailComposerVC
    }
    
    func showMailError() {
        let sendMailErrorAlert = UIAlertController(title: "Could not send email", message: "Your device could not send email", preferredStyle: .alert)
        let dismiss = UIAlertAction(title: "Ok", style: .default, handler: nil)
        sendMailErrorAlert.addAction(dismiss)
        self.present(sendMailErrorAlert, animated: true, completion: nil)
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }

    @IBAction func aboutUs(_ sender: Any) {
    
   
    
        let Alert = UIAlertController(title: "About Us", message: "Global Start is for anyone in the world who would like to start a Christian youth movement. Pray and go through each section of the app. The “Take Action” buttons will reveal action steps and questions for you to answer that will help you develop a Movement Plan for reaching young people with the good news of Jesus Christ. Share your stories, ideas, and resources in the app, and look at the news section regularly, to be connected to a global community of people who desire to mobilize teenagers to impact their world.", preferredStyle: .alert)
        
        let DismissButton = UIAlertAction(title: "Close", style: .cancel, handler: {
            
            (alert: UIAlertAction!) -> Void in
            
        })
        
        Alert.addAction(DismissButton)
        
        self.present(Alert, animated: true, completion: nil)
        
    }
    

    override var prefersStatusBarHidden : Bool {
        return true
    }
    
     func autologin ()  {
       
    
    }
}
