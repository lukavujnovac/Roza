//
//  SavedActivityCell.swift
//  Roza
//
//  Created by Luka Vujnovac on 21.01.2022..
//

import SwiftUI

struct SavedActivityCellView: View {
    
    let colorTheme = PinkColorTheme()
    let activity: ActivityEntity
    
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .frame(maxWidth: .infinity, maxHeight: 80)
            .listRowBackground(Color.clear)
            .listRowSeparator(.hidden)
            .foregroundColor(Color("babyBlue"))
            .shadow(color:colorTheme.primary.opacity(0.5) , radius: 5, x: 0, y: 6)
            .overlay(
                HStack{
                    Text(activity.name ?? "nova aktivnost")
                    Spacer()
                    Text("\(activity.time) h")
                }
                    .foregroundColor(Color("primaryColor"))
                    .padding()
            )
        
    }
}

//
//struct SavedActivityCell_Previews: PreviewProvider {
//    static var previews: some View {
//        SavedActivityCellView()
//    }
//}
