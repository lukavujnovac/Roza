//
//  ActivityListView.swift
//  Roza
//
//  Created by Luka Vujnovac on 07.01.2022..
//

import SwiftUI

struct ActivityListView: View {
    
    let colorTheme: PinkColorTheme = PinkColorTheme()
    let dataService = MockData()
    
    let columns = [
        GridItem(.fixed(100)),
        GridItem(.flexible()),
    ]
    
    var body: some View {
        ZStack{
            Rectangle()
                .ignoresSafeArea()
                .foregroundColor(Color("backgroundColor"))
            VStack(spacing: 40) {
                
                Image(systemName: "crown.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
                    .foregroundColor(colorTheme.secondary)
                
                ActivityListItemView(
                    foregroundColor: colorTheme.primary,
                    imageName: "plus.circle",
                    imageColor: colorTheme.tertiary,
                    tappedImageColor: colorTheme.yellow,
                    tappedImageName: "plus.circle.fill",
                    text: "Custom", systemName: true)
                
                VStack(spacing: 10){
                    HStack {
                        Text("Fitness")
                            .withDefaultSubtitleFormatting()
                        Spacer()
                    }
                    
                    HStack(spacing: 10) {
                        VStack(spacing: 10){
                            ForEach(dataService.fitnessActivities1, id: \.self) {activity in 
                                ActivityListItemView(
                                    foregroundColor: colorTheme.secondary,
                                    imageName: activity.imageName,
                                    imageColor: colorTheme.yellow, 
                                    tappedImageColor: .purple,
                                    tappedImageName: activity.tappedImageName,
                                    text: activity.name, systemName: false)
                            }
                        }
                        
                        VStack(spacing: 10){
                            ForEach(dataService.fitnessActivities2, id: \.self) {activity in 
                                ActivityListItemView(
                                    foregroundColor: colorTheme.secondary,
                                    imageName: activity.imageName,
                                    imageColor: colorTheme.yellow, 
                                    tappedImageColor: .blue,
                                    tappedImageName: activity.tappedImageName,
                                    text: activity.name, systemName: false)
                            }
                        }
                    }
                }// kraj fitness vstacka
                
                VStack{
                    HStack {
                        Text("Learn")
                            .withDefaultSubtitleFormatting()
                        Spacer()
                    }
                    
                    HStack(spacing: 10) {
                        VStack(spacing: 10){
                            ForEach(dataService.learnActivites1, id: \.self) {activity in 
                                ActivityListItemView(
                                    foregroundColor: colorTheme.secondary,
                                    imageName: activity.imageName,
                                    imageColor: colorTheme.yellow, 
                                    tappedImageColor: colorTheme.secondary,
                                    tappedImageName: activity.tappedImageName,
                                    text: activity.name, systemName: true)
                            }
                        }
                        
                        VStack(spacing: 10){
                            ForEach(dataService.learnActivites2, id: \.self) {activity in 
                                ActivityListItemView(
                                    foregroundColor: colorTheme.secondary,
                                    imageName: activity.imageName,
                                    imageColor: colorTheme.yellow, 
                                    tappedImageColor: .yellow,
                                    tappedImageName: activity.tappedImageName,
                                    text: activity.name, systemName: true)
                            }
                        }
                    }
                }
                
                Spacer()
            }
            .padding(.horizontal, 20)
            .padding(.top, 50 )
        }
    }
}

struct ActivityListView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityListView()
    }
}


struct SubtitleViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 23, weight: .semibold, design: .rounded))
    }
}

extension View {
    func withDefaultSubtitleFormatting() -> some View {
        modifier(SubtitleViewModifier())
    }
}
