//
//  NotificationTimeViewController.swift
//  Rolling
//
//  Created by 李政恩 on 31/05/2018.
//  Copyright © 2018 Beichi Techonology. All rights reserved.
//

import UIKit

class NotificationTimeViewController: UIViewController {

    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var timeDatePickerShow: UIDatePicker!
    
    @IBAction func timeDatePickerAction(_ sender: UIDatePicker) {
        let dateValue = DateFormatter()
        dateValue.dateFormat = "HH:mm"
        dateValue.timeZone = TimeZone(secondsFromGMT: 8)
        timeLabel.text = dateValue.string(from: timeDatePickerShow.date)
        //saveTime = timeDatePickerShow.date
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timeDatePickerShow.timeZone = TimeZone(secondsFromGMT: 8)
        //Define the time zone of the time showing in the datepicker.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print(timeLabel.text!)
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
