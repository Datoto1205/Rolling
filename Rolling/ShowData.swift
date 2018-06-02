//
//  ShowData.swift
//  Rolling
//
//  Created by 李政恩 on 18/09/2017.
//  Copyright © 2017 Beichi Techonology. All rights reserved.
//

import Foundation

class showData {
    
    let settingOption1 = ["Push Notification Settings", "Push Notification", "Notification time"]
    let settingOption2 = ["Support", "Help Center", "Problem Reporting"]
    let settingOption3 = ["About", "Introduction of Developer", "Version"]
    
    let introductionOfDeveloper1 = ["Self Introduction", "Motivation"]
    let introductionOfDeveloper2 = ["My name is Li Cheng-En, and I lived in Taiwan. In 2017, I graduated from NTPU. I worked at some small companies after I left from my school. My dream is to become a richer person, and use my knowledge to change the world.", "In 2017, I hoped that I could use what I learned before to finish a masterpiece. Moreover, I also want to try to build my own App. Thus, I spent few months building this App. Thanks every people for your help."]
    
    let advancedSearchFunctionName = ["Kind of Meal", "Price"]
    
    let restaurantNameArray : [String]
    let restaurantSitesArray = [
        "(No. 15, Guoji 2st Street, Sanxia District, New Taipei City, 台湾 23741)",
        "No. 88, Daguan Road, Sanxia District, New Taipei City, Taiwan 237",
        "No. 55, Guoxue Street, Sanxia District, New Taipei City, Taiwan 23741",
        "No. 43, Guoxue Street, Sanxia District, New Taipei City, Taiwan 237",
        "No. 479, Dade Road, Sanxia District, New Taipei City, Taiwan 237",
        "No. 86, Guoxue Street, Sanxia District, New Taipei City,Taiwan 23741",
        "No. 51, Guoxue Street, Sanxia District, New Taipei City, Taiwan 23741",
        "No. 39, Guoji 1st Street, Sanxia District, New Taipei City, Taiwan 23741",
        "No. 41, Guoji 1st Street, Sanxia District, New Taipei City, Taiwan 23741",
        "No. 43, Guoji 1st Street, Sanxia District, New Taipei City, Taiwan 23741",
        "No. 37, Guoji 2nd Street, Sanxia District, New Taipei City, Taiwan 23741",
        "No. 45, Guoji 1st Street, Sanxia District, New Taipei City, Taiwan 23741",
        "No. 47, Guoji 1st Street, Sanxia District, New Taipei City, Taiwan 23741",
        "No. 251, Dayi Road, Sanxia District, New Taipei City, Taiwan 23741",
        "No. 43, Guoxue Street, Sanxia District, New Taipei City, 台湾 23741",
        "No. 30, Daguan Road, Sanxia District, New Taipei City, Taiwan 23741",
        "No. 24, Daguan Road, Sanxia District, New Taipei City, Taiwan 23741",
        "No. 90, Daguan Road, Sanxia District, New Taipei City, Taiwan 23741",
        "No. 96-1, Daguan Road, Sanxia District, New Taipei City, Taiwan 23741",
        "No. 313, Daguan Road, Sanxia District, New Taipei City, Taiwan 23741",
        "No. 88, Guoxue Street, Sanxia District, New Taipei City, Taiwan 23741",
        "No. 220, Dade Road, Sanxia District, New Taipei City, Taiwan 23741",
        "No. 222, Dade Road, Sanxia District, New Taipei City, Taiwan 23741",
        "No. 96, Xueqin Road, Sanxia District, New Taipei City, Taiwan 23741",
        "No. 37, Guoji 1st Street, Sanxia District, New Taipei City, Taiwan 23741",
        "No. 86, Daguan Road, Sanxia District, New Taipei City, Taiwan 23741",
        "No. 261, Dayi Road, Sanxia District, New Taipei City, Taiwan 23741",
        "No. 228, Xuecheng Road, Sanxia District, New Taipei City, 237",
        "No. 250, Xuecheng Rd, Sanxia District, New Taipei City, 237",
        "No. 258, Xuecheng Road, Sanxia District, New Taipei City, 237",
        "No. 28, Daguan Road, Sanxia District, New Taipei City, 237",
        "No. 123, Dade Road, Sanxia District, New Taipei City, 237",
        "No. 1, Guoji 2nd Street, Sanxia District, New Taipei City, 237",
        "No. 32, Guoji 1st Street, Sanxia District, New Taipei City, 237",
        "No.1, Aly. 1, Ln. 367, Fuxing Rd., Sanxia Dist., New Taipei City, 237",
        "No. 29, Guoji 1st Street, Sanxia District, New Taipei City, Taiwan 23741",
        "No. 170, Xueqin Rd, Sanxia District, New Taipei City, 237"]
    
