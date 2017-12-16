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
    
    var malmoResponse: Stations?
    var stations: [Stations]?
    
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
        if stations?[indexPath.section].stations[indexPath.row].freeBikes == 0 {
            return ""
        } else {
            return String(describing: stations?[indexPath.section].stations[indexPath.row].freeBikes)
        }
        //        return objectsArray?[indexPath.section].sectionObject[indexPath.row] ?? ""
    }
    func userSelectRowAt(for indexPath: IndexPath) -> String {
        return stations?[indexPath.section].stations[indexPath.row].name ?? ""
    }
}

