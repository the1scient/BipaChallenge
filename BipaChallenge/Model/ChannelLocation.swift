//
//  NodeMap.swift
//  BipaChallenge
//
//  Created by Guilherme Fabbri on 11/01/26.
//

import Foundation
import CoreLocation

struct ChannelLocation : Identifiable, Decodable {
    var id = UUID()
    
    let name : String
    let latitude : Double
    let longitude : Double
    
    var coordinate : CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}


