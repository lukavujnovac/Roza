//
//  Goal.swift
//  Roza
//
//  Created by Luka Vujnovac on 08.01.2022..
//

import Foundation

struct Goal: Hashable {
    var id = UUID().uuidString
    var name: String 
    var completed: Bool = false
}
