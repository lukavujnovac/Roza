//
//  GoalCellViewModel.swift
//  Roza
//
//  Created by Luka Vujnovac on 08.01.2022..
//

import Foundation
import Combine

class GoalCellViewModel: ObservableObject, Identifiable {
    @Published var goal: Goal
    var id = ""
    
    @Published var completitionStateIconName: String = ""
    private var cancellabels = Set<AnyCancellable>()
    
    init(goal: Goal) {
        self.goal = goal
        
        $goal.map { goal in
            goal.completed ? "checckmark.square.fill" : "square"
        }
        .assign(to: \.completitionStateIconName, on: self)
        .store(in: &cancellabels)
        
        $goal
            .compactMap { goal in
                goal.id
            }
            .assign(to: \.id, on: self)
            .store(in: &cancellabels)
    }
}

