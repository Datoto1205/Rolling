//
//  StoreViewController.swift
//  Rolling
//
//  Created by 李政恩 on 04/10/2017.
//  Copyright © 2017 Beichi Techonology. All rights reserved.
//

import UIKit

class StoreViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    
    @IBAction func buyingButtom1(_ sender: UIButton) {
        let alert1 = UIAlertController(title: "Notice", message: "You need to spend real money if you want to eliminate the advertisement. Would you like to continue your order?", preferredStyle: .alert)
        let alertAction1 = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.default, handler: {ACTION in print("done")})
        
        alert1.addAction(alertAction1)
        
        self.present(alert1, animated: true, completion: nil)
    }
    
    @IBAction func buyingButtom2(_ sender: UIButton) {
        let alert2 = UIAlertController(title: "Notice", message: "You need to spend real money if you want to obtain the secret photo. Would you like to continue your order?", preferredStyle: .alert)
        let alertAction2 = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.default, handler: {ACTION in print("done")})
        
        alert2.addAction(alertAction2)
        
        self.present(alert2, animated: true, completion: nil)
    }
    
    @IBAction func buyingButtom3(_ sender: UIButton) {
        let alert3 = UIAlertController(title: "baba", message: "mama", preferredStyle: .alert)
        let alertAction3 = UIAlertAction(title: "押しってください", style: UIAlertActionStyle.default, handler: {ACTION in print("done")})
        
        alert3.addAction(alertAction3)
        
        self.present(alert3, animated: true, completion: nil)
    }
    
    var second = 5
    var timer = Timer()
    

    
    
    func setTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(StoreViewController.updateTimer)), userInfo: nil, repeats: true)
    }
    
    func updateTimer() {
        if second > 0 {
            second = second - 1
        } else {
            second = 5
            move()
        }
    }
    
    func move() {
        if scrollView.contentOffset.x == 0 {
            scrollView.scrollRectToVisible(CGRect(x: view.frame.width, y: -64, width: scrollView.frame.width, height: scrollView.frame.height), animated: true)
        } else if scrollView.contentOffset.x != 0 {
            scrollView.scrollRectToVisible(CGRect(x: 0, y: -64, width: scrollView.frame.width, height: scrollView.frame.height), animated: true)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Set three buttoms' properties (round corner & gray line broder)
        
        
        let AD:[AD] = creatSlides()
        setupSlideScrollView(AD: AD)
        pageControl.numberOfPages = AD.count
        //If there're two ADs in func creatSlides(), it would create two pages, and were shown.
        
        pageControl.currentPage = 0
        scrollView.delegate = self
        // Delegate must be setted if you want to customize this scroll view.
        // "pageControl.currentPage = 0" means that the first AD would be shown at page 1.
        
        
        view.bringSubview(toFront: pageControl)
        //scrollView.contentOffset.x = view.frame.width
        scrollView.contentOffset.x = 0
        
        
        setTimer()
        updateTimer()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        // Default coding
    }
    
    
    
    
    
    func creatSlides() -> [AD] {
        let AD1: AD = Bundle.main.loadNibNamed("AD", owner: self, options: nil)?.first as! AD
        AD1.AD.image = UIImage(named: "Advertisement 1.png")
        
        
        
        let AD2: AD = Bundle.main.loadNibNamed("AD" , owner: self, options: nil)?.first as! AD
        AD2.AD.image = UIImage(named: "Advertisement 2.png")
        
        
        
        return [AD1, AD2]
        // Create two ADs
    }
    
    
    
    func setupSlideScrollView(AD: [AD]) {
        
        scrollView.frame = CGRect(x: 0, y: 0, width: scrollView.frame.width, height: scrollView.frame.height)
        // 限制顯示外框的大小
        scrollView.contentSize = CGSize(width: scrollView.frame.width * CGFloat(AD.count) * (view.frame.width/320), height: view.frame.height/140)
        // 限制欲顯示的全部內容的範圍
        scrollView.isPagingEnabled = true
        // 啟動"允許翻動內容"的語法
        
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.bounces = false
        // 隱藏右邊和下面的捲軸滑桿
        
        
        for i in 0 ..< AD.count {
            AD[i].frame = CGRect(x: view.frame.width * CGFloat(i), y: 0, width: view.frame.width, height: view.frame.height/140)
            
            scrollView.addSubview(AD[i])
            // 形成各個AD，並拼成一個完整的全部欲顯示的內容．
        }
    }
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x/view.frame.width)
        pageControl.currentPage = Int(pageIndex)
    }
    
    
    
}