    var vocabulariesList = ["Repudiate", "Interplay", "Mainstay", "Conceptualize", "Intrinsic", "Circumvent", "Prowl", "Meager", "Primordial", "Condense", "Cling", "Perceive", "Conception", "Efficacious", "Cessation", "Rigor", "Prevalent", "Seal", "Advent", "Mediocre", "Resemble", "Arduous", "Underlie", "Ensue", "Negligible", "Grandiose", "Scheme", "Uniform", "Vacate", "Complete", "Indefinite", "Rebound", "Backdrop", "Shaft", "Foul", "Subside", "Merely", "Disruption", "Fault", "Reversing", "Blockage", "Skeptical", "Impend", "Default", "Abruptly", "Subtle", "Abrasion", "Divert", "Fringe"].sorted()
    // sorted()可對字串做字母上的排序
    
    let vegetarianList = ["四季花開健康蔬食"]
    let spicyList = [""]
    let noRiceList = ["呷尚宝", "瑞麟美而美", "珍膳美", "拉亞漢堡-三峡國學", "樂芙漢堡", "矻克食館", "McDonald's", "三禾手打麵"]
    
    
    let breakfastList, lunchList, dinnerList, cheapList, normalPriceList, expensiveList : [String]
    init() {
        restaurantNameArray = ["呷尚宝", "瑞麟美而美", "珍膳美", "拉亞漢堡-三峡國學", "樂芙漢堡", "怡蘭扁食", "大雄料理店", "旭寿司日式居食酒屋", "夯牛屋", "胡同43", "APPLE 203 Breakfast", "矻克食館", "韓讚", "享鮮自助餐", "大億小吃部", "觀大小館", "合饍居", "米卡義式餐坊", "舞子食堂", "茗食茶", "義把麵義式廚房", "川邊烤肉丼", "吉購吉", "帝一美食", "澤", "巧食雞", "嘉一自助餐", "御饌鼎皇-小火鍋北大店", "鬍鬚張滷肉飯", "McDonald's", "三茅武藏", "三禾手打麵", "魔法義大利", "古飽食堂", "巷口牛肉麵", "四季花開健康蔬食", "愛Sarang韓式風味小館"]
        breakfastList = ["呷尚宝", "瑞麟美而美", "珍膳美", "拉亞漢堡-三峡國學", "樂芙漢堡"]
        lunchList = ["瑞麟美而美", "怡蘭扁食", "大雄料理店", "旭寿司日式居食酒屋", "夯牛屋", "胡同43", "APPLE 203 Breakfast", "矻克食館", "韓讚", "大億小吃部", "義把麵義式台所", "吉購吉", "鬍鬚張滷肉飯", "McDonald's", "古飽食堂"]
        dinnerList = ["怡蘭扁食", "大雄料理店", "旭寿司日式居食酒屋", "夯牛屋", "胡同43", "矻克食館", "韓讚", "享鮮自助餐", "大億小吃部", "觀大小館", "合饍居", "米卡義式餐坊", "舞子食堂", "茗食茶", "義把麵義式廚房", "川邊烤肉丼", "吉購吉", "帝一美食", "澤", "巧食雞", "嘉一自助餐", "御饌鼎皇-小火鍋北大店", "鬍鬚張滷肉飯", "McDonald's", "三茅武藏", "三禾手打麵", "魔法義大利", "巷口牛肉麵", "四季花開健康蔬食", "愛Sarang韓式風味小館"]
        cheapList = ["呷尚宝", "瑞麟美而美", "珍膳美", "怡蘭扁食", "胡同43", "享鮮自助餐", "大億小吃部", "茗食茶", "嘉一自助餐", "古飽食堂", "巷口牛肉麵"]
        normalPriceList = ["拉亞漢堡-三峡國學", "樂芙漢堡", "APPLE 203 Breakfast", "矻克食館",  "觀大小館", "合饍居", "大雄料理店", "旭寿司日式居食酒屋", "夯牛屋","韓讚", "川邊烤肉丼", "吉購吉", "帝一美食", "澤", "巧食雞", "御饌鼎皇-小火鍋北大店", "McDonald's", "三茅武藏", "三禾手打麵", "四季花開健康蔬食", "愛Sarang韓式風味小館"]
        expensiveList = ["米卡義式餐坊", "舞子食堂", "義把麵義式廚房", "鬍鬚張滷肉飯"]
    }
    
    let garbageCanLatitudeArray = [24.946274, 24.947323, 24.944946]
    let garbageCanLontitudeArray = [121.372195, 121.371415, 121.369865]
    let garbageCanDiscription = ["Closed to the college of business.", "Closed to second front door.", "Closed to the college of social science."]
    
    
    var pushNotificationSwitchStatus : Bool = false
}
