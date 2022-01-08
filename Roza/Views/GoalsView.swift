//
//  ActivityDetailView.swift
//  Roza
//
//  Created by Luka Vujnovac on 08.01.2022..
//

import SwiftUI

struct GoalsView: View {
    
    @State private var rating: Int = 0
    let colorTheme: ColorThemeProtocol = YellowColorTheme()
    @State private var goalCompleted: Bool = false
    
    var body: some View {
            ZStack{
                Rectangle()
                    .ignoresSafeArea()
                    .foregroundColor(colorTheme.background)
                
                VStack(spacing: 40) {
                    VStack(spacing: 10) {
                        Text(goalCompleted ? "Congratulations!!!" : "Your Goal Completition:")
                            .font(.title)
                            .fontWeight(.semibold)
                            .foregroundColor(goalCompleted ? colorTheme.primary : .black)
                        ZStack{
                            starsView
                                .overlay(overlayView.mask(starsView))
                        }
                    }
                    
                    NavigationLink { 
                        Text("navigate")
                    } label: { 
                        allGoalsButton
                    }
                }
        }
    }
    private var starsView: some View {
        HStack{
            ForEach(1..<6) { index in
                Image(systemName: "star.fill")
                    .foregroundColor(colorTheme.tertiary)
                    .font(.largeTitle)
                    .onTapGesture {
                        withAnimation(.easeInOut) {
                            rating = index   
                            if rating == 5 {
                                goalCompleted = true
                            }else {
                                goalCompleted = false
                            }
                        }
                    }
            }
        }
    }
    
    private var overlayView: some View {
        GeometryReader{ geometry in 
            ZStack(alignment: .leading){
                Rectangle()
                    .foregroundColor(goalCompleted ? colorTheme.primary : colorTheme.secondary)
                    .frame(width: CGFloat(rating) / 5 * geometry.size.width)
            }
        }.allowsHitTesting(false)
    }
}

struct ActivityDetailView_Previews: PreviewProvider {
    static var previews: some View {
        GoalsView()
    }
}

extension GoalsView {
    private var allGoalsButton: some View {
        RoundedRectangle(cornerRadius: 20)
            .frame(maxWidth: .infinity, maxHeight: 80)
            .padding(.horizontal, 100)
            .foregroundColor(colorTheme.secondary)
            .shadow(color: colorTheme.secondary.opacity(0.7), radius: 10, x: 2, y: 20)
            .overlay(
                Text("All Goals")
                    .font(.system(size: 17, weight: .light, design: .rounded))
                
            )
    }
}
