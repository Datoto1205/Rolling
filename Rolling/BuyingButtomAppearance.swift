//
//  BuyingButtomAppearance.swift
//  Rolling
//
//  Created by 李政恩 on 05/10/2017.
//  Copyright © 2017 Beichi Techonology. All rights reserved.
//

import UIKit

@IBDesignable
class BuyingButtomAppearance: UIButton {
        
        @IBInspectable var cornerRadious :CGFloat = 0 {
            didSet {
                self.layer.cornerRadius = cornerRadious
            }
        }
    
    @IBInspectable var borderWidth :CGFloat = 0 {
        didSet {
            self.layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var borderColor :UIColor = UIColor.clear {
        didSet {
            self.layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable var titleTextColor :UIColor = UIColor.clear {
        didSet {
            self.titleLabel?.textColor = titleTextColor
        }
    }
    
    @IBInspectable var ButtomBackgroundColor: UIColor = UIColor.clear {
        didSet {
            self.backgroundColor = ButtomBackgroundColor
        }
    }
    
}

