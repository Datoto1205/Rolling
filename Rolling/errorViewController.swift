//  Created by Li Cheng-En.
//  Copyright © 2018. All rights reserved.
//

import UIKit

class errorViewController: UIViewController {

    var timer: Timer?
    
    @IBOutlet weak var errorIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        errorIndicator.startAnimating()
        // Tutorial: https://medium.com/彼得潘的-swift-ios-app-開發教室/簡易說明xcode中object-library的activity-indicator-view-8bda79608a3b
    }
    
    func popUpTheLeavingAlert() {
        let alertOfLeaving = UIAlertController(title: "Error", message: "Could not fetch the data of the version from the App Store!", preferredStyle: .alert)
        let alertActionOfLeavingThePage = UIAlertAction(title: "Ok", style: UIAlertActionStyle.cancel, handler: {(ACTION) in
            self.navigationController?.popToRootViewController(animated: true)
            // So that the screen would go back to settingView automatically when the user clicked the button of "OK". Notice that I did not need to use unwind segue here, the fact is that I embeded navigation controller in the settingView here.
            })
        
        alertOfLeaving.addAction(alertActionOfLeavingThePage)
        self.present(alertOfLeaving, animated: true, completion: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.popUpTheLeavingAlert), userInfo: nil, repeats: false)
        // Create a timer so that a alertView would pop up when the time fires.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        if self.timer != nil {
            self.timer?.invalidate()
        }
        // Disable the timer.
        // Tutorial: https://medium.com/@mikru168/ios-timer-434d91529cdf
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
