//
//  course.swift
//  CityBikes
//
//  Created by Richard Smith on 2017-12-15.
//  Copyright © 2017 Richard Smith. All rights reserved.
//

import Foundation

struct WebSiteDescription: Decodable {
    let name: String
    let description: String
    let courses: [Course]
}
struct Course: Decodable {
    let id: Int?
    let name: String?
    let link: String?
    let imageUrl: String?
}
