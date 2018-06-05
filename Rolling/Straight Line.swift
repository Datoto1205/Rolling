//  Created by Li Cheng-En.
//  Copyright © 2018. All rights reserved.
//

import UIKit

class straightLine : UIView {
    // We use the codes in this class to set the property of that light blue line in our App.
    
    var color = UIColor(red: 220/255, green: 235/255, blue: 244/255, alpha: 1)
    
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
