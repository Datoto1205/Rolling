//
//  CollectionViewController.swift
//  Rolling
//
//  Created by 李政恩 on 12/09/2018.
//  Copyright © 2018 Beichi Techonology. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class CollectionViewController: UICollectionViewController {

    var universityImageArray: [UIImage] = []
    var universityPhotoURLArray: [String] = []
    var universityImageDictionary: [String:UIImage] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        
        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
        // Do any additional setup after loading the view.
        
        DispatchQueue.global().async {
            DispatchQueue.global().sync {
                for i in 0...showData().URLOfUniversityPhoto.count - 1 {
                    self.downloadPics(url: showData().URLOfUniversityPhoto[i])
                    print(self.universityImageArray.count)
                }
            }
            
            
            for i in 0...self.universityImageArray.count - 1 {
                self.universityImageDictionary.updateValue(self.universityImageArray[i], forKey: self.universityPhotoURLArray[i])
                
            }
            
            DispatchQueue.main.async {
                self.collectionView?.reloadData()
                self.collectionView?.refreshControl?.endRefreshing()
            }
        }
    }
    
    
    func downloadPics(url: String) {
        let data = try? Data(contentsOf: URL(string: url)!)
        if data != nil {
            if let newImage = UIImage(data: data!) {
                self.universityImageArray.append(newImage)
                self.universityPhotoURLArray.append(url)
            } else {
                print("Data could not be transferred to UIImage!")
            }
        } else {
            print("Data could not be found!")
        }
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return showData().URLOfUniversityPhoto.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ChooseUniversity", for: indexPath) as! CollectionViewCell
        
        for (universityPhotoURLArray, universityImageArray) in universityImageDictionary {
            if "\(universityPhotoURLArray)" == showData().URLOfUniversityPhoto[indexPath.row] {
                cell.universityImage.image = universityImageArray
                //cell.universityImage.image = imageArray
            } else {
                print("Try to match with another key!")
            }
        }
        
        cell.universityName.text = showData().nameOfUniversityList[indexPath.row]
        
        return cell
    }

    
    
    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            performSegue(withIdentifier: "ChooseTheRestaurant", sender: self)
        } else {
            self.present(noImformationAlert(), animated: true, completion: nil)
        }
    }
    
    func noImformationAlert() -> UIAlertController {
        let alertOfNoGreatInternet = UIAlertController(title: "No decilious restaurant!", message: "We only provided you imformation about the restaurants around NTPU now. Please wait for the updates later to get access to the restaurants you want to search!", preferredStyle: .alert)
        let alertAction1 = UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: {ACTION in
            print("")})
        
        alertOfNoGreatInternet.addAction(alertAction1)
        return alertOfNoGreatInternet
    }

}
