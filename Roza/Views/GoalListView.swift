//
//  ActivityDetailView.swift
//  Roza
//
//  Created by Luka Vujnovac on 08.01.2022..
//

import SwiftUI
import Combine

struct GoalListView: View {
    
    @StateObject var vm = ActivityListViewModel()
    
    let colorTheme: ColorThemeProtocol = YellowColorTheme()
    @State private var tapped: Bool = false
    @State private var showingSheet = false
    
    var body: some View {
        
        ZStack{
            Rectangle()
                .ignoresSafeArea()
                .foregroundColor(colorTheme.background)
            
            VStack(spacing: 40){
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 200, height: 60)
                    .foregroundColor(colorTheme.primary)
                    .shadow(color: colorTheme.secondary, radius: 5, x: 0, y: 6)
                    .overlay(
                        HStack{
                            Image(systemName: "plus.square")
                                .foregroundColor(colorTheme.secondary)
                            Text("add")
                                .fontWeight(.bold)
                                .foregroundColor(colorTheme.secondary)
                        }
                    )
                    .onTapGesture {
                        showingSheet.toggle()
                    }
                
                ScrollView{
                    VStack(spacing: 15) {
                        ForEach(vm.dataService.goals, id: \.self) { goal in
                                GoalCellView(goalCellViewModel: GoalCellViewModel(goal: goal))
                                .frame(height: 80)
                        }
                        .padding(.horizontal, 30)
                    }
                }
                Spacer()
            }
            .sheet(isPresented: $showingSheet) { 
                AddGoalSheet()
            }
        }
    }
}

struct ActivityDetailView_Previews: PreviewProvider {
    static var previews: some View {
        GoalListView()
    }
}

struct AddGoalSheet: View {
    
    @StateObject var vm = ActivityListViewModel()
    
    @State private var goalText: String = ""
    
    var body: some View {
        ZStack {
            Rectangle()
                .ignoresSafeArea()
                .foregroundColor(Color("lightYellow"))
            VStack(spacing: 200){
                TextField("Add New Goal", text: $goalText)
                    .lineLimit(2)
                    .padding()
                    .background(Color("babyBlue").cornerRadius(10))
                    .padding(.horizontal, 20)
                
                
                Button { 
                    vm.dataService.goals.append(Goal(name: goalText))
                    goalText = ""
                } label: { 
                    Text("Save")
                        .foregroundColor(Color("tertiaryColor"))
                        .font(.system(size: 20, weight: .semibold, design: .rounded))
                        .padding()
                        .background(Color("primaryColor").cornerRadius(10))
                }
            }
        }
    }
}
