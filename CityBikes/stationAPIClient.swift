//
//  stationApi.swift
//  CityBikes
//
//  Created by Richard Smith on 2017-12-15.
//  Copyright © 2017 Richard Smith. All rights reserved.
//

import Foundation

class StationAPI: NSObject {
    func fetchMalmoStations(completion: @escaping (Stations) -> ()) {
        let jsonUrlString = "https://api.citybik.es/v2/networks/malmobybike"
        let url = URL(string: jsonUrlString)
        
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            guard let data = data else{ return}
            do {
                let jsonResponse = try JSONDecoder().decode(Network.self, from: data)
                completion(jsonResponse.network)
                return
            } catch let error {
                print(error.localizedDescription)
            }
            
            }.resume()
        }
    func fetchLundStations(completion: @escaping (Stations) -> ()) {
        let jsonUrlString = "https://api.citybik.es/v2/networks/lundahoj"
        let url = URL(string: jsonUrlString)
        
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            guard let data = data else{ return}
            do {
                let jsonResponse = try JSONDecoder().decode(Network.self, from: data)
                completion(jsonResponse.network)
                return
            } catch let error {
                print(error.localizedDescription)
            }
            
            }.resume()
    }
}

