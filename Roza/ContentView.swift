//
//  ContentView.swift
//  Roza
//
//  Created by Luka Vujnovac on 18.12.2021..
//

import SwiftUI

struct ContentView: View {
    
    @State private var selection: String = "home"
    @State private var tabSelection: TabBarItem = .home
    
    var body: some View {
        CustomTabBarContainerView(selection: $tabSelection) { 
            Color.indigo
                .tabBarItem(tab: .home, selection: $tabSelection)
            
            Color.pink
                .tabBarItem(tab: .favourites, selection: $tabSelection)
            
            Color.blue
                .tabBarItem(tab: .profile, selection: $tabSelection)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
