//
//  SettingTVController.swift
//  Rolling
//
//  Created by 李政恩 on 06/10/2017.
//  Copyright © 2017 Beichi Techonology. All rights reserved.
//

import UIKit
import StoreKit
import MessageUI
import CoreData

class SettingTVController: UITableViewController, MFMailComposeViewControllerDelegate {
    
    var settingTitleConnection = showData()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let settingCell = tableView.dequeueReusableCell(withIdentifier: "settingCell")! as UITableViewCell
        
        
        if indexPath.section == 0 {
        settingCell.textLabel?.text = showData().settingOption1/*[indexPath.section]*/[indexPath.row]
        } else if indexPath.section == 1 {
            settingCell.textLabel?.text = showData().settingOption2[indexPath.row]
        } else if indexPath.section == 2 {
            settingCell.textLabel?.text = showData().settingOption3[indexPath.row]
        }
        // Assign the content I want to show in the row
        
        
        if indexPath.section != 0 && indexPath.row != 0 {
            settingCell.accessoryType = .disclosureIndicator
            // Arrow indicator

        } else if indexPath.section == 0 && indexPath.row == 2 {
            settingCell.accessoryType = .disclosureIndicator
            // Arrow indicator
        }
        
        
        if indexPath.row == 0 {
            settingCell.textLabel?.font = UIFont(name: "HelveticaNeue-Bold", size: 17)
            //Make the font of the texts in the first row be bold.
            
            settingCell.isUserInteractionEnabled = false
            //Disable the first row of each section so that the user could not select it anymore.
            
        } else if indexPath.section == 0 && indexPath.row == 1 {
            settingCell.selectionStyle = UITableViewCellSelectionStyle.none
            //If I use "isUserInteractionEnabled" instead of "UITableViewCellSelectionStyle.none", the UISwitch in the second row of the first section could not work.
        } else {
            settingCell.textLabel?.font = UIFont.systemFont(ofSize: 17)
        }
    
        
        
        if (indexPath.section == 0 && indexPath.row == 1) {
            let pushNotificationSwitch = UISwitch(frame: CGRect(x: 0, y: 0, width: 100, height: 20)) as UISwitch
            
            
            //-----<Fetch the status of notification switch (below)>-----
            //It seems that I could not do it successfully when I tried to done it in another class, so I did it here, while the codes is a little bit tedious.
            var initialFetchTheStatusOfNotification : Bool?
            if initialFetchTheStatusOfNotification == nil {
                initialFetchTheStatusOfNotification = false
            }
            
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let Context = appDelegate.persistentContainer.viewContext
            let myRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "SettingPage")
            myRequest.returnsObjectsAsFaults = false
            
