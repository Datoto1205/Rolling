//
//  SecretPictureVController.swift
//  Rolling
//
//  Created by 李政恩 on 07/10/2017.
//  Copyright © 2017 Beichi Techonology. All rights reserved.
//

import UIKit

class SecretPictureVController: UIViewController {

    @IBAction func ClosePopup(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet weak var SecretPirture: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SecretPirture.layer.cornerRadius = 20
        SecretPirture.layer.masksToBounds = true

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
