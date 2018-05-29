//
//  Straight Line.swift
//  Rolling
//
//  Created by 李政恩 on 26/09/2017.
//  Copyright © 2017 Beichi Techonology. All rights reserved.
//

import UIKit

class straightLine : UIView {
    
    var color = UIColor(colorLiteralRed: 220/255, green: 235/255, blue: 244/255, alpha: 1)
    
    func straightLinePath() -> UIBezierPath {
        let start = CGPoint(x: bounds.minX + 40, y:bounds.midY)
        let end = CGPoint(x: bounds.maxX - 40, y: bounds.midY)
        
        let path = UIBezierPath()
        path.move(to: start)
        path.addLine(to: end)
        
        path.lineWidth = CGFloat(3.0)
        
        return path
    }
    
    override func draw(_ rect: CGRect) {
        color.set()
        straightLinePath().stroke()
    }
}
