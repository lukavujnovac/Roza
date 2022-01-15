//
//  ActivityDetailView.swift
//  Roza
//
//  Created by Luka Vujnovac on 15.01.2022..
//

import SwiftUI
import CoreData

struct ActivityDetailView: View {
    
    @StateObject var vm = ActivityDetailViewModel()
    
    let colorTheme: ColorThemeProtocol = PinkColorTheme()
    @State private var stepperValue: Double = 0
    var body: some View {
        
        ZStack {
            Rectangle()
                .ignoresSafeArea()
                .foregroundColor(colorTheme.background)
            
            VStack(spacing: 100){
                VStack(spacing: 30) {
                    Text("how long did you do this activity?")
                        .font(.system(size: 22, weight: .semibold, design: .rounded))
                    
                    Stepper("Enter number in hours", onIncrement: {
                        stepperValue += 0.25
                        
                        
                        
                    }, onDecrement: {
                        stepperValue -= 0.25
                        
                        if stepperValue <= 0 {
                            stepperValue = 0
                        }
                    })
                    
                    Text("\(String(format: "%.2f", stepperValue)) h")
                    
                }
                
                VStack{
                    Button { 
                        vm.addActivity(time: stepperValue)
                        stepperValue = 0
                    } label: { 
                        Text("Submit")
                            .foregroundColor(.black)
                            .font(.system(size: 20, weight: .light, design: .rounded))
                            .padding()
                            .background(colorTheme.primary)
                            .cornerRadius(10)
                    }
                }
                
                List{
                    ForEach(vm.savedActivities) { entity in 
                        HStack {
                            Text(entity.name ?? "no name")
                            Text("\(entity.time) h ")
                        } 
                    }
                    .onDelete { index in
                        vm.deleteActivity(indexSet: index)
                    }
                }.listStyle(PlainListStyle())
            }
            .padding(.horizontal, 20)
        }
        
    }
}

struct ActivityDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityDetailView()
    }
}
