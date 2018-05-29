//
//  SecretPhotoExtension.swift
//  Rolling
//
//  Created by 李政恩 on 23/10/2017.
//  Copyright © 2017 Beichi Techonology. All rights reserved.
//

import UIKit

extension UIAlertController {
    func addImage(image: UIImage) {
        let maxSize = CGSize(width: 245, height: 245)
        let imgSize = image.size
        
        var ZoomRatio: CGFloat!
        if imgSize.width > imgSize.height {
            ZoomRatio = maxSize.width / imgSize.width
        } else {
            ZoomRatio = maxSize.height / imgSize.height
        }
        
        let scaleSize = CGSize(width: imgSize.width * ZoomRatio, height: imgSize.height * ZoomRatio)
        var resizedImage = image.imageWithSize(scaleSize)
        
        if imgSize.height > imgSize.width {
            let left = (maxSize.width - resizedImage.size.width) / 2
            resizedImage = resizedImage.withAlignmentRectInsets(UIEdgeInsetsMake(0, -left, 0, 0))
        }
        
        let imageAction = UIAlertAction(title: "", style: .default, handler: nil)
        imageAction.isEnabled = false
        imageAction.setValue(resizedImage.withRenderingMode(.alwaysOriginal), forKey: "image")
        self.addAction(imageAction)
        // "withRenderingMode(.alwaysOriginal)" means that the photo was shown with original resolution.
         
    }
}
