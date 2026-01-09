//
//  TabView.swift
//  BipaChallenge
//
//  Created by Guilherme Fabbri on 08/01/26.
//

import SwiftUI

struct MainTabView : View {
    var body : some View {
        
        TabView {

              NavigationStack {
                  ListView()
              }
  
              .tabItem {
                  Label("Nodes", systemImage: "bitcoinsign")
              }
  
              NavigationStack {
                  MapView()
              }
              .tabItem {
                  Label("Mapa", systemImage: "map")
              }

      }
        
    }
}

#Preview() {
    ListView()
}
