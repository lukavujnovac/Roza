//
//  ProfileView.swift
//  Roza
//
//  Created by Luka Vujnovac on 15.01.2022..
//

import SwiftUI

struct ProfileView: View {
    
    let colorTheme: ColorThemeProtocol = BlueColorTheme()
    @StateObject var vm = ActivityDetailViewModel()
    
    var body: some View {
        ZStack {
            Rectangle()
                .ignoresSafeArea()
                .foregroundColor(colorTheme.background)
            
            VStack{
                Text("Your past activities")
                
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
