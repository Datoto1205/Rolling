//  Created by Li Cheng-En.
//  Copyright © 2018. All rights reserved.
//

import UIKit

class errorViewController: UIViewController {

    struct RootClass : Codable {
        
        let rolling : [Rolling]?
        
        
        enum CodingKeys: String, CodingKey {
            case rolling = "Rolling"
        }
        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            rolling = try values.decodeIfPresent([Rolling].self, forKey: .rolling)
        }
        
        
    }
    
    struct Rolling : Codable {
        
        let code : String?
        let descriptionField : String?
        
        
        enum CodingKeys: String, CodingKey {
            case code = "Code"
            case descriptionField = "Description"
        }
        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            code = try values.decodeIfPresent(String.self, forKey: .code)
            descriptionField = try values.decodeIfPresent(String.self, forKey: .descriptionField)
        }
        
        
    }
    // The two structs above were used to decode the json, the link of the website I refered to is: https://medium.com/@mikru168/swift4-利用-jsondecoder-和-jsonencoder-來處理-json-格式的資料-d9b2d00656e

    var timer: Timer?
    var dataIsNil: Bool = true
    var codeMatrix: [String] = []
    var descriptionMatrix: [String] = []
    
    @IBOutlet weak var errorIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        errorIndicator.startAnimating()
        // Tutorial: https://medium.com/彼得潘的-swift-ios-app-開發教室/簡易說明xcode中object-library的activity-indicator-view-8bda79608a3b
        
        self.downloadJsonData()
        
        createTextLabel()
        
        
    }
    
    func popUpTheLeavingAlert() {
        let alertOfLeaving = UIAlertController(title: "Error", message: "Could not fetch the data of the version from the App Store!", preferredStyle: .alert)
        let alertActionOfLeavingThePage = UIAlertAction(title: "Ok", style: UIAlertActionStyle.cancel, handler: {(ACTION) in
            self.navigationController?.popToRootViewController(animated: true)
            // So that the screen would go back to settingView automatically when the user clicked the button of "OK". Notice that I did not need to use unwind segue here, the fact is that I embeded navigation controller in the settingView here.
            })
        
        alertOfLeaving.addAction(alertActionOfLeavingThePage)
        
        if dataIsNil == true {
        self.present(alertOfLeaving, animated: true, completion: nil)
        } else {
            
        }
    }
    
    func downloadJsonData() {
        let data = try? Data(contentsOf: URL(string: "https://www.json-generator.com/api/json/get/cgBwsxAUmW?indent=2")!)
        
        
        if let Hi = try? JSONDecoder().decode(RootClass.self, from: data!) {
            
            
            for code in (Hi.rolling!) {
                codeMatrix.append(code.code!)
            }
            for description in (Hi.rolling!) {
                descriptionMatrix.append(description.descriptionField!)
            }
            
            print(codeMatrix[0])
            print(descriptionMatrix[0])
            dataIsNil = false
        }
    }
    
    func createTextLabel() {
        let codeTextLabel = UILabel(frame: CGRect(x: 20, y: self.view.center.y - 100, width: (self.view.frame.width - 40), height: 50))
        codeTextLabel.text = "Version Code: \(codeMatrix[0])"
        codeTextLabel.textAlignment = .left
        codeTextLabel.tag = 1
        
        let descriptionTextLabel = UILabel(frame: CGRect(x: 20, y: self.view.center.y - 50, width: (self.view.frame.width - 40), height: 50))
        descriptionTextLabel.text = "Description: \(descriptionMatrix[0])"
        descriptionTextLabel.textAlignment = .left
        descriptionTextLabel.tag = 2
        view.addSubview(codeTextLabel)
        view.addSubview(descriptionTextLabel)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(self.popUpTheLeavingAlert), userInfo: nil, repeats: false)
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
