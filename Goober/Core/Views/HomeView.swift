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
        UberMapViewRepresentable()
            .ignoresSafeArea()
    }
}

#Preview {
    HomeView()
}
