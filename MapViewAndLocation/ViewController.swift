//
//  ViewController.swift
//  MapViewAndLocation
//
//  Created by Mac on 6.10.20.
//  Copyright © 2020 peter. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController {

    
   @IBOutlet weak var mymap: MKMapView!
    
    let locationM = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationM.delegate = self
        locationM.requestWhenInUseAuthorization()
        locationM.startUpdatingLocation()
    }
}
// MARK: - user Location
extension ViewController: CLLocationManagerDelegate {
    
    // MARK: - func for update locations on user.
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let span = MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)
        let region = MKCoordinateRegion(center: locations[0].coordinate, span: span)
        
        mymap.setRegion(region, animated: true)
        mymap.showsUserLocation = true
        mymap.showsCompass = true
        
    }
}
