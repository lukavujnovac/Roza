//
//  SecretView.swift
//  Roza
//
//  Created by Luka Vujnovac on 09.01.2022..
//

import SwiftUI

struct SecretView: View {
    @StateObject var vm = SecretViewModel()
    let colorTheme: ColorThemeProtocol = BlueColorTheme()
    
    var body: some View {
        ZStack{
            Rectangle()
                .ignoresSafeArea()
                .foregroundColor(colorTheme.background)
            
            VStack(spacing: 60){
                VStack(spacing: 10) {
                    statusBar                    
                    HStack {
                        holdButton
                        resetButton
                    }
                }
                
                if vm.isSuccess {
                    VStack {
                        passwordField
                        
                       submitButton
                    }
                }
                
                if vm.passwordCorrect {
                    RoundedRectangle(cornerRadius: 10)
                }
                
            }.alert(isPresented: $vm.showingAlert) {
                Alert(
                    title: Text("You need to enter password"),
                    message: Text(""),
                    dismissButton: .default(Text("OK")))
            }
        }
    }
}

struct SecretView_Previews: PreviewProvider {
    static var previews: some View {
        SecretView()
    }
}

extension SecretView {
    private var holdButton: some View {
        Text("CLICK AND HOLD HERE")
            .foregroundColor(colorTheme.tertiary)
            .padding()
            .background(colorTheme.primary)
            .cornerRadius(10)
            .shadow(color: colorTheme.tertiary, radius: 5, x: 0, y: 6)
            .onLongPressGesture(minimumDuration: 1.0, maximumDistance: 50) { (isPressing) in
                // start of press -> min duration
                if isPressing {
                    withAnimation(.easeInOut(duration: 1.0)) {
                        vm.isComplete = true
                    }
                }else {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) { 
                        if !vm.isSuccess {
                            withAnimation(.easeInOut) {
                                vm.isComplete = false
                            }
                        }
                    }
                }
            } perform: { 
                withAnimation(.default) {
                    vm.isSuccess = true
                    vm.showingAlert = true
                }
            }
    }
    
    private var resetButton: some View {
        Text("RESET")
            .foregroundColor(.white)
            .padding()
            .background(Color.black)
            .cornerRadius(10)
        
            .onTapGesture {
                withAnimation(.default) {
                    vm.isSuccess = false
                    vm.isComplete = false
                }
            }
    }
    
    private var statusBar: some View {
        Rectangle()
            .fill(vm.isSuccess ? colorTheme.secondary : colorTheme.tertiary)
            .frame(maxWidth: vm.isComplete ? .infinity : 0)
            .frame(height: 55)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color.gray)
            .cornerRadius(10)
            .padding(.horizontal, 20)
    }
    
    private var passwordField: some View {
        SecureField("Password", text: $vm.passwordText) 
            .font(.headline)
            .padding(.leading)
            .frame(height: 55)    
            .background(colorTheme.secondary)
            .cornerRadius(10)
            .padding(.horizontal, 30)
    }
    
    private var submitButton: some View {
        Button {
            hideKeyboard()
            if vm.password == vm.passwordText {
                withAnimation(.default) {
                    vm.passwordCorrect = true   
                }
            }
        } label: { 
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 200, height: 60)
                .foregroundColor(colorTheme.primary)
                .shadow(color: colorTheme.secondary, radius: 5, x: 0, y: 6)
                .overlay(
                    HStack{
                        Text("submit")
                            .fontWeight(.bold)
                            .foregroundColor(colorTheme.secondary)
                    }
                )
        }
    }
}

