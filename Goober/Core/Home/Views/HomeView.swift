//
//  HomeView.swift
//  Goober
//
//  Created by Frank Guglielmo on 11/26/23.
//

import SwiftUI
import MapKit

struct HomeView: View {
    var body: some View {
        ZStack(alignment: .top) {
            //Map
            UberMapViewRepresentable()
                .ignoresSafeArea()
            //Search Bar
            LocationSearchActivationView()
                .padding(.top, 72)
            
            //Hamburger button
            MapViewActionButton()
                .padding(.leading)
                .padding(.top, 4)
        }
        
    }
}

#Preview {
    HomeView()
}
