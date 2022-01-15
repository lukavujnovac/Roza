//
//  ActivityDetailViewModel.swift
//  Roza
//
//  Created by Luka Vujnovac on 15.01.2022..
//

import Foundation
import SwiftUI
import CoreData

class ActivityDetailViewModel: ObservableObject {
    
    let container: NSPersistentContainer
    @Published var savedActivities: [ActivityEntity] = []
    
    init() {
        container = NSPersistentContainer(name: "ActivityContainer")
        container.loadPersistentStores { description, error in
            if let error = error {
                print("ERROR LOADING CORE DATA: \(error)")
            }
        }
        fetchActivities()
    }
    
    func fetchActivities() {
        let request = NSFetchRequest<ActivityEntity>(entityName: "ActivityEntity")
        
        do {
            savedActivities = try container.viewContext.fetch(request)
        }catch let error {
            print("error fetching \(error)")
        }
    }
    
    func addActivity(time: Double) {
        let newActivity = ActivityEntity(context: container.viewContext)
        newActivity.name = "nova aktivnost"
        newActivity.time = time
        
        withAnimation(.default) {
            saveData()   
        }
    }
    
    func deleteActivity(indexSet: IndexSet) {
        guard let index = indexSet.first else {return}
        let entity = savedActivities[index]
        
        container.viewContext.delete(entity)
        saveData()
    }
    
    func saveData() {
        do {
            try container.viewContext.save()   
            fetchActivities()
        } catch let error {
            print("ERROR SAVING DATA \(error)")
        }
    }
}
