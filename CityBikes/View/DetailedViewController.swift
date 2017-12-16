//
//  DetailedViewController.swift
//  CityBikes
//
//  Created by Richard Smith on 2017-12-16.
//  Copyright © 2017 Richard Smith. All rights reserved.
//

import UIKit
import MapKit

final class StationAnnotation: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    
    init (coordinate: CLLocationCoordinate2D, title: String, subtitle: String) {
        self.coordinate = coordinate
        self.title = title
        self.subtitle = subtitle
        
        super.init()
    }
}

class DetailedViewController: UIViewController, MKMapViewDelegate  {
    
    @IBOutlet var detailedViewModel: DetaliedViewModel!
    @IBOutlet weak var mapView: MKMapView! {
        didSet {
            mapView.mapType = .standard
            mapView.delegate = self
        }
    }
    var locationManager = CLLocationManager()
    
    var station: Station?
    var allStations: [Stations]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let allStationsWithoutNil = detailedViewModel.loadAllStations(stations: allStations, station: station)
        let stationWithoutNil = detailedViewModel.loadOneStation(stations: allStations, station: station)
        
//        let longitude = detailedViewModel.setLongitude(longitude: station?.longitude)
//        let latitude = detailedViewModel.setLatitude(latitude: station?.latitude)
//        let location = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
//
//        mapView.setRegion(MKCoordinateRegionMakeWithDistance(location, 1500, 1500), animated: true)
//
//        let pin = StationAnnotation(coordinate: location, title: detailedViewModel.setTitle(title: station?.name), subtitle: detailedViewModel.setSubtitle(numberOfAvaliableBikes: station?.freeBikes, numberOfSlots: station?.emptySlots))
//        mapView.addAnnotation(pin)
        
        let loopedStation: [Station] = detailedViewModel.stationOfStations(stations: allStationsWithoutNil)
        
        
        for stata in loopedStation {
                let annotation = MKPointAnnotation()
                let stataLat = detailedViewModel.setLatitude(latitude: stata.latitude)
                let stataLong = detailedViewModel.setLongitude(longitude: stata.longitude)
                annotation.title = detailedViewModel.setTitle(title: stata.name)
                annotation.subtitle = detailedViewModel.setSubtitle(numberOfAvaliableBikes: stata.freeBikes, numberOfSlots: stata.emptySlots)
                annotation.coordinate = CLLocationCoordinate2D(latitude: stataLat, longitude: stataLong)
                mapView.addAnnotation(annotation)
                mapView.setRegion(MKCoordinateRegionMakeWithDistance((annotation.coordinate), 1500, 1500), animated: true)
        }
    
    
        
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        checkUserAuthorizationStatus()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func checkUserAuthorizationStatus() {
        locationManager.delegate = self
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
            mapView.showsUserLocation == true
        } else {
            locationManager.requestWhenInUseAuthorization()
        }
    }
}
extension DetailedViewController : CLLocationManagerDelegate {
    
}
