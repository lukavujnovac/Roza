//
//  ActivityDetailView.swift
//  Roza
//
//  Created by Luka Vujnovac on 08.01.2022..
//

import SwiftUI
import Combine

struct GoalListView: View {
    
    @StateObject var vm = GoalListViewModel()
    
    let colorTheme: ColorThemeProtocol = YellowColorTheme()
    @State private var tapped: Bool = false
    @State private var showingSheet = false
    @State private var goalName: String = ""
    
    var body: some View {
        
        ZStack{
            Rectangle()
                .ignoresSafeArea()
                .foregroundColor(colorTheme.background)
            
            VStack(spacing: 40){
                VStack {
                    
                    TextField("Add goals here...", text: $goalName)
                        .font(.headline)
                        .padding(.leading)
                        .frame(height: 55)
                        .background(Color("backgroundColor"))
                        .cornerRadius(10)
                        .padding(.horizontal, 30)
                    
                    Button { 
                        guard !goalName.isEmpty else {return}
                        vm.addGoals(text: goalName)
                        goalName = ""
                        hideKeyboard()
                    } label: { 
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
                    }
                }
                
                List {
                    ForEach(vm.savedEntities) { goal in
                        GoalCellView(vm: GoalCellViewModel(goal: goal))
                            .listRowSeparator(.hidden)
                            .listRowBackground(Color.clear)
                            .frame(height: 80)
                            .onTapGesture {
                                vm.updateGoal(entity: goal)
                            }
                    }
                    .onDelete(perform: vm.deleteGoals)
                    .padding(.horizontal, 30)
                }.listStyle(PlainListStyle())
                Spacer()
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
