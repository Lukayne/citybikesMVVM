//
//  detailedViewModel.swift
//  CityBikes
//
//  Created by Richard Smith on 2017-12-16.
//  Copyright © 2017 Richard Smith. All rights reserved.
//

import Foundation

class DetaliedViewModel: NSObject {
    func setSubtitle(numberOfAvaliableBikes: Int?, numberOfSlots: Int?) -> String {
        if let numberOfAvaliableBikes = numberOfAvaliableBikes, let numberOfSlots = numberOfSlots {
            return String("Antalet lediga platser: \(numberOfSlots) \nCyklar till utlåning: \(numberOfAvaliableBikes)")
        } else {
            return "Antalet lediga platser: Unknown \nCyklar till utlåning: Unknown"
        }
    }
    func setTitle(title: String?) -> String {
        if let title = title {
            return title
        } else {
            return ""
        }
    }
    func setCoordinates(latitude: Double?, longitude: Double?) -> (Double, Double) {
        if let latitude = latitude, let longitude = longitude {
            return (latitude, longitude)
        } else {
            return (0.000 , 0.000)
        }
    }
    func setLatitude(latitude: Double?) -> Double {
        if let latitude = latitude {
            return latitude
        } else {
            return 0.000
        }
    }
    func setLongitude(longitude: Double?) -> Double {
        if let longitude = longitude {
            return longitude
        } else {
            return 0.000
        }
    }
}