            do {
                let finalresult = try Context.fetch(myRequest)
                for data in finalresult as! [NSManagedObject] {
                    initialFetchTheStatusOfNotification = data.value(forKey: "notification") as? Bool
                    ConductedStatusOfNotification = initialFetchTheStatusOfNotification
                }
            } catch {
                print("ERROR: Could not demonstrate the status of switch of notification when loding the setting page.")
            }
            //-----<Fetch the status of notification switch (above)>-----

            
            pushNotificationSwitch.isOn = initialFetchTheStatusOfNotification!
            pushNotificationSwitch.isEnabled = true
            pushNotificationSwitch.isUserInteractionEnabled = true
            pushNotificationSwitch.addTarget(self, action: "activatePushNotification", for: .valueChanged );
            settingCell.accessoryView = pushNotificationSwitch
        }
        //Add an UISwitch in the right of the second row of the first section.
        //tutorial: https://stackoverflow.com/questions/35806062/identifying-a-uiswitch-in-uitableviewcell?utm_medium=organic&utm_source=google_rich_qa&utm_campaign=google_rich_qa
        
        return settingCell
    }
    
    
    var ConductedStatusOfNotification : Bool?
    func activatePushNotification() {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.persistentContainer.viewContext
        let DelAllReqVar = NSBatchDeleteRequest(fetchRequest: NSFetchRequest<NSFetchRequestResult>(entityName: "SettingPage"))
        
        do {
            try managedContext.execute(DelAllReqVar)
        }
        catch {
            print("Could not delete the data.")
        }
        
        let Entity = NSEntityDescription.entity(forEntityName: "SettingPage", in: managedContext)
        let newTime = NSManagedObject(entity: Entity!, insertInto: managedContext)
        
        if ConductedStatusOfNotification == false {
            newTime.setValue(true, forKey: "notification")
        } else {
            newTime.setValue(false, forKey: "notification")
        }
        
        do {
            try managedContext.save()
        } catch {
            print("Failed saving")
        }
    }
    //Change (delete and save) the status of notification switch.
    //It seems that I could not do it successfully when I tried to done it in another class, so I did it here, while the codes is a little bit tedious.
    
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        let headerHeight : CGFloat
        
        if section == 0 {
            headerHeight = 0.1
            //Hide the header of the table.
        } else {
            headerHeight = 21
        }
        
        return headerHeight
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 3
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if section == 0 {
            return 3
        } else if section == 1 {
            return 3
        } else if section == 2 {
            return 3
        } else {
            return 0
        }
        // Customize the number of row in each section.
    }

    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        /*if tableView.indexPathForSelectedRow?.row == 0 && tableView.indexPathForSelectedRow?.section == 1 {
            //performSegue(withIdentifier: "ShowTheSecretPicture", sender: self)
            let SecretAlertView = UIAlertController(title: "Secret Photo", message: "This is the girl the developer of this app like, and her name is Gaga. She is really beautiful.", preferredStyle: .alert)
            
            let image = UIImage(named: "JJ韓.jpg")
            SecretAlertView.addImage(image: image!)
            // If we want to creat a alternative member, we could start a new swift file, and create "extension" in it.
            // Insert the image content in text message part.
            
            let alertAction1 = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.default, handler: {ACTION in print("done")})
            
            SecretAlertView.addAction(alertAction1)
            self.present(SecretAlertView, animated: true, completion: nil)
        } else if tableView.indexPathForSelectedRow?.row == 1 {
            performSegue(withIdentifier: "DeveloperIntroduction", sender: self)
        } else if tableView.indexPathForSelectedRow?.row == 2 {
           
        }*/
        
    
        if tableView.indexPathForSelectedRow?.row == 2 && tableView.indexPathForSelectedRow?.section == 0 {
            performSegue(withIdentifier: "furtherDefineTheTime", sender: self)
        } else if tableView.indexPathForSelectedRow?.row == 1 && tableView.indexPathForSelectedRow?.section == 1 {
            performSegue(withIdentifier: "ShowTheGuide", sender: self)
        } else if tableView.indexPathForSelectedRow?.row == 2 && tableView.indexPathForSelectedRow?.section == 1 {
            orderOfSendAnEmailToReportTheProblem()
        } else if tableView.indexPathForSelectedRow?.row == 1 && tableView.indexPathForSelectedRow?.section == 2 {
            performSegue(withIdentifier: "DeveloperIntroduction", sender: self)
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    @IBAction func GoBackToMainPage(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        // 因為在navigation controller定義navigation bar的屬性之後，無法在其他view controller改變其屬性；網友的破解法須先隱藏原本的navigation bar，並以程式新增一個新的navigation bar，但此法複雜，而且若要在navigation bar上面增加navigation item，會很麻煩．因此，我們在此使用普通的push segue和unwind segue來取代原本的想法，並達到類似的效果．
    }
   

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    //-----<The codes below is used to construct the function of reporting problem with email>-----
    func orderOfSendAnEmailToReportTheProblem() {
        let mailComposeViewController = configureMailController()
        self.present(mailComposeViewController, animated: true, completion: nil)
        if MFMailComposeViewController.canSendMail() {
            self.present(mailComposeViewController, animated: false, completion: nil)
        } else {
            showMailError()
        }
    }
    //Activate the series of the commands of sending the email.
    
    func configureMailController() -> MFMailComposeViewController {
        let mailComposeVC = MFMailComposeViewController()
        mailComposeVC.mailComposeDelegate = self
        
        mailComposeVC.setToRecipients(["datototest@icloud.com"])
        mailComposeVC.setSubject("Reporting")
        
        return mailComposeVC
    }
    //Set the recipient and the title of this email automatically.
    
    func showMailError() {
        let sendMailErrorAlert = UIAlertController(title: "Could not send the email.", message: "Oops, something was wrong, please check your internet connection once again.", preferredStyle: .alert)
        let dismiss = UIAlertAction(title: "Ok", style: .default, handler: nil)
        sendMailErrorAlert.addAction(dismiss)
        self.present(sendMailErrorAlert, animated: true, completion: nil) //If you conform the protocol of NSObject instead of UIViewController, you could not finish this line successfully.
    }
    //Set a alert window so that it would remind the user when the device could not send the email successfully.
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
        //UIApplication.shared.keyWindow?.rootViewController?.dismiss(animated: true, completion: nil)
    }
    //Set this final step so that the device would go to the previous window when you finish sending the email.
    
    //tutorial: https://www.youtube.com/watch?v=fiFRxD0QQnY
    //-----<The codes above is used to construct the function of reporting problem with email>-----
}
