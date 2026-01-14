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
    
    @State var publicKey : String
    @State var nodeposition : MapCameraPosition = .automatic
    @StateObject var vm = ChannelViewModel()
    
    var body : some View {
        Map(position: $nodeposition) {
            ForEach(vm.channelLocation) { location in
                Marker(location.name, coordinate: location.coordinate)
                    .tint(.green)
            }
        }
        .task {
            vm.fetchChannelGeodata(publicKey: publicKey)
        }
    }
}

#Preview() {
    MapView(publicKey: "03864ef025fde8fb587d989186ce6a4a186895ee44a926bfc370e2c366597a3f8f")
}
