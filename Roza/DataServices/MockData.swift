//
//  MockData.swift
//  Roza
//
//  Created by Luka Vujnovac on 07.01.2022..
//

import Foundation

class MockData {
    var fitnessActivities1: [ActivityModel] = [
        ActivityModel(imageName: "run", name: "Run", tappedImageName: "run.fill"),
        ActivityModel(imageName: "walk", name: "Walk", tappedImageName: "walk.fill")
    ]
    
    var fitnessActivities2: [ActivityModel] = [
        ActivityModel(imageName: "gym", name: "Gym", tappedImageName: "gym.fill"),
        ActivityModel(imageName: "volleyball", name: "Volleyball", tappedImageName: "volleyball.fill")
    ]
    
    var learnActivites1: [ActivityModel] = [
        ActivityModel(imageName: "books.vertical", name: "School", tappedImageName: "books.vertical.fill"),
        ActivityModel(imageName: "character.book.closed", name: "Matura", tappedImageName: "character.book.closed.fill")
    ]
    
    var learnActivites2: [ActivityModel] = [
        ActivityModel(imageName: "bolt", name: "Skill", tappedImageName: "bolt.fill"),
        ActivityModel(imageName: "book", name: "Read", tappedImageName: "book.fill")
    ]
    
    var goals: [Goal] = [
        Goal(name: "prvi cilj"),
        Goal(name: "drugi cilj"),
        Goal(name: "treci cilj"),
        Goal(name: "treci cilj"),
        Goal(name: "treci cilj"),
        Goal(name: "treci cilj"),
        Goal(name: "treci cilj"),
        Goal(name: "treci cilj"),
        Goal(name: "treci cilj"),
        Goal(name: "treci cilj"),
        Goal(name: "treci cilj")
    ]
}
