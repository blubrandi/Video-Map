//
//  Video.swift
//  VideoMap
//
//  Created by Brandi Bailey on 1/16/20.
//  Copyright © 2020 Brandi Bailey. All rights reserved.
//

import Foundation

class Video: NSObject {
    
    var video: URL
    var title: String?
    var latitude: Double
    var longitude: Double
    var date: Date
    
    init(video: URL, title: String?, latitude: Double, longitude: Double, date: Date) {
        
        self.video = video
        self.title = title
        self.latitude = latitude
        self.longitude = longitude
        self.date = date
        
    }
}
