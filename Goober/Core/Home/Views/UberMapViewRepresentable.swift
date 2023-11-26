//
//  UberMapViewRepresentable.swift
//  Goober
//
//  Created by Frank Guglielmo on 11/26/23.
//

import Foundation
import SwiftUI
import MapKit

//UIRepresnetable protocol for a mapView to allow us to use UIKit features in our SwiftUI App
//TODO: Refactor to handle MapKit integration with UIKit, may not even need this representable anymore
struct UberMapViewRepresentable: UIViewRepresentable {
    
    let mapView = MKMapView()
    let locationManager = LocationManager()
    
    //Makes the UIView for our SwiftUI Code to process
    func makeUIView(context: Context) -> some UIView {
        //The context helps figure out what's going on with the Coordinator so we can properly listen to it
        mapView.delegate = context.coordinator
        mapView.isRotateEnabled = false
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .follow
        
        return mapView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
    
    //Required by the UIRepresentable protocol for communicating between SwiftUI
    //and UIKit frameworks
    func makeCoordinator() -> MapCoordinator {
        return MapCoordinator(parent: self)
    }
}


extension UberMapViewRepresentable {
    //Middleman class between our UIKit functionality and our SwiftUI View. Since it
    //conforms to the MKMapViewDelegate protocol, it can be interpreted by our SwiftUI View
    //while also being manipulated using UIKit conventions.
    class MapCoordinator: NSObject, MKMapViewDelegate {
        let parent: UberMapViewRepresentable
        
        init(parent: UberMapViewRepresentable) {
            self.parent = parent
            super.init()
        }
        
        //When User Permissions changes on access to location, have the map view update 
        //to follow the user's location with the appropriate coordinates and span
        func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
            let region = MKCoordinateRegion(
                center: CLLocationCoordinate2D(latitude: userLocation.coordinate.latitude, longitude: userLocation.coordinate.longitude),
                span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
                
                parent.mapView.setRegion(region, animated: true)
                
        }
    }
}
