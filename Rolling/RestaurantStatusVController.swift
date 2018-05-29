//
//  RestaurantStatusVController.swift
//  Rolling
//
//  Created by 李政恩 on 26/09/2017.
//  Copyright © 2017 Beichi Techonology. All rights reserved.
//

import UIKit

class RestaurantStatusVController: UIViewController {

    
    var connectionFifth = showData()
    var myindex : Int = 0
    
    @IBOutlet weak var introductionName: UILabel!
    
    @IBOutlet weak var introductionPicture: UIImageView!
    
    @IBOutlet weak var introductionDescription: UILabel!
    
    func showintroduction() {
        introductionName.text! = showData().restaurantNameArray[myindex]
        introductionPicture.image = UIImage(named: showData().restaurantNameArray[myindex] + ".jpg")
        introductionDescription.text! = showData().restaurantSitesArray[myindex]
    }
    
    
    
    @IBOutlet weak var breakfastCondition: UILabel!
    @IBOutlet weak var lunchCondition: UILabel!
    @IBOutlet weak var dinnerCondition: UILabel!
    @IBOutlet weak var cheapCondition: UILabel!
    @IBOutlet weak var normalPriceCondition: UILabel!
    @IBOutlet weak var expensiveCondition: UILabel!
    @IBOutlet weak var vegetarianCondition: UILabel!
    @IBOutlet weak var spicyCondition: UILabel!
    @IBOutlet weak var noRiceCondition: UILabel!
    
    func conditionShape() {
        breakfastCondition.layer.cornerRadius = 10.0
        breakfastCondition.layer.borderWidth = 2.0
        breakfastCondition.layer.borderColor = UIColor(colorLiteralRed: 148/255, green: 151/255, blue: 153/255, alpha: 1).cgColor
        
        lunchCondition.layer.cornerRadius = 10.0
        lunchCondition.layer.borderWidth = 2.0
        lunchCondition.layer.borderColor = UIColor(colorLiteralRed: 148/255, green: 151/255, blue: 153/255, alpha: 1).cgColor
        
        dinnerCondition.layer.cornerRadius = 10.0
        dinnerCondition.layer.borderWidth = 2.0
        dinnerCondition.layer.borderColor = UIColor(colorLiteralRed: 148/255, green: 151/255, blue: 153/255, alpha: 1).cgColor
        
        cheapCondition.layer.cornerRadius = 10.0
        cheapCondition.layer.borderWidth = 2.0
        cheapCondition.layer.borderColor = UIColor(colorLiteralRed: 148/255, green: 151/255, blue: 153/255, alpha: 1).cgColor
        
        normalPriceCondition.layer.cornerRadius = 10.0
        normalPriceCondition.layer.borderWidth = 2.0
        normalPriceCondition.layer.borderColor = UIColor(colorLiteralRed: 148/255, green: 151/255, blue: 153/255, alpha: 1).cgColor
        
        expensiveCondition.layer.cornerRadius = 10.0
        expensiveCondition.layer.borderWidth = 2.0
        expensiveCondition.layer.borderColor = UIColor(colorLiteralRed: 148/255, green: 151/255, blue: 153/255, alpha: 1).cgColor
        
        vegetarianCondition.layer.cornerRadius = 10.0
        vegetarianCondition.layer.borderWidth = 2.0
        vegetarianCondition.layer.borderColor = UIColor(colorLiteralRed: 148/255, green: 151/255, blue: 153/255, alpha: 1).cgColor
        
        spicyCondition.layer.cornerRadius = 10.0
        spicyCondition.layer.borderWidth = 2.0
        spicyCondition.layer.borderColor = UIColor(colorLiteralRed: 148/255, green: 151/255, blue: 153/255, alpha: 1).cgColor
        
        noRiceCondition.layer.cornerRadius = 10.0
        noRiceCondition.layer.borderWidth = 2.0
        noRiceCondition.layer.borderColor = UIColor(colorLiteralRed: 148/255, green: 151/255, blue: 153/255, alpha: 1).cgColor
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showintroduction()
        conditionShape()
        
        if showData().breakfastList.contains(introductionName.text!) {
            breakfastCondition.layer.backgroundColor = UIColor(colorLiteralRed: 222/255, green: 243/255, blue: 252/255, alpha: 1).cgColor
        }
        
        if showData().lunchList.contains(introductionName.text!) {
            lunchCondition.layer.backgroundColor = UIColor(colorLiteralRed: 222/255, green: 243/255, blue: 252/255, alpha: 1).cgColor
        }
        
        if showData().dinnerList.contains(introductionName.text!) {
            dinnerCondition.layer.backgroundColor = UIColor(colorLiteralRed: 222/255, green: 243/255, blue: 252/255, alpha: 1).cgColor
        }
        
        if showData().cheapList.contains(introductionName.text!) {
            cheapCondition.layer.backgroundColor = UIColor(colorLiteralRed: 222/255, green: 243/255, blue: 252/255, alpha: 1).cgColor
        }

        if showData().normalPriceList.contains(introductionName.text!) {
            normalPriceCondition.layer.backgroundColor = UIColor(colorLiteralRed: 222/255, green: 243/255, blue: 252/255, alpha: 1).cgColor
        }
        
        if showData().expensiveList.contains(introductionName.text!) {
            expensiveCondition.layer.backgroundColor = UIColor(colorLiteralRed: 222/255, green: 243/255, blue: 252/255, alpha: 1).cgColor
        }
        
        if showData().vegetarianList.contains(introductionName.text!) {
            vegetarianCondition.layer.backgroundColor = UIColor(colorLiteralRed: 222/255, green: 243/255, blue: 252/255, alpha: 1).cgColor
        }
        
        if showData().spicyList.contains(introductionName.text!) {
            spicyCondition.layer.backgroundColor = UIColor(colorLiteralRed: 222/255, green: 243/255, blue: 252/255, alpha: 1).cgColor
        }
        
        if showData().noRiceList.contains(introductionName.text!) {
            noRiceCondition.layer.backgroundColor = UIColor(colorLiteralRed: 222/255, green: 243/255, blue: 252/255, alpha: 1).cgColor
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
