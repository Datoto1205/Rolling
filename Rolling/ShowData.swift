//  Created by Li Cheng-En.
//  Copyright © 2018. All rights reserved.
//

import Foundation

class showData {
    // I store all of the data I did not need to change here.
    
    let settingOption1 = ["Push Notification Settings", "Push Notification", "Notification time"]
    let settingOption2 = ["Support", "Help Center", "Problem Reporting"]
    let settingOption3 = ["About", "Introduction of Developer", "Version"]
    
    let advancedSearchFunctionName = ["Kind of Meal", "Price"]
    
    let restaurantNameArray : [String]
    let restaurantSitesArray = [
        "No. 15, Guoji 2st Street, Sanxia District",
        "No. 88, Daguan Road, Sanxia District",
        "No. 55, Guoxue Street, Sanxia District",
        "No. 43, Guoxue Street, Sanxia District",
        "No. 479, Dade Road, Sanxia District",
        "No. 86, Guoxue Street, Sanxia District",
        "No. 51, Guoxue Street, Sanxia District",
        "No. 39, Guoji 1st Street, Sanxia District",
        "No. 41, Guoji 1st Street, Sanxia District",
        "No. 43, Guoji 1st Street, Sanxia District",
        "No. 37, Guoji 2nd Street, Sanxia District",
        "No. 45, Guoji 1st Street, Sanxia District",
        "No. 47, Guoji 1st Street, Sanxia District",
        "No. 251, Dayi Road, Sanxia District",
        "No. 43, Guoxue Street, Sanxia District",
        "No. 30, Daguan Road, Sanxia District",
        "No. 24, Daguan Road, Sanxia District",
        "No. 90, Daguan Road, Sanxia District",
        "No. 96-1, Daguan Road, Sanxia District",
        "No. 313, Daguan Road, Sanxia District",
        "No. 88, Guoxue Street, Sanxia District",
        "No. 220, Dade Road, Sanxia District",
        "No. 222, Dade Road, Sanxia District",
        "No. 96, Xueqin Road, Sanxia District",
        "No. 37, Guoji 1st Street, Sanxia District",
        "No. 86, Daguan Road, Sanxia District",
        "No. 261, Dayi Road, Sanxia District",
        "No. 228, Xuecheng Road, Sanxia District",
        "No. 250, Xuecheng Rd, Sanxia District",
        "No. 258, Xuecheng Road, Sanxia District",
        "No. 28, Daguan Road, Sanxia District",
        "No. 123, Dade Road, Sanxia District",
        "No. 1, Guoji 2nd Street, Sanxia District",
        "No. 32, Guoji 1st Street, Sanxia District",
        "No.1, Aly. 1, Ln. 367, Fuxing Rd., Sanxia Dist.",
        "No. 29, Guoji 1st Street, Sanxia District",
        "No. 170, Xueqin Rd, Sanxia District"]
    let URLOfRestaurantPics: [String] = [
        "https://user-images.githubusercontent.com/32284698/45366743-1a32bf00-b612-11e8-93d7-b8a4bd0d089f.jpg",
        "https://user-images.githubusercontent.com/32284698/45366818-5534f280-b612-11e8-92b3-504cda9846df.jpg",
        "https://user-images.githubusercontent.com/32284698/45366983-c1aff180-b612-11e8-974d-d58600a9465e.jpg",
        "https://user-images.githubusercontent.com/32284698/45367162-38e58580-b613-11e8-9ecc-190ab358a592.jpg",
        "https://user-images.githubusercontent.com/32284698/45368519-5ff18680-b616-11e8-95bf-3d9a7c226409.jpg",
        "https://user-images.githubusercontent.com/32284698/45368573-7ef01880-b616-11e8-87b8-aef6b18e0cc8.jpg",
        "https://user-images.githubusercontent.com/32284698/45368614-95966f80-b616-11e8-8269-54ad22a81b03.jpg",
        "https://user-images.githubusercontent.com/32284698/45368672-b65ec500-b616-11e8-83df-209148790670.jpg",
        "https://user-images.githubusercontent.com/32284698/45368698-ca0a2b80-b616-11e8-829f-ad91c91f0eb1.jpg",
        "https://user-images.githubusercontent.com/32284698/45368819-15bcd500-b617-11e8-83ef-e03931a119fd.jpg",
        "https://user-images.githubusercontent.com/32284698/45368842-20776a00-b617-11e8-91bf-b217501d4e86.jpg",
        "https://user-images.githubusercontent.com/32284698/45368860-2d945900-b617-11e8-9d67-0178e62eabb7.jpg",
        "https://user-images.githubusercontent.com/32284698/45368926-4d2b8180-b617-11e8-8e6e-beb7b1240e53.jpg",
        "https://user-images.githubusercontent.com/32284698/45368944-587ead00-b617-11e8-96fc-cec075497f20.jpg",
        "https://user-images.githubusercontent.com/32284698/45368997-75b37b80-b617-11e8-8bcc-2ebe08734027.jpg",
        "https://user-images.githubusercontent.com/32284698/45369017-84019780-b617-11e8-8251-dc385591523e.jpg",
        "https://user-images.githubusercontent.com/32284698/45369081-aabfce00-b617-11e8-8228-f4f5195f8991.jpg",
        "https://user-images.githubusercontent.com/32284698/45369102-b1e6dc00-b617-11e8-9649-17a35ac1d534.jpg",
        "https://user-images.githubusercontent.com/32284698/45369167-de025d00-b617-11e8-8c43-e1bcb3055378.jpg",
        "https://user-images.githubusercontent.com/32284698/45369183-e35fa780-b617-11e8-99eb-9990968f1923.jpg",
        "https://user-images.githubusercontent.com/32284698/45369204-eeb2d300-b617-11e8-9e6d-695a8d3f8e11.jpg",
        "https://user-images.githubusercontent.com/32284698/45369228-fd00ef00-b617-11e8-9056-f633f47357e2.jpg",
        "https://user-images.githubusercontent.com/32284698/45369247-0a1dde00-b618-11e8-9a87-9ec58c61fa94.jpg",
        "https://user-images.githubusercontent.com/32284698/45369264-130eaf80-b618-11e8-884d-008b7b53677c.jpg",
        "https://user-images.githubusercontent.com/32284698/45369360-47826b80-b618-11e8-8074-02bd81273ec3.jpg",
        "https://user-images.githubusercontent.com/32284698/45369378-510bd380-b618-11e8-997e-4066e83e8480.jpg",
        "https://user-images.githubusercontent.com/32284698/45369690-0f2f5d00-b619-11e8-8d31-7e06327f9b89.jpg",
        "https://user-images.githubusercontent.com/32284698/45369718-1fdfd300-b619-11e8-9093-b6864ea42dfe.jpg",
        "https://user-images.githubusercontent.com/32284698/45369731-266e4a80-b619-11e8-8290-9de738f12b25.jpg",
        "https://user-images.githubusercontent.com/32284698/45369780-469e0980-b619-11e8-998e-e35fe9384f56.jpg",
        "https://user-images.githubusercontent.com/32284698/45369796-50277180-b619-11e8-9c67-a5f26187759a.jpg",
        "https://user-images.githubusercontent.com/32284698/45370008-dcd22f80-b619-11e8-8bd3-f820a378a096.jpg",
        "https://user-images.githubusercontent.com/32284698/45370032-e8255b00-b619-11e8-88b1-23c94a421aa4.jpg",
        "https://user-images.githubusercontent.com/32284698/45370087-01c6a280-b61a-11e8-9672-16f94f18735a.jpg",
        "https://user-images.githubusercontent.com/32284698/45370097-0c813780-b61a-11e8-95aa-a0a466874dba.jpg",
        "https://user-images.githubusercontent.com/32284698/45370121-1f940780-b61a-11e8-8b2a-da2df1a65cf2.jpg",
        "https://user-images.githubusercontent.com/32284698/45370148-2ae73300-b61a-11e8-9214-60a5fdea1ef6.jpg"
        ]
    
    
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
    
    let garbageCanLatitudeArray = [24.946274, 24.947323, 24.944946, 24.942480, 24.946744, 24.946180, 24.944459, 24.940831, 24.943106, 24.942074, 24.942240, 24.943142, 24.941825, 24.939692, 24.939249 ]
    let garbageCanLontitudeArray = [121.372195, 121.371415, 121.369865, 121.369188, 121.371404, 121.369060, 121.373554, 121.368343, 121.368031, 121.367381, 121.366298, 121.365316, 121.364124, 121.364266, 121.367083]
    let garbageCanDiscription = ["Closed to the college of business.", "Closed to second front door.", "Closed to the college of social science.", "Closed to the boy student dormitory", "Closed to the college of humanities.", "Closed to the basketball court", "Closed to the college of law.", "Closed to the girl student dormitory", "Closed to the Mind Lake.", "Closed to the brook near the dormitories.", "Closed to the toilet besides to the brook near the dormitories.", "Closed to the Long-En Gate", "Closed to the baseball field", "Closed to the university outdoor track and field", "Closed to the gym of our university"]
    
    
   
}
