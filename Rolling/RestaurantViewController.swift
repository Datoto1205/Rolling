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
    var resultDictionary = Dictionary<String, UIImage>()
    var imagesArray: [UIImage] = []
    var keysArray: [String] = []
    var numberOfSuccessAppend: Int = 0
    var downloadIndicatorExist: Bool = true
    var shouldPresentAlert: Bool = false
    
    let restaurantName = showData().restaurantNameArray
    let restaurantSites = showData().restaurantSitesArray
    //get the data about restaurant's name and discription from other class.
    
    
    func downloadPics(url: String) {
        let data = try? Data(contentsOf: URL(string: url)!)
        if data != nil {
            do {
                if let newImage = UIImage(data: data!) {
                    if newImage != nil {
                        imagesArray.append(newImage)
                        keysArray.append(url)
                        numberOfSuccessAppend += 1
                        print("The number of photos devices has downloaded successfully: \(numberOfSuccessAppend)")
                        print("\n")
                    } else {
                        print("Image is nil!")
                    self.present(self.showAlertAboutInternet(), animated: true, completion: nil)
                    }
                }
            } catch {
                print("Image could not be transferred to UIImage!")
                self.present(self.showAlertAboutInternet(), animated: true, completion: nil)
            }
        } else {
            print("Data is unfound!")
            self.present(self.showAlertAboutInternet(), animated: true, completion: nil)
        }
    }
    
    func showAlertAboutInternet() -> UIAlertController {
    let alertOfNoGreatInternet = UIAlertController(title: "Internet is instable!", message: "Check your connection of internet again to get access to the data.", preferredStyle: .alert)
    let alertAction1 = UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: {ACTION in
        print("Please Go Back!")})
        
        alertOfNoGreatInternet.addAction(alertAction1)
        return alertOfNoGreatInternet
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
        
        let refreshWork = {
            self.RestaurantViewList.reloadData()
            self.RestaurantViewList.refreshControl?.endRefreshing()
            print("Finish refresh the table!")
        }
        
        let globalQueue = DispatchQueue.global()
        globalQueue.async {
            DispatchQueue.global().sync {
                for i in 0...showData().URLOfRestaurantPics.count-1 {
                    self.downloadPics(url: showData().URLOfRestaurantPics[i])
                }
            }
            
            
            if self.numberOfSuccessAppend == showData().URLOfRestaurantPics.count {
                for i in (0...(self.numberOfSuccessAppend)-1) {
                    self.resultDictionary.updateValue(self.imagesArray[i], forKey: self.keysArray[i])
                }
                print("resultDictionary update success!")
            } else {
                print("resultDictionary update failed!")
                self.present(self.showAlertAboutInternet(), animated: true, completion: nil)
            }
            
            DispatchQueue.main.async(execute: refreshWork)
        }
        
        
    }
    
    
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurantName.count
        // Fetch the number of the components in the matrix.
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "specialCell", for: indexPath) as! RestaurantTableViewCell
        // Use the prototype cell again and again.
        // Actually, I could set different tableViewCell in different section.
        
        //cell.RestaurantPicture.image = UIImage(named: (restaurantName[indexPath.row] + ".jpg"))
        
        
        for (keysArray, imagesArray) in resultDictionary {
            if "\(keysArray)" == showData().URLOfRestaurantPics[indexPath.row] {
                cell.RestaurantPicture.image = imagesArray
            } else {
                print("Try to match with another key!")
            }
            downloadIndicatorExist = false
        }
        
        cell.RestaurantName.text! = restaurantName[indexPath.row]
        cell.RestaurantDescription.text! = restaurantSites[indexPath.row]
        
        let downloadIndicator = UIActivityIndicatorView(frame: CGRect(x: cell.RestaurantPicture.center.x, y: cell.RestaurantPicture.center.y, width: 20, height: 20))
        downloadIndicator.color = UIColor.gray
        downloadIndicator.startAnimating()
        if downloadIndicatorExist == true {
        cell.addSubview(downloadIndicator)
        } else {
        downloadIndicator.removeFromSuperview()
        }
        
        return (cell)
        // Show the every restaurant's picture, name and discription, and the order was depended on the array's order.
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        othersIndex = (RestaurantViewList.indexPathForSelectedRow?.row)!
        performSegue(withIdentifier: "FromResuaurantToIntroduction", sender: self)
        
        tableView.deselectRow(at: indexPath, animated: true)
        // Record the index of the row user selected
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
