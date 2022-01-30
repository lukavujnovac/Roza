//
//  ActivityListItemView.swift
//  Roza
//
//  Created by Luka Vujnovac on 07.01.2022..
//

import SwiftUI

struct ActivityListItemView: View {
    
    let colorTheme = PinkColorTheme()
    let foregroundColor: Color
    let imageName: String
    let imageColor: Color 
    let tappedImageColor: Color
    let tappedImageName: String
    let text: String
    let systemName: Bool
    @State var tapped: Bool = false
    
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .frame(maxWidth: .infinity, maxHeight: 80)
            .foregroundColor(tapped ? .pink : foregroundColor)
            .shadow(color: .yellow.opacity(0.5), radius: 5, x: 0, y: 6)
            .overlay(
                HStack{ 
                    if systemName {
                        Image(systemName: tapped ? tappedImageName : imageName)
                            .renderingMode(.template)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25, height: 25)
                            .foregroundColor(tapped ? tappedImageColor : imageColor)
                    }else {
                        Image(tapped ? tappedImageName : imageName)
                            .renderingMode(.template)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                            .foregroundColor(tapped ? tappedImageColor : imageColor)
                    }
                    
                    Text(text)
                        .foregroundColor(.black)
                        .font(.system(size: 16, weight: .light, design: .rounded))
                }
            )
//            .onTapGesture {
//                withAnimation(.easeInOut) {
//                    tapped = true
//                    
//                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) { 
//                        withAnimation(.easeInOut) {
//                            self.tapped = false
//                        }
//                    }
//                }
//            }
    }
}


struct ActivityListItemView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityListItemView(foregroundColor: .black, imageName: "plus", imageColor: .white, tappedImageColor: .yellow, tappedImageName: "plus.circle.fill", text: "plus", systemName: true)
    }
}
