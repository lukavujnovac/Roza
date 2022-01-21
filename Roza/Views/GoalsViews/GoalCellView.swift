//
//  GoalCellView.swift
//  Roza
//
//  Created by Luka Vujnovac on 08.01.2022..
//

import SwiftUI
import CoreData

struct GoalCellView: View {
    
    let colorTheme: ColorThemeProtocol = YellowColorTheme()
    @ObservedObject var vm: GoalCellViewModel
    
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .frame(maxWidth: .infinity, maxHeight: 80)
            .listRowBackground(Color.clear)
            .listRowSeparator(.hidden)
            .foregroundColor(Color("babyBlue"))
            .shadow(color:colorTheme.primary.opacity(0.5) , radius: 5, x: 0, y: 6)
            .overlay(
                HStack{
                    Image(systemName: vm.goal.completed ? "square.fill" : "square")
                        .foregroundColor(
                            vm.goal.completed ? Color("yellow") : Color("primaryColor"))
                    Text(vm.goal.name ?? "goal")
                    Spacer()
                }
                    .foregroundColor(Color("primaryColor"))
                    .padding()
            )
    }
}


//struct GoalCellView_Previews: PreviewProvider {
//    static var previews: some View {
//        GoalCellView(goalCellViewModel: GoalCellViewModel(goal: GoalEntity(context: container.viewContext)))
//    }
//}
