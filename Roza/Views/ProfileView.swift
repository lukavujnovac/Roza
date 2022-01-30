//
//  ProfileView.swift
//  Roza
//
//  Created by Luka Vujnovac on 15.01.2022..
//

import SwiftUI
import UserNotifications

struct ProfileView: View {
    
    let colorTheme: ColorThemeProtocol = BlueColorTheme()
    @StateObject var vm = ActivityDetailViewModel()
    
    var body: some View {
        ZStack {
            Rectangle()
                .ignoresSafeArea()
                .foregroundColor(colorTheme.background)
            
            VStack {
                HStack {
                    VStack(alignment: .leading ,spacing: 10) {
                        Text("Notifications")
                            .font(.system(size: 20, weight: .semibold, design: .rounded))
                        
                        Button("Request Permission") { 
                            NotificationManager.instance.requestAuthoratization()
                        }
                        
                        Button("Schedule Notification") { 
                            NotificationManager.instance.scheduleNotifications()
                        }
                        
                        Button("Cancel Notification") {
                            NotificationManager.instance.cancelNotifications()
                        }
                        
                    }
                    Spacer()
                }
                .padding(.horizontal, 30)
            }
        }.onAppear { 
            UIApplication.shared.applicationIconBadgeNumber = 0
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
