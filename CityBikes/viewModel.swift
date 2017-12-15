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
    
    var stations: [Stations]?
    
    
    func getStationsLund(completion: @escaping () -> Void) {
        apiClient.fetchLundStations { (arrayOfStationsDictionaries) in
            DispatchQueue.main.async {
                self.stations?.append(arrayOfStationsDictionaries)
                completion()
            }
        }
    }
    func getStationsMalmo(completion: @escaping () -> Void) {
        apiClient.fetchMalmoStations { (arrayOfStationsDictionaries) in
            DispatchQueue.main.async {
                self.stations?.append(arrayOfStationsDictionaries)
                completion()
            }
        }
    }
    func numberOfItemsToDisplay(in section: Int) -> Int {
        return stations?[section].stations.count ?? 0
    }
    func numberOfLocationsToDisplay() -> Int {
        return stations?.count ?? 0
    }
    
    func stationNameToDisplay(for indexPath: IndexPath) -> String {
//        return stations?.stations[indexPath.row].name ?? ""
        return stations?[indexPath.section].stations[indexPath.row].name ?? ""
    }
    func numberOfFreeBikesToDisplay(for indexPath: IndexPath) -> String {
        if stations?[indexPath.section].stations[indexPath.row].freeBikes == 0 {
            return ""
        } else {
            return stations?[indexPath.section].stations[indexPath.row].freeBikes as! String
        }
    }
}
