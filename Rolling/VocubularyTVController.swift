//
//  VocubularyTVController.swift
//  Rolling
//
//  Created by 李政恩 on 19/09/2017.
//  Copyright © 2017 Beichi Techonology. All rights reserved.
//

import UIKit

class VocubularyTVController: UITableViewController, UISearchResultsUpdating {

    var VocabulariesData = showData()
    // 連接不同class
    
    var vocabulariesIWantToShow = showData().vocabulariesList
    
    var VocabularySearchController : UISearchController!
    var VocabularyResultsViewController = UITableViewController()
    var filterVocabularies = [String]()
    
    var conveyData : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.VocabularyResultsViewController.tableView.dataSource = self
        self.VocabularyResultsViewController.tableView.delegate = self
        // Two essential codes if you want to add something to the talbe view.
        
        self.VocabularySearchController = UISearchController(searchResultsController: VocabularyResultsViewController)
        self.tableView.tableHeaderView = self.VocabularySearchController.searchBar
        //VocabularySearchController.searchBar.placeholder = "英語の単語を打たないでください"
        self.VocabularySearchController.searchResultsUpdater = self
        // Called object "VocabularySearchController", and build a UISearchController on the top of that table view. Moreover, I also customize the text in that search bar. Additionally, I also return the text in that text bar.

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        self.VocabularySearchController.hidesNavigationBarDuringPresentation = false
        // 限制新增的searchBar不要超過螢幕上緣 ＆ NavigationBar
        
        //self.VocabularySearchController.searchBar.barTintColor = UIColor(colorLiteralRed: 65/255, green: 139/255, blue: 132/255, alpha: 1)
    }
    
    
    
    func updateSearchResults(for searchController: UISearchController) {
        
        self.filterVocabularies = self.vocabulariesIWantToShow.filter { (vocabulariesIWantToShow : String) -> Bool in
            if vocabulariesIWantToShow.lowercased().contains(self.VocabularySearchController.searchBar.text!.lowercased()) {
                return true
            } else {
                return false
            }
        }
        // Filter throught the vocabularies.
        
        self.VocabularyResultsViewController.tableView.reloadData()
        //Update the results TableView.
    }

    
    
    /*override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }*/

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if tableView == self.tableView {
            return self.vocabulariesIWantToShow.count
        } else {
            return self.filterVocabularies.count
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        if tableView == self.tableView {
        cell.textLabel?.text = self.vocabulariesIWantToShow[indexPath.row]
        } else {
            cell.textLabel?.text = self.filterVocabularies[indexPath.row]
        }
        // Configure the cell...
        // If the text user typed was matched, it would show the results, or it would show the original table view.
        
        cell.accessoryType = .disclosureIndicator
        // 依序取出矩陣內元素，並回傳至table的prototype cell中的textLabel，且新增指標箭頭.
        
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == self.tableView {
            // 加這個if是因為我們無法處理"搜尋狀態下無法重新計算列數"的問題，為了避免crash所加的．
            
        conveyData = (self.tableView.indexPathForSelectedRow?.row)!
        // 將選擇的row的列數放入conveyData代數中
        
        //performSegue(withIdentifier: "TranslationSegue", sender: self)
        // Perform the segue after you select the cell.
        
        tableView.deselectRow(at: indexPath, animated: true)
        //取消選取，這樣選擇的列才會再變為白色
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let controller = segue.destination as! TranslationVController
        // 指定目的地view的view controller
        
        controller.name = conveyData
        // 指定目的地view裡的一個叫name的變數為這個view的變數conveyData
    }
    //沒打這一段的話，convey的值到了下一個view會被初始化．
    
    
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    
    */

}
