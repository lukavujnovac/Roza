//
//  SavedActivityList.swift
//  Roza
//
//  Created by Luka Vujnovac on 21.01.2022..
//

import SwiftUI

struct SavedActivityListView: View {
    
    let colorTheme = PinkColorTheme()
    @StateObject var vm = ActivityDetailViewModel()
    var body: some View {
        ZStack {
            Rectangle()
                .ignoresSafeArea()
                .foregroundColor(colorTheme.background)
            
            VStack(alignment: .leading) {
                Text("Your past activities:")
                    .padding(.leading, 30)
                List{
                    ForEach(vm.savedActivities) { activity in 
                        SavedActivityCellView(activity: activity)
                            .frame(maxWidth: .infinity)
                            .frame(height: 100)
                    }
                    .onDelete { index in
                        vm.deleteActivity(indexSet: index)
                    }
                }
                .listStyle(.plain) 
            }
        }
    }
}

struct SavedActivityList_Previews: PreviewProvider {
    static var previews: some View {
        SavedActivityListView()
    }
}
