//  Created by Li Cheng-En.
//  Copyright © 2018. All rights reserved.
//

import UIKit
import GoogleMobileAds
import Alamofire
import UserNotifications
import CoreData

class ChoosingViewController: UIViewController, GADBannerViewDelegate {
    
    @IBOutlet weak var BannerAD: GADBannerView!
    
    @IBAction func GetTheRandomDecisionOfRestaurant(_ sender: UIButton) {
        
        if Connectivity.isConnectedToInternet() {
            //The device would see the connection of cellular connection as the disconnection if we use "Reachability.isConnectedToNetwork()" here.
            //We use Cocoapods here.
            performSegue(withIdentifier: "GetTheRandomDecisionOfRestaurant", sender: self)
        } else {
            let alertOfNoInternet = UIAlertController(title: "Cellular Data is Turned Off", message: "Turn on cellular data or use Wi-Fi to access data.", preferredStyle: .alert)
            let alertAction1 = UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: {ACTION in
                print("done")})
            let alertAction2 = UIAlertAction(title: "Setting", style: UIAlertActionStyle.cancel, handler: {ACTION in
                self.GoToSettingInternet()
            })
            // "UIAlertActionStyle.cancel" style could show the buttom with bold font.
            
            alertOfNoInternet.addAction(alertAction2)
            alertOfNoInternet.addAction(alertAction1)
            
            self.present(alertOfNoInternet, animated: true, completion: nil)
        }
    }
    
    func GoToSettingInternet() {
        UIApplication.shared.open(URL(string:"App-Prefs:root=General&path=USAGE/CELLULAR_USAGE")!, options: [:], completionHandler: nil)
        // Lead user to go to the cellular setting page.
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "MainPageBackgroundPhoto"))
        // We could solve the problem of lagging if we use programming to set the background picture.
        
        let request = GADRequest()
        request.testDevices = [kGADSimulatorID]
        BannerAD.adUnitID = "ca-app-pub-1918665180874414/3343744332"
        BannerAD.rootViewController = self
        BannerAD.delegate = self
        BannerAD.load(GADRequest())
        //Application id:ca-app-pub-1918665180874414~5652366993
        
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge], completionHandler: {didAllow, error in})
        //Request user to enable the function of notification.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        UIApplication.shared.statusBarStyle = .default
        // Change the color of status bar to black. (system default)
        // When we run the App each time, the device only would load a page for one time. However, a page could appear and disappear for several times. Thus, if we want to change the color of status bar, we need to add the codes of it here instead of viewDidLoad, so that the color could be changed continually.
        
        //-----<Fetch the status of notification switch (below)>-----
        //It seems that I could not do it successfully when I tried to done it in another class, so I did it here, while the codes is a little bit tedious.
        var checkedStatusOfNotification : Bool?
        var initialFetchTimeOfNotification : Date?
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let Context = appDelegate.persistentContainer.viewContext
        let myRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "SettingPage")
        myRequest.returnsObjectsAsFaults = false
        let myRequest2 = NSFetchRequest<NSFetchRequestResult>(entityName: "Time")
        myRequest2.returnsObjectsAsFaults = false
        
        do {
            let finalresult = try Context.fetch(myRequest)
            for data in finalresult as! [NSManagedObject] {
                checkedStatusOfNotification = data.value(forKey: "notification") as? Bool
            }
        } catch {
            print("Could not check the status of notification.")
        }
        
        do {
            let finalresult = try Context.fetch(myRequest2)
            for data in finalresult as! [NSManagedObject] {
                initialFetchTimeOfNotification = data.value(forKey: "notificationtime") as? Date
            }
        } catch {
            print("Could not check the existed time of notification.")
        }
        //-----<Fetch & Check the status of notification switch (above)>-----
        
        var calendar = Calendar.current
        calendar.timeZone = TimeZone(secondsFromGMT: 8)!
        if initialFetchTimeOfNotification != nil {
            let components = calendar.dateComponents([ .hour, .minute], from: initialFetchTimeOfNotification!)
            //print(components) <= used to check the error
            // Change the format of the time we fetch from the coreData.
            
            let trigger = UNCalendarNotificationTrigger(dateMatching:
                components, repeats: true)
            // Set the trigger of notification on a specific time point.
            
            let content = UNMutableNotificationContent()
            content.title = "Did not know what should eat again?"
            content.body = "Enter the rolling and use the magic to solve your problem immediately!"
            content.badge = 1
            content.sound = UNNotificationSound.default()
            // Set the content of notification.
            
            let request = UNNotificationRequest(identifier: "specialSwitch", content: content, trigger: trigger)
            if checkedStatusOfNotification == true {
                UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
            } else {
                print("Disable the function of notification!")
            }
        }
        //Activate the function of notification if the switch was turned on.
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func Setting(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "goToSetting", sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let backItem = UIBarButtonItem()
        backItem.title = " "
        navigationItem.backBarButtonItem = backItem
        // Change the backitem title in the next view.
        
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        UIApplication.shared.statusBarStyle = .lightContent
        // Change the style of status bar into light style.
    }
    
}



class Connectivity {
    
    class func isConnectedToInternet() -> Bool {
        return NetworkReachabilityManager()!.isReachable
    }
    //This special small class is used to detect the internet connection instead of wifi connection, it would not work without the help of Alamofire.
    
}
