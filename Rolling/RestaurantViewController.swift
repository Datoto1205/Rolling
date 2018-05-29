//
//  RestaurantViewController.swift
//  Rolling
//
//  Created by 李政恩 on 18/09/2017.
//  Copyright © 2017 Beichi Techonology. All rights reserved.
//

import UIKit
import GoogleMobileAds
var ExamineTheInternet = Reachability()

class RestaurantViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, GADBannerViewDelegate {
    // 若要在table view中顯示資料，需要在其viewController(非tableViewController)中設定使用UITableViewDelegate和UITableViewDataSource等兩個協議，並在storyBoard中連接．
    
    @IBOutlet weak var RestaurantViewList: UITableView!
    var adBannerView : GADBannerView!
    // Build a Banner object
    
    var connectToRestaurantClass = showData()
    var othersIndex = 0
    
    let restaurantName = showData().restaurantNameArray
    let restaurantSites = showData().restaurantSitesArray
    //get the data about restaurant's name and discription from other class.
    
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurantName.count
        // 回傳矩陣內元素個數.
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "specialCell", for: indexPath) as! RestaurantTableViewCell
        // 重複使用table的prototype cell
        
        cell.RestaurantPicture.image = UIImage(named: (restaurantName[indexPath.row] + ".jpg"))
        cell.RestaurantName.text! = restaurantName[indexPath.row]
        cell.RestaurantDescription.text! = restaurantSites[indexPath.row]
        
        
        
        return (cell)
        // Show the every restaurant's picture, name and discription, and the order was depended on the array's order.

    }

     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        othersIndex = (RestaurantViewList.indexPathForSelectedRow?.row)!
        performSegue(withIdentifier: "FromResuaurantToIntroduction", sender: self)
        
        tableView.deselectRow(at: indexPath, animated: true)
        // Record the index of the row user selected
    }

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        adBannerView = GADBannerView(adSize: kGADAdSizeSmartBannerPortrait)
        adBannerView.adUnitID = "ca-app-pub-1918665180874414/3343744332"
        adBannerView.delegate = self
        adBannerView.rootViewController = self
        if Reachability.isConnectedToNetwork() == true {
            adBannerView.load(GADRequest())
        }
        // Create AD banner
        
        
        //------------------(This code is necessary to immobilize the banner.)------------------
        func adViewDidReceiveAd(_ bannerView: GADBannerView) {
            let translateTransform = CGAffineTransform(translationX: 0, y: -bannerView.bounds.size.height)
            bannerView.transform = translateTransform
            
            UIView.animate(withDuration: 0.5) {
                bannerView.transform = CGAffineTransform.identity
            }
        }
        // Fixed the Banner on the top of table view, so it wouldn't move while user scroll the table view.
        //--------------------------------------------------------------------------------------

        
        if Reachability.isConnectedToNetwork() == true {
            status = true
        }
        // Record the status of internet.
        

        adViewDidReceiveAd(adBannerView)
    }
    
    
    //--------------------(This code is necessary to immobilize the banner.)--------------------
    var status = false
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if status == true {
            return adBannerView
        } else {
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if status == true {
            return adBannerView.frame.height
        } else {
            return CGFloat(0)
        }
    }
    // If user has connected to internet, the header of the tableview was shown Advertisement Banner, if user hasn't, the header of the tableview was shown nothing.
    //------------------------------------------------------------------------------------------
        

    
    
    
   
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let controller = segue.destination as! RestaurantStatusVController
        controller.myindex = othersIndex
    }

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    */

}
