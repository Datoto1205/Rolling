//
//  ChoosingViewController.swift
//  Rolling
//
//  Created by 李政恩 on 21/09/2017.
//  Copyright © 2017 Beichi Techonology. All rights reserved.
//

import UIKit
import GoogleMobileAds
import Alamofire
import UserNotifications

class ChoosingViewController: UIViewController, GADBannerViewDelegate {
    
    @IBOutlet weak var BannerAD: GADBannerView!
    
    @IBAction func GetTheRandomDecisionOfRestaurant(_ sender: UIButton) {
        if Connectivity.isConnectedToInternet() {
            ////The device would see the connection of cellular connection as the disconnection if we use "Reachability.isConnectedToNetwork()" here.
            performSegue(withIdentifier: "GetTheRandomDecisionOfRestaurant", sender: self)
        } else {
            let alertOfNoInternet = UIAlertController(title: "Cellular Data is Turned Off", message: "Turn on cellular data or use Wi-Fi to access data.", preferredStyle: .alert)
            let alertAction1 = UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: {ACTION in print("done")})
            let alertAction2 = UIAlertAction(title: "Setting", style: UIAlertActionStyle.cancel, handler: {ACTION in self.GoToSettingInternet()
            })
            // "UIAlertActionStyle.cancel" style could show the buttom with bold font.
            
            
            
            alertOfNoInternet.addAction(alertAction2)
            alertOfNoInternet.addAction(alertAction1)
            
            self.present(alertOfNoInternet, animated: true, completion: nil)
        }
    }
    
    
    
    
    func GoToSettingInternet() {
        UIApplication.shared.open(URL(string:"App-Prefs:root=General&path=USAGE/CELLULAR_USAGE")!, options: [:], completionHandler: nil)
    }
    // Lead user to go to the cellular setting page.
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "MainPageBackgroundPhoto"))
        // 透過程式設定背景圖片能解決lag的問題
        
        let request = GADRequest()
        request.testDevices = [kGADSimulatorID]
        BannerAD.adUnitID = "ca-app-pub-1918665180874414/3343744332"
        BannerAD.rootViewController = self
        BannerAD.delegate = self
        BannerAD.load(GADRequest())
        //應用程式id:ca-app-pub-1918665180874414~5652366993
        
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge], completionHandler: {didAllow, error in})
        //Request user to enable the function of notification.
    }
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        UIApplication.shared.statusBarStyle = .default
        // 在info做過變更後，在此變更status bar的顏色至黑色系(系統預設)．
        // 每次執行App時，一個頁面只會被load一次，但一個頁面可以出現/消失很多次；所以更改status bar的顏色時，要在這裡變更，而非上面的"func viewDidLoad".
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














/*class SpecialImageView : UIImageView {
 var visualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .dark)) as UIVisualEffectView
 
 visualEffectView.frame = imageView.bounds
 
 imageView.addSubview
 
 
 
 
 }*/
