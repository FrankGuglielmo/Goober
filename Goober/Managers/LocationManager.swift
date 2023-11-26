//
//  LocationManager.swift
//  Goober
//
//  Created by Frank Guglielmo on 11/26/23.
//

import Foundation
import CoreLocation

//Used for grabbing initial permissions and listening for any changes to permissions.
//Rest of the updateLocations will be done by MapView and MapCoordinator
//We do this because we can only ask the user for location services through Core Location framework
//and not through the MapView.
class LocationManager: NSObject, ObservableObject {
    private let locationManager = CLLocationManager()
    
    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
}

extension LocationManager: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard !locations.isEmpty else { return }
        locationManager.stopUpdatingLocation()
    }
}
