//  Created by Li Cheng-En.
//  Copyright © 2018. All rights reserved.
//

import UIKit

@IBDesignable
class ButtonAppearance: UIButton {
    // We use the codes in this class to set the property of that white-ring selection button in our App.
    
    @IBInspectable var cornerRadious :CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = cornerRadious
        }
    }
    // Roundcorner bottom
    
    @IBInspectable var CustomizeBorderWidth :CGFloat = 0 {
        didSet {
            self.layer.borderWidth = CustomizeBorderWidth
        }
    }
    // Set the width of button's border
    
    @IBInspectable var CustomizeBorderCOlor : UIColor = UIColor.clear {
        didSet {
            self.layer.borderColor = CustomizeBorderCOlor.cgColor
        }
    }
    // Set the color of button's border
}
