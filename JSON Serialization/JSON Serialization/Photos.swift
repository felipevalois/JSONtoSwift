//
//  Photos.swift
//  JSON Serialization
//
//  Created by Felipe Costa on 9/6/19.
//  Copyright © 2019 Felipe Costa. All rights reserved.
//

import Foundation


struct Photos: Codable{
    let status: String
    let photosPath: String
    let photos: [Photo]
    
    init(status: String, path: String, photosObj: [[String: Any]]){
        self.status = status
        self.photosPath = path
        var photos = [Photo]()
        for p in photosObj {
            let image = p["image"] as! String
            let description = p["description"] as! String
            let title = p["title"] as! String
            let latitude = p["latitude"] as! Double
            let longitude = p["longitude"] as! Double
            let date = p["date"] as! String
            photos.append(Photo(image: image, title: title, description: description, latitude: latitude, longitude: longitude, date: date))
        }
        self.photos = photos
    }
}

struct Photo: Codable {
    let image: String
    let title: String
    let description: String
    let latitude: Double
    let longitude: Double
    let date: String
}

