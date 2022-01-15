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
        NavigationView{
            CustomTabBarContainerView(selection: $tabSelection) { 
                
                ActivityListView()
                    .tabBarItem(tab: .home, selection: $tabSelection)
                
                GoalsView()
                    .tabBarItem(tab: .goals, selection: $tabSelection)
                
                ProfileView()
                    .tabBarItem(tab: .profile, selection: $tabSelection)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
