//
//  Photos.swift
//  JSON Codable
//
//  Created by Felipe Costa on 9/6/19.
//  Copyright © 2019 Felipe Costa. All rights reserved.
//

import Foundation

struct Photos: Codable{
    var status: String
    var photosPath: String
    var photos: [Photo]
}

struct Photo: Codable {
    let image: String
    let title: String
    let description: String
    let latitude: Double
    let longitude: Double
    let date: String
}


