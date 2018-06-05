//  Created by Li Cheng-En.
//  Copyright © 2018. All rights reserved.
//

import UIKit

class RandomSelectionViewController: UIViewController, UITextFieldDelegate {
    
    var option1Content: String = ""
    var option2Content: String = ""
    var alreadyChangeTheYCoordinateOfView = false
    
    @IBOutlet weak var Option1Text: UITextField!
    @IBOutlet weak var Option2Text: UITextField!
    @IBOutlet weak var SelectionResult: UILabel!
    
    @IBAction func RandomSelectionBottom(_ sender: Any) {
        let currentDate = Date()
        let currentTime = Calendar.current
        let currentSeconds = currentTime.component(.second, from: currentDate)
        let currentMinutes = currentTime.component(.minute, from: currentDate)
        
        option1Content = Option1Text.text!
        option2Content = Option2Text.text!
        let optionArray = [option1Content, option2Content]
        //Add the contents user typed into an array
        
        let b = optionArray.count
        let randomRoll : Int = (Int(arc4random()) + currentSeconds + currentMinutes) % b
        SelectionResult.text = optionArray.filter(optionArray.contains)[randomRoll]
        //Select a factor from the array we created randomly.
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.Option1Text.delegate = self
        self.Option2Text.delegate = self
        //Without declaration of delegates of OptionText, the function "textFieldShouldReturn" shown below would not work!
        
        self.view.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "OldBookBackgroundPicture"))
        let blurEffect = UIBlurEffect(style: .light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = self.view.frame
        self.view.insertSubview(blurEffectView, at: 0)
        //Create the blurred background image.
        
        let center: NotificationCenter = NotificationCenter.default
        center.addObserver(self, selector: #selector(keyboardDidShow(notification:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        center.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        //Detect and control the coordinate of the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    //When the user press the "return" buttom on the keyboard, the keyboard would be hidden.
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        //close the keyboard when pressed somewhere else on the screen
    }
    
    //-----<The part below is used to move the view when the textfield is clicked!>-----
    // So that the user could see the whole textfields clearly.
    
    @objc func keyboardDidShow(notification: Notification) {
        //let info : NSDictionary = notification.userInfo! as NSDictionary
        //let keyboardSize = (info[UIKeyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        //let KeyboardY = self.view.frame.size.height - keyboardSize.height
        
        if alreadyChangeTheYCoordinateOfView == false {
            UIView.animate(withDuration: 0.25, delay: 0.0, options: UIViewAnimationOptions.curveEaseIn, animations: {self.view.frame = CGRect(x: 0, y: self.view.frame.origin.y - 70, width: self.view.bounds.width, height: self.view.bounds.height)}, completion: nil)
            alreadyChangeTheYCoordinateOfView = true
        }
    }
    //Move up the view when keyboard was shown.
    //"@objc" means that the language of this part was belong to objective-c.
    
    @objc func keyboardWillHide(notification: Notification) {
        UIView.animate(withDuration: 0.25, delay: 0.0, options: UIViewAnimationOptions.curveEaseIn, animations: {self.view.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height)}, completion: nil)
        alreadyChangeTheYCoordinateOfView = false
    }
    //Move down the view when keyboard was closed.
    
    override func viewWillDisappear(_ animated: Bool) {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    //Disactivate the observers which could detect and control the coordinate of the view to save the resource.
    //Tutorial: https://www.youtube.com/watch?v=AiYCStoj0lc
    //-----<The part above is used to move the view when the textfield is clicked!>-----
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
