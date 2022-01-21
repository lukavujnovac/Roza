//
//  ActivityDetailView.swift
//  Roza
//
//  Created by Luka Vujnovac on 20.01.2022..
//

import SwiftUI

struct ActivityDetailView: View {
    
    @StateObject var vm = ActivityDetailViewModel()
    @Environment(\.dismiss) var dismiss
    
    let colorTheme = PinkColorTheme()
    @State private var time: Int32 = 0
    @State private var activityName: String = ""
    
    var body: some View {
        NavigationView{
            ZStack{
                Rectangle()
                    .ignoresSafeArea()
                    .foregroundColor(colorTheme.background)
                
                VStack(spacing: 100){
                    VStack(spacing: 20) {
                        Text("Enter activity details:")
                            .font(.system(size: 30, weight: .semibold, design: .rounded))
                            .foregroundColor(.black)
                    }
                    
                    VStack(alignment: .leading){
                        Text("How long did you do this activity?")
                        Stepper("\(time) h", value: $time, in: 0...10) 
                    }
                    
                    VStack(alignment: .leading){
                        Text("Name this activity:")
                        TextField("New Activity", text: $activityName)
                            .padding()
                            .background(colorTheme.tertiary)
                            .cornerRadius(10)
                        
                    }
                    
                    Button { 
                        vm.addActivity(time: time, name: activityName)
                        activityName = ""
                        time = 0
                        hideKeyboard()
                    } label: { 
                        Text("Submit")
                            .font(.system(size: 20, weight: .light, design: .rounded))
                            .padding()
                            .background(colorTheme.primary)
                            .foregroundColor(.black)
                            .cornerRadius(10)
                            .shadow(color: colorTheme.yellow, radius: 5, x: 0, y: 10)
                    }
                    
                    NavigationLink { 
                        SavedActivityList()
                    } label: { 
                        Text("Show past activies")
                            .font(.system(size: 20, weight: .semibold, design: .rounded))
                            .padding()
                            .foregroundColor(.blue)
                            .cornerRadius(10)
                    }
                }
                .padding(.horizontal, 30)
            }
        }
    }
}




struct ActivityDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityDetailView()
    }
}

struct SavedActivityCell: View {
    
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

struct SavedActivityList: View {
    
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
                        SavedActivityCell(activity: activity)
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
