//
//  Video+MKAnnotation.swift
//  VideoMap
//
//  Created by Brandi Bailey on 1/16/20.
//  Copyright © 2020 Brandi Bailey. All rights reserved.
//

import MapKit

extension Video: MKAnnotation {
    
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    
}
