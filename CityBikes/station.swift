//
//  station.swift
//  CityBikes
//
//  Created by Richard Smith on 2017-12-15.
//  Copyright © 2017 Richard Smith. All rights reserved.
//

import Foundation

struct Network: Decodable {
    let network: Stations
}

struct Stations: Decodable {
    let location: Location
    let stations: [Station]
}

struct Location: Decodable {
    let city: String?
}

struct Station: Decodable {
    let emptySlots: Int?
    let freeBikes: Int?
    let latitude: Double?
    let longitude: Double?
    let name: String?

    enum CodingKeys : String, CodingKey {
        case emptySlots = "empty_slots"
        case freeBikes = "free_bikes"
        case latitude
        case longitude
        case name
    }
}

