//
//  VocabularyResultVController.swift
//  Rolling
//
//  Created by 李政恩 on 22/09/2017.
//  Copyright © 2017 Beichi Techonology. All rights reserved.
//

import UIKit

class VocabularyResultVController: UIViewController {

    @IBOutlet weak var questionDetails: UILabel!
    
    @IBOutlet weak var questionDetailsBackground: UILabel!
    
    var connectionDataSecond = showData()
    
    func decisionSecond () {
        let a = showData().vocabulariesList.count
        let randomRoll = Int(arc4random()) % a
        questionDetails.text! = showData().vocabulariesList[randomRoll]
    }
    
    @IBAction func questionDetailsAgain(_ sender: UIButton) {
        decisionSecond()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        decisionSecond()
        questionDetailsBackground.layer.cornerRadius = 10
        questionDetailsBackground.layer.masksToBounds = true
        
        self.view.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "OldBookBackgroundPicture"))
        
        let blurEffect = UIBlurEffect(style: .light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = self.view.frame
        self.view.insertSubview(blurEffectView, at: 0)
        // Add blur effect to the background photo.
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
