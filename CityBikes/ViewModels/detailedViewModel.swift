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
        return title ?? ""
    }
    func setCoordinates(latitude: Double?, longitude: Double?) -> (Double, Double) {
        if let latitude = latitude, let longitude = longitude {
            return (latitude, longitude)
        } else {
            return (0.000 , 0.000)
        }
    }
    func setLatitude(latitude: Double?) -> Double {
        return latitude ?? 0.00
    }
    func setLongitude(longitude: Double?) -> Double {
        return longitude ?? 0.00
    }
    func loadAllStations(stations: [Stations]?) -> ([Stations])  {
        return stations ?? [Stations]()
    }
    func loadOneStation(station: Station?) -> Station {
        return station ?? Station(emptySlots: nil, freeBikes: nil, latitude: nil, longitude: nil, name: "")
    }

    func stationOfStations(stations: [Stations]) -> [Station] {
            for stat in stations {
                let stata = stat.stations
                print(stata)
                return stata
            }
            return [Station]()
    }
}
