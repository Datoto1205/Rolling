//
//  ChoosingButtomVController.swift
//  Rolling
//
//  Created by 李政恩 on 22/09/2017.
//  Copyright © 2017 Beichi Techonology. All rights reserved.
//

import UIKit

@IBDesignable
class ButtonAppearance: UIButton {
    
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
