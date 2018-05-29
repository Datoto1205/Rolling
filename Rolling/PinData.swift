//
//  PinData.swift
//  Rolling
//
//  Created by 李政恩 on 01/11/2017.
//  Copyright © 2017 Beichi Techonology. All rights reserved.
//

import Foundation
import MapKit

class PinAnnotation : NSObject, MKAnnotation {
    var title: String?
    var subtitle: String?
    var coordinate: CLLocationCoordinate2D
    
    init(title : String, subtitle : String, coordinate : CLLocationCoordinate2D) {
        self.title = title
        self.subtitle = subtitle
        self.coordinate = coordinate
    }
}
