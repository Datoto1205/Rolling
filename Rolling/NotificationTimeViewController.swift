//
//  NotificationTimeViewController.swift
//  Rolling
//
//  Created by 李政恩 on 31/05/2018.
//  Copyright © 2018 Beichi Techonology. All rights reserved.
//

import UIKit
import CoreData

class NotificationTimeViewController: UIViewController {

    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var timeDatePickerShow: UIDatePicker!
    
    @IBAction func timeDatePickerAction(_ sender: UIDatePicker) {
        let dateValue = DateFormatter()
        dateValue.dateFormat = "HH:mm"
        dateValue.timeZone = TimeZone(secondsFromGMT: 8)
        timeLabel.text = dateValue.string(from: timeDatePickerShow.date)
        
        //-----<Change the time of notification user setted (below)>-----
        //It seems that I could not do it successfully when I tried to done it in another class, so I did it here, while the codes is a little bit tedious.
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.persistentContainer.viewContext
        let DelAllReqVar = NSBatchDeleteRequest(fetchRequest: NSFetchRequest<NSFetchRequestResult>(entityName: "Time"))
        do {
            try managedContext.execute(DelAllReqVar)
        }
        catch {
            print("Could not delete the old data of notification time.")
        }
        
        
        let Entity = NSEntityDescription.entity(forEntityName: "Time", in: managedContext)
        let newTime = NSManagedObject(entity: Entity!, insertInto: managedContext)
        
            newTime.setValue(timeDatePickerShow.date, forKey: "notificationtime")
        
        do {
            try managedContext.save()
        } catch {
            print("Failed to save the new data of notification time.")
        }
        //-----<Change the time of notification user setted (above)>-----
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

    
    override func viewWillAppear(_ animated: Bool) {
        
        //-----<Fetch the time of notification user setted (below)>-----
        //It seems that I could not do it successfully when I tried to done it in another class, so I did it here, while the codes is a little bit tedious.
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let Context = appDelegate.persistentContainer.viewContext
        var initialDate : Date?
        let myRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Time")
        myRequest.returnsObjectsAsFaults = false
        
        do {
            let finalresult = try Context.fetch(myRequest)
            for data in finalresult as! [NSManagedObject] {
                initialDate = data.value(forKey: "notificationtime") as! Date
            }
        } catch {
            print("Could not demonstrate")
        }
        //-----<Fetch the time of notification user setted (above)>-----
        
        
        if initialDate == nil {
            timeDatePickerShow.date = Date()
            timeLabel.text = "Please select a time you want to be reminded!"
        } else {
            timeDatePickerShow.date = initialDate!
            timeLabel.text = "Please select a new time you want to be reminded!"
        }
        //So that the time datePicker would show next time could be controlled.
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
