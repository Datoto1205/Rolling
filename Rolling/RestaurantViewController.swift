//  Created by Li Cheng-En.
//  Copyright © 2018. All rights reserved.
//

import UIKit
import GoogleMobileAds
import Alamofire

var status = false

class RestaurantViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, GADBannerViewDelegate {
    // If I want to show a tableView in a viewController, I need to set two protocols, which included "UITableViewDelegate" and "UITableViewDataSource", and I need to connect it to the viewController in the "Main.storyboard" file. However, if I use tableViewController directly, I did not need to do this tedious procedure.
    
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
        // Fetch the number of the components in the matrix.
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "specialCell", for: indexPath) as! RestaurantTableViewCell
        // Use the prototype cell again and again.
        // Actually, I could set different tableViewCell in different section.
        
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
        if Connectivity.isConnectedToInternet() {
            adBannerView.load(GADRequest())
        }
        // Create AD banner
        
        
        //-----(This code is necessary to immobilize the banner.)-----
        func adViewDidReceiveAd(_ bannerView: GADBannerView) {
            let translateTransform = CGAffineTransform(translationX: 0, y: -bannerView.bounds.size.height)
            bannerView.transform = translateTransform
            
            UIView.animate(withDuration: 0.5) {
                bannerView.transform = CGAffineTransform.identity
            }
        }
        // Fixed the Banner on the top of table view, so it wouldn't move while user scroll the table view.
        
        if Connectivity.isConnectedToInternet() {
            status = true
        }
        // Record the status of internet.
        
        adViewDidReceiveAd(adBannerView)
        //-----(This code is necessary to immobilize the banner.)-----
    }
    
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
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func downloadPics(url: String) -> UIImage {
        let data = try? Data(contentsOf: URL(string: url)!)
        return UIImage(data: data!)!
        // This function was ritten by some unknown friends on the internet.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let controller = segue.destination as! RestaurantStatusVController
        controller.myindex = othersIndex
        // Convey the value to different viewController.
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     */
    
}
