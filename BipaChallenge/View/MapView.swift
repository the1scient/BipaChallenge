//
//  MapView.swift
//  BipaChallenge
//
//  Created by Guilherme Fabbri on 08/01/26.
//

import SwiftUI
import MapKit

struct MapView : View {
    
    let home = CLLocationCoordinate2D(latitude: -23.602074, longitude: -46.645464)
    
    @State var nodeposition : MapCameraPosition = .automatic
    
    var body : some View {
        
        Map(position: $nodeposition) {
            Marker("Casa", coordinate: home)
                .tint(.green)
        }
        
        
    }
}

#Preview() {
    MapView()
}
