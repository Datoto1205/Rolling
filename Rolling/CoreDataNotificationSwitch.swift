//
//  CoreDataNotificationSwitch.swift
//  Rolling
//
//  Created by 李政恩 on 02/06/2018.
//  Copyright © 2018 Beichi Techonology. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class CoreDataNotificationSwitch {
    
    var checkBollValue : Bool?
    
    func checkAndChangeTheBoolConditionOfNotificationSwitch() {
        //demonstrateCoreDataOfNotificationSwitch()   viewdidload need to check
        DeleteCoreDataOfNotificationSwitch()
        saveCoreDataOfNotificationSwitch()
        demonstrateCoreDataOfNotificationSwitch()
    }
    
    func demonstrateCoreDataOfNotificationSwitch() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let Context = appDelegate.persistentContainer.viewContext
        
        let myRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "SettingPage")
        
        myRequest.returnsObjectsAsFaults = false
        
        do {
            let finalresult = try Context.fetch(myRequest)
            for data in finalresult as! [NSManagedObject] {
                print(data.value(forKey: "notification") as! Bool)
                checkBollValue = data.value(forKey: "notification") as! Bool
            }
        } catch {
            print("Could not demonstrate")
        }
    }
    
    func saveCoreDataOfNotificationSwitch() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let Context = appDelegate.persistentContainer.viewContext
        
        let Entity = NSEntityDescription.entity(forEntityName: "SettingPage", in: Context)
        let newTime = NSManagedObject(entity: Entity!, insertInto: Context)
        
        if checkBollValue == false {
        newTime.setValue(true, forKey: "notification")
            checkBollValue = true
        } else {
          newTime.setValue(false, forKey: "notification")
            checkBollValue = false
        }
        
        do {
            try Context.save()
        } catch {
            print("Failed saving")
        }
    }
    
    func DeleteCoreDataOfNotificationSwitch(){
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.persistentContainer.viewContext
        let DelAllReqVar = NSBatchDeleteRequest(fetchRequest: NSFetchRequest<NSFetchRequestResult>(entityName: "SettingPage"))
        do {
            try managedContext.execute(DelAllReqVar)
        }
        catch {
            print("Could not delete the data.")
        }
        
    }
    
    
    
}
