//
//  OtherNVController.swift
//  Rolling
//
//  Created by 李政恩 on 25/09/2017.
//  Copyright © 2017 Beichi Techonology. All rights reserved.
//

import UIKit

class OtherNVController: UINavigationController {

    override func viewDidLoad() {
        navigationBar.barTintColor = UIColor(colorLiteralRed: 65/255, green: 139/255, blue: 132/255, alpha: 1)
        navigationBar.isTranslucent = false
        navigationBar.tintColor = UIColor(colorLiteralRed: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        // Change the navigation bar's background color and the color of "go back" items.
        
        
        let textAttributes = [NSForegroundColorAttributeName: UIColor.white]
        navigationBar.titleTextAttributes = textAttributes
        // Change the color of navigation bar's title.
        
        super.viewDidLoad()
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
