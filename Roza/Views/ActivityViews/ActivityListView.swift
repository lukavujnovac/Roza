//
//  ActivityListView.swift
//  Roza
//
//  Created by Luka Vujnovac on 07.01.2022..
//

import SwiftUI

struct ActivityListView: View {
    
    @StateObject var vm = ActivityListViewModel()
    let colorTheme: PinkColorTheme = PinkColorTheme()
    @State private var showSheet: Bool = false
    
    var body: some View {
        ZStack{
            Rectangle()
                .ignoresSafeArea()
                .foregroundColor(Color("primaryColor").opacity(0.1))
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
                        .onTapGesture {
                            showSheet.toggle()
                        }
                
                VStack(spacing: 10){
                    HStack {
                        Text("Fitness")
                            .withDefaultSubtitleFormatting()
                        Spacer()
                    }
                    
                    HStack(spacing: 10) {
                        VStack(spacing: 10){
                            ForEach(vm.dataService.fitnessActivities1, id: \.self) {activity in 
                                NavigationLink { 
                                    ActivityDetailView(activity: activity)
                                } label: { 
                                    ActivityListItemView(
                                        foregroundColor: colorTheme.secondary,
                                        imageName: activity.imageName,
                                        imageColor: colorTheme.yellow, 
                                        tappedImageColor: .yellow,
                                        tappedImageName: activity.tappedImageName,
                                        text: activity.name, systemName: false)
//                                        .onTapGesture {
//                                            showSheet.toggle()
//                                        }
                                }
                            }
                            
                        }
                        
                        VStack(spacing: 10){
                            ForEach(vm.dataService.fitnessActivities2, id: \.self) {activity in 
                                NavigationLink { 
                                    ActivityDetailView(activity: activity)
                                } label: { 
                                    ActivityListItemView(
                                        foregroundColor: colorTheme.secondary,
                                        imageName: activity.imageName,
                                        imageColor: colorTheme.yellow, 
                                        tappedImageColor: .yellow,
                                        tappedImageName: activity.tappedImageName,
                                        text: activity.name, systemName: false)
                                }
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
                            ForEach(vm.dataService.learnActivities1, id: \.self) {activity in 
                                NavigationLink { 
                                    ActivityDetailView(activity: activity)
                                } label: { 
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
                        
                        VStack(spacing: 10){
                            ForEach(vm.dataService.learnActivities2, id: \.self) {activity in 
                                NavigationLink { 
                                    ActivityDetailView(activity: activity)
                                } label: { 
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
                }
                
                Spacer()
            }
            .padding(.horizontal, 20)
            .padding(.top, 50 )
            .sheet(isPresented: $showSheet) { 
                ActivityDetailView(activity: nil)
            }
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

struct SheetView: View {
    @Environment(\.dismiss) var dismiss

    var body: some View {
        Button("Press to dismiss") {
            dismiss()
        }
        .font(.title)
        .padding()
        .background(Color.black)
    }
}

