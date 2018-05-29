//
//  TranslationVController.swift
//  Rolling
//
//  Created by 李政恩 on 26/09/2017.
//  Copyright © 2017 Beichi Techonology. All rights reserved.
//

import UIKit

class TranslationVController: UIViewController {

    var name : Int = 0
    
    @IBOutlet weak var SelectedVocabulary: UILabel!

    var connectionForth = showData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SelectedVocabulary.text = showData().vocabulariesList[name]
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
