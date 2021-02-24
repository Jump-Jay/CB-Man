//
//  CB Shops.swift
//  CB Man
//
//  Created by Jason M Davis on 2/14/21.
//

import UIKit
import MapKit


class CB_Shops: NSObject, MKAnnotation {
    var title: String?
    var coordinate: CLLocationCoordinate2D
    var info: String?

    init(title: String, coordinate: CLLocationCoordinate2D, info: String) {
        self.title = title
        self.coordinate = coordinate
        self.info = info
    }
}
