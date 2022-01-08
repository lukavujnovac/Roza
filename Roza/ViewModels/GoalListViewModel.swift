//
//  GoalListViewModel.swift
//  Roza
//
//  Created by Luka Vujnovac on 08.01.2022..
//

import Foundation
import CoreData
import SwiftUI

class GoalListViewModel: ObservableObject {
    @Published var dataService = MockData()
    
    let container: NSPersistentContainer
    @Published var savedEntities: [GoalEntity] = []
    
    init() {
        container = NSPersistentContainer(name: "GoalContainer")
        container.loadPersistentStores { description, error in
            if let error = error {
                print("ERROR LOADING CORE DATA \(error)")
            }
        }
        fetchGoals()
    }
    
    func fetchGoals() {
        let request = NSFetchRequest<GoalEntity>(entityName: "GoalEntity")
        
        do {
            savedEntities = try container.viewContext.fetch(request)   
        }catch let error {
            print("ERROR FETCHING REQUEST \(error)")
        }
    }
    
    func addGoals(text: String) {
        let newGoal = GoalEntity(context: container.viewContext)
        
        newGoal.name = text
        newGoal.completed = false
        newGoal.id = UUID().uuidString
        
        withAnimation(.default) {
            saveData()   
        }
    }
    
    func deleteGoals(indexSet: IndexSet) {
        guard let index = indexSet.first else {return}
        let entity = savedEntities[index]
        
        container.viewContext.delete(entity)
        saveData()
    }
    
    func updateGoal(entity: GoalEntity) {
        entity.completed.toggle()
        saveData()
    }
    
    func saveData() {
        do {
            try container.viewContext.save()
            fetchGoals()
        }catch let error {
            print("ERROR SAVING: \(error)")
        }
    }
}

#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif
