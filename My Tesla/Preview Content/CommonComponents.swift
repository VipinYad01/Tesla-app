//
//  CommonComponents.swift
//  My Tesla
//
//  Created by vipin on 21/03/25.
//
import Foundation

import SwiftUI
import MapKit

struct MapView: View {
    @State private var position: MapCameraPosition =  .region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude:  27.1751, longitude: 78.0421) , span: .init(latitudeDelta: 0.0001, longitudeDelta: 0.0001)
        )
    )

    var body: some View {
        Map(position: $position) {
            UserAnnotation()
        }
        .mapStyle(.imagery)
        .mapControls {
        MapUserLocationButton()
           MapCompass()
        }
        .edgesIgnoringSafeArea(.all)
    }
}
    
