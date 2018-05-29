//
//  ResuaurantResultVController.swift
//  Rolling
//
//  Created by 李政恩 on 22/09/2017.
//  Copyright © 2017 Beichi Techonology. All rights reserved.
//

import UIKit

class ResuaurantResultVController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    // I need to add "UITableViewDelegate &  UITableViewDataSource" if I want to add some properties in view controller.
    
    
    @IBAction func RestaurantResultAgain(_ sender: UIButton) {
        decisionFirst()
    }
    
    @IBOutlet weak var RestaurantResultName: UILabel!
    @IBOutlet weak var RestaurantResultImage: UIImageView!
    
    @IBOutlet weak var kindOfMealSegmentedControlOutlet: UISegmentedControl!
    @IBOutlet weak var priceLevelOfMealSegmentedControlOutlet: UISegmentedControl!
    
    var StatusOfKindOfMeal : Double?
    var StatusOfPriceLevel : Double?
    var firstLoadThisPage : Bool?
    var advancedSearchOptionSwitchStatus : Bool?
    
    @IBAction func advancedSearchOptionSwitch(_ sender: UISwitch) {
        if (sender.isOn == true) {
            advancedSearchOptionSwitchStatus = true
        } else {
            advancedSearchOptionSwitchStatus = false
        }
    }
    
    @IBAction func kindOfMealSegmentedControlAction(_ sender: UISegmentedControl) {
        switch kindOfMealSegmentedControlOutlet.selectedSegmentIndex {
        case 0:
            StatusOfKindOfMeal = 1
        case 1:
            StatusOfKindOfMeal = 2
        case 2:
            StatusOfKindOfMeal = 3
        default:
            break
        }
    }
    
    @IBAction func priveLevelOfMealSegmentedControlAction(_ sender: UISegmentedControl) {
        switch priceLevelOfMealSegmentedControlOutlet.selectedSegmentIndex {
        case 0:
            StatusOfPriceLevel = 1
        case 1:
            StatusOfPriceLevel = 2
        case 2:
            StatusOfPriceLevel = 3
        default:
            break
        }
    }
    
    
    
    var changingConnection = ChoosingNVController()
    
    func decisionFirst() {
        
        
        let currentDate = Date()
        let currentTime = Calendar.current
        let currentSeconds = currentTime.component(.second, from: currentDate)
        let currentMinutes = currentTime.component(.minute, from: currentDate)
        // 上面四行是取出目前的秒數和分鐘數，並加入下面的隨機亂數程式中，降低抽取到相同餐廳的機率．
        
        firstLoadThisPage = false
        
        if advancedSearchOptionSwitchStatus == true {
            if firstLoadThisPage == false {
                let b = showData().breakfastList.filter(showData().cheapList.contains).count//showData().restaurantNameArray.count
                let randomRoll : Int = (Int(arc4random()) + currentSeconds + currentMinutes) % b
                //RestaurantResultName.text! = showData().restaurantNameArray[randomRoll]
                RestaurantResultName.text = showData().breakfastList.filter(showData().cheapList.contains)[randomRoll]
            }
            
            if firstLoadThisPage == false && StatusOfKindOfMeal == 1 && StatusOfPriceLevel == 1 {
                let b = showData().breakfastList.filter(showData().cheapList.contains).count
                let randomRoll : Int = (Int(arc4random()) + currentSeconds + currentMinutes) % b
                RestaurantResultName.text = showData().breakfastList.filter(showData().cheapList.contains)[randomRoll]
            }
            
            if firstLoadThisPage == false && StatusOfKindOfMeal == 1 && StatusOfPriceLevel == 2 {
                let b = showData().breakfastList.filter(showData().normalPriceList.contains).count
                let randomRoll : Int = (Int(arc4random()) + currentSeconds + currentMinutes) % b
                RestaurantResultName.text = showData().breakfastList.filter(showData().normalPriceList.contains)[randomRoll]
            }
            
            if firstLoadThisPage == false && StatusOfKindOfMeal == 1 && StatusOfPriceLevel == 3 {
                //let b = showData().breakfastList.filter(showData().expensiveList.contains).count
                //let randomRoll : Int = (Int(arc4random()) + currentSeconds + currentMinutes) % b
                //RestaurantResultName.text = showData().breakfastList.filter(showData().expensiveList.contains)[randomRoll]
                RestaurantResultName.text = "No result!"
            }
            
            if firstLoadThisPage == false && StatusOfKindOfMeal == 2 && StatusOfPriceLevel == 1 {
                let b = showData().lunchList.filter(showData().cheapList.contains).count
                let randomRoll : Int = (Int(arc4random()) + currentSeconds + currentMinutes) % b
                RestaurantResultName.text = showData().lunchList.filter(showData().cheapList.contains)[randomRoll]
            }
            
            if firstLoadThisPage == false && StatusOfKindOfMeal == 2 && StatusOfPriceLevel == 2 {
                let b = showData().lunchList.filter(showData().normalPriceList.contains).count
                let randomRoll : Int = (Int(arc4random()) + currentSeconds + currentMinutes) % b
                RestaurantResultName.text = showData().lunchList.filter(showData().normalPriceList.contains)[randomRoll]
            }
            
            if firstLoadThisPage == false && StatusOfKindOfMeal == 2 && StatusOfPriceLevel == 3 {
                let b = showData().lunchList.filter(showData().expensiveList.contains).count
                let randomRoll : Int = (Int(arc4random()) + currentSeconds + currentMinutes) % b
                RestaurantResultName.text = showData().lunchList.filter(showData().expensiveList.contains)[randomRoll]
            }
            
            if firstLoadThisPage == false && StatusOfKindOfMeal == 3 && StatusOfPriceLevel == 1 {
                let b = showData().dinnerList.filter(showData().cheapList.contains).count
                let randomRoll : Int = (Int(arc4random()) + currentSeconds + currentMinutes) % b
                RestaurantResultName.text = showData().dinnerList.filter(showData().cheapList.contains)[randomRoll]
            }
            
            if firstLoadThisPage == false && StatusOfKindOfMeal == 3 && StatusOfPriceLevel == 2 {
                let b = showData().dinnerList.filter(showData().normalPriceList.contains).count
                let randomRoll : Int = (Int(arc4random()) + currentSeconds + currentMinutes) % b
                RestaurantResultName.text = showData().dinnerList.filter(showData().normalPriceList.contains)[randomRoll]
            }
            
            if firstLoadThisPage == false && StatusOfKindOfMeal == 3 && StatusOfPriceLevel == 3 {
                let b = showData().dinnerList.filter(showData().expensiveList.contains).count
                let randomRoll : Int = (Int(arc4random()) + currentSeconds + currentMinutes) % b
                RestaurantResultName.text = showData().dinnerList.filter(showData().expensiveList.contains)[randomRoll]
            }
            
            if firstLoadThisPage == false && StatusOfKindOfMeal == 1 && (StatusOfPriceLevel != 1 && StatusOfPriceLevel != 2 && StatusOfPriceLevel != 3) {
                let b = showData().breakfastList.filter(showData().cheapList.contains).count
                let randomRoll : Int = (Int(arc4random()) + currentSeconds + currentMinutes) % b
                RestaurantResultName.text = showData().breakfastList.filter(showData().cheapList.contains)[randomRoll]
            }
            
            if firstLoadThisPage == false && StatusOfKindOfMeal == 2 && (StatusOfPriceLevel != 1 && StatusOfPriceLevel != 2 && StatusOfPriceLevel != 3) {
                let b = showData().lunchList.filter(showData().cheapList.contains).count
                let randomRoll : Int = (Int(arc4random()) + currentSeconds + currentMinutes) % b
                RestaurantResultName.text = showData().lunchList.filter(showData().cheapList.contains)[randomRoll]
            }
            
            if firstLoadThisPage == false && StatusOfKindOfMeal == 3 && (StatusOfPriceLevel != 1 && StatusOfPriceLevel != 2 && StatusOfPriceLevel != 3) {
                let b = showData().dinnerList.filter(showData().cheapList.contains).count
                let randomRoll : Int = (Int(arc4random()) + currentSeconds + currentMinutes) % b
                RestaurantResultName.text = showData().dinnerList.filter(showData().cheapList.contains)[randomRoll]
            }
            
            if firstLoadThisPage == false && StatusOfPriceLevel == 1 && (StatusOfKindOfMeal != 1 && StatusOfKindOfMeal != 2 && StatusOfKindOfMeal != 3) {
                let b = showData().breakfastList.filter(showData().cheapList.contains).count
                let randomRoll : Int = (Int(arc4random()) + currentSeconds + currentMinutes) % b
                RestaurantResultName.text = showData().breakfastList.filter(showData().cheapList.contains)[randomRoll]
            }
            
            if firstLoadThisPage == false && StatusOfPriceLevel == 2 && (StatusOfKindOfMeal != 1 && StatusOfKindOfMeal != 2 && StatusOfKindOfMeal != 3) {
                let b = showData().breakfastList.filter(showData().normalPriceList.contains).count
                let randomRoll : Int = (Int(arc4random()) + currentSeconds + currentMinutes) % b
                RestaurantResultName.text = showData().breakfastList.filter(showData().normalPriceList.contains)[randomRoll]
            }
            
            if firstLoadThisPage == false && StatusOfPriceLevel == 3 && (StatusOfKindOfMeal != 1 && StatusOfKindOfMeal != 2 && StatusOfKindOfMeal != 3) {
                //let b = showData().breakfastList.filter(showData().expensiveList.contains).count
                //let randomRoll : Int = (Int(arc4random()) + currentSeconds + currentMinutes) % b
                //RestaurantResultName.text = showData().breakfastList.filter(showData().expensiveList.contains)[randomRoll]
                RestaurantResultName.text = "No result!"
            }
            
            
            if RestaurantResultName.text == "No result!" {
                RestaurantResultImage.image = UIImage(named: "DefaultRestaurantPicture.jpg")
            } else {
                RestaurantResultImage.image = UIImage(named: String(RestaurantResultName.text! + ".jpg"))
            }
        } else {
            let b = showData().restaurantNameArray.count
            let randomRoll : Int = (Int(arc4random()) + currentSeconds + currentMinutes) % b
            RestaurantResultName.text = showData().restaurantNameArray[randomRoll]
            RestaurantResultImage.image = UIImage(named: String(RestaurantResultName.text! + ".jpg"))
        }
    }
    


    override func viewDidLoad() {
        super.viewDidLoad()
        RestaurantResultImage.layer.cornerRadius = 88
        RestaurantResultImage.layer.masksToBounds = true
        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "DictionaryBackgroundPicture"))
        let blurEffect = UIBlurEffect(style: .light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = self.view.frame
        self.view.insertSubview(blurEffectView, at: 0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        firstLoadThisPage = true
    }
    
    
    
    
    
    
    
    
    
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 2
    }
    

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "RestaurantConditionKind", for: indexPath)
        
        cell.textLabel?.text = showData().advancedSearchFunctionName[indexPath.row]
        cell.backgroundColor = .clear
        cell.textLabel?.textColor = UIColor(colorLiteralRed: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        
        
        cell.preservesSuperviewLayoutMargins = false
        cell.separatorInset = UIEdgeInsets.zero
        cell.layoutMargins = UIEdgeInsets.zero
        // 以上三行可以讓在不同cell之間的seperator line有full width.
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
}
