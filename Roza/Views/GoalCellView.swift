//
//  GoalCellView.swift
//  Roza
//
//  Created by Luka Vujnovac on 08.01.2022..
//

import SwiftUI

struct GoalCellView: View {
    
    let colorTheme: ColorThemeProtocol = YellowColorTheme()
    @ObservedObject var goalCellViewModel: GoalCellViewModel
    
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .frame(maxWidth: .infinity, maxHeight: 80)
            .listRowBackground(Color.clear)
            .listRowSeparator(.hidden)
            .foregroundColor(Color("babyBlue"))
            .shadow(color:colorTheme.primary.opacity(0.5) , radius: 5, x: 0, y: 6)
            .overlay(
                HStack{
                    Image(systemName: goalCellViewModel.goal.completed ? "square.fill" : "square")
                        .foregroundColor(
                            goalCellViewModel.goal.completed ? Color("yellow") : Color("primaryColor"))
                    Text(goalCellViewModel.goal.name)
                    Spacer()
                }
                    .foregroundColor(Color("primaryColor"))
                    .padding()
            )
            .onTapGesture {
                self.goalCellViewModel.goal.completed.toggle()
            }
    }
}


struct GoalCellView_Previews: PreviewProvider {
    static var previews: some View {
        GoalCellView(goalCellViewModel: GoalCellViewModel(goal: Goal(name: "neki cilj", completed: false)))
    }
}
