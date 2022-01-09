//
//  MockData.swift
//  Roza
//
//  Created by Luka Vujnovac on 07.01.2022..
//

import Foundation

protocol DataServiceProtocol {
    var fitnessActivities1: [ActivityModel] { get }
    var fitnessActivities2: [ActivityModel] { get }
    
    var learnActivities1: [ActivityModel] { get }
    var learnActivities2: [ActivityModel] { get }
}

class MockData: DataServiceProtocol {
    var fitnessActivities1: [ActivityModel] = [
        ActivityModel(imageName: "run", name: "Run", tappedImageName: "run.fill"),
        ActivityModel(imageName: "walk", name: "Walk", tappedImageName: "walk.fill")
    ]
    
    var fitnessActivities2: [ActivityModel] = [
        ActivityModel(imageName: "gym", name: "Gym", tappedImageName: "gym.fill"),
        ActivityModel(imageName: "volleyball", name: "Volleyball", tappedImageName: "volleyball.fill")
    ]
    
    var learnActivities1: [ActivityModel] = [
        ActivityModel(imageName: "books.vertical", name: "School", tappedImageName: "books.vertical.fill"),
        ActivityModel(imageName: "character.book.closed", name: "Matura", tappedImageName: "character.book.closed.fill")
    ]
    
    var learnActivities2: [ActivityModel] = [
        ActivityModel(imageName: "bolt", name: "Skill", tappedImageName: "bolt.fill"),
        ActivityModel(imageName: "book", name: "Read", tappedImageName: "book.fill")
    ]
}
