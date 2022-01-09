//
//  SecretViewModel.swift
//  Roza
//
//  Created by Luka Vujnovac on 09.01.2022..
//

import Foundation
import SwiftUI

class SecretViewModel: ObservableObject {
    var password: String = "1234"
    @Published var passwordCorrect: Bool = false
    @Published var isComplete: Bool = false
    @Published var isSuccess: Bool = false
    @Published var showingAlert: Bool = false
    @Published var passwordText: String = ""
}
