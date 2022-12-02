//
//  ContentView.swift
//  Overseerr
//
//  Created by Nataniel Martin on 25/11/2022.
//

import SwiftUI

struct ContentView: View {
    
    init() {
        Theme.navigationBarColors(background: UIColor(Color.clear), titleColor: .white)
    }
    
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
            SearchView()
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
