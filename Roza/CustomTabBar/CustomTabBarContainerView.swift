//
//  CustomTabBarContainerView.swift
//  Roza
//
//  Created by Luka Vujnovac on 18.12.2021..
//

import SwiftUI

struct CustomTabBarContainerView<Content: View>: View {
    
    @Binding var selection: TabBarItem
    
    let content: Content
    
    @State private var tabs: [TabBarItem] = []
    
    public init(selection: Binding<TabBarItem>, @ViewBuilder content: () -> Content) {
        self._selection = selection
        self.content = content()
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            content.ignoresSafeArea()
            
            CustomTabBarView(tabs: tabs, selection: $selection, localSelection: selection)
        }
        .onPreferenceChange(TabBarItemPreferenceKeys.self) { value in
            self.tabs = value
        }
    }
}

struct CustomTabBarContainerView_Previews: PreviewProvider {
    
    static let tabs: [TabBarItem] = [.home, .favourites, .profile]
    
    static var previews: some View {
        CustomTabBarContainerView(selection: .constant(tabs.first!)) { 
            Color.red
        }
    }
}

enum TabBarItem: Hashable {
    case home, favourites, profile
    
    var iconName: String {
        switch self {
            case .home: return "house"
            case .favourites: return "heart"
            case .profile: return "person"
        }
    }
    
    var title: String {
        switch self {
            case .home: return "home"
            case .favourites: return "favourites"
            case .profile: return "profile"
        }
    }
    
    var color: Color {
        switch self {
            case .home: return .indigo
            case .favourites: return .pink
            case .profile: return .blue
        }
    }
}
