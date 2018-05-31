//
//  IntroductionOfBuilderViewController.swift
//  Rolling
//
//  Created by 李政恩 on 29/05/2018.
//  Copyright © 2018 Beichi Techonology. All rights reserved.
//

import UIKit

class IntroductionOfBuilderViewController: UIViewController {

    @IBOutlet weak var photo: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        photo.layer.cornerRadius = 88
        photo.layer.masksToBounds = true

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
