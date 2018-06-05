//  Created by Li Cheng-En.
//  Copyright © 2018. All rights reserved.
//

import UIKit

class RestaurantTableViewCell: UITableViewCell {
    
    @IBOutlet weak var RestaurantPicture: UIImageView!
    // Connect UI picture
    
    @IBOutlet weak var RestaurantName: UILabel!
    // Connect UI label 1 which would show restaurant's name.
    
    @IBOutlet weak var RestaurantDescription: UILabel!
    // Connect UI label 2 which would show restaurant's site.
    
    @IBOutlet weak var BackGroundCard: UIView!
    // Connect UI view which would show the background of that card part.
    
    override func awakeFromNib() {
        super.awakeFromNib()
        RestaurantPicture.layer.cornerRadius = 44
        RestaurantPicture.layer.masksToBounds = true
        // Initialization code
        // Create the round corner.
        
        BackGroundCard.backgroundColor = UIColor.white
        contentView.backgroundColor = UIColor(red: 240.0/255.0, green: 240.0/255.0, blue: 240.0/255.0, alpha: 1) 
        BackGroundCard.layer.cornerRadius = 3.0
        BackGroundCard.layer.masksToBounds = false
        // Set the properties of those card part.
        // Content view indicate the background of that table view.
        
        BackGroundCard.layer.shadowColor = UIColor.black.withAlphaComponent(0.2).cgColor
        BackGroundCard.layer.shadowOffset = CGSize(width: 0, height: 0)
        BackGroundCard.layer.shadowOpacity = 0.8
        // Set some visual effect to those card part.
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
}
