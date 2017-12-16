//
//  viewModel.swift
//  CityBikes
//
//  Created by Richard Smith on 2017-12-15.
//  Copyright © 2017 Richard Smith. All rights reserved.
//

import Foundation

class ViewModel: NSObject {
    @IBOutlet var apiClient: StationAPI!
    
    private var malmoResponse: Stations?
    private var stations: [Stations]?
    
    func getStationsLund(completion: @escaping () -> Void) {
        apiClient.fetchLundStations { (arrayOfStationsDictionaries) in
            DispatchQueue.main.async {
                self.stations = [arrayOfStationsDictionaries]
                completion()
            }
        }
    }
    func getStationsMalmo(completion: @escaping () -> Void) {
        apiClient.fetchMalmoStations { (arrayOfStationsDictionaries) in
            DispatchQueue.main.async {
                self.malmoResponse = arrayOfStationsDictionaries
                self.stations?.append(self.malmoResponse!)
                completion()
            }
        }
    }
    func getStations() -> [Stations] {
        return self.stations ?? [Stations]()
    }
    
    func numberOfItemsToDisplay(in section: Int) -> Int {
        return stations?[section].stations.count ?? 0
        //        return objectsArray?[section].sectionObject.count ?? 0
    }
    func numberOfLocationsToDisplay() -> Int {
        return stations?.count ?? 0
        //    return objectsArray?.count ?? 0
    }
    
    func nameForSectionToDisplay(section: Int) -> String {
        return stations?[section].location.city ?? ""
        //    return objectsArray?[section].sectionName ?? ""
    }
    
    func stationNameToDisplay(for indexPath: IndexPath) -> String {
        //        return stations?.stations[indexPath.row].name ?? ""
        return stations?[indexPath.section].stations[indexPath.row].name ?? ""
        //        return objectsArray?[indexPath.section].sectionObject[indexPath.row] ?? ""
        
    }
    func numberOfFreeBikesToDisplay(for indexPath: IndexPath) -> String {
        if let station = stations?[indexPath.section].stations[indexPath.row].freeBikes {
            return String(station)
        } else {
            return ""
        }
        //        return objectsArray?[indexPath.section].sectionObject[indexPath.row] ?? ""
    }
    func userSelectRowAt(for indexPath: IndexPath) -> Station {
        return stations?[indexPath.section].stations[indexPath.row] ?? Station(emptySlots: nil, freeBikes: nil, latitude: nil, longitude: nil, name: "")
    }
}

