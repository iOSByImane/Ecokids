//
//  Model.swift
//  EcoKids
//
//  Created by Fatoumatou Dramé on 17/09/2025.
//

import SwiftUI

@Observable
class User: Identifiable{
    var id = UUID()
    var image: String
    var pseudo: String
    var progression: Double
    var badges: [Badge]
    var greeting: String
    
    init(id: UUID = UUID(), image: String, pseudo: String, progression: Double, badges: [Badge], greeting: String) {
        self.id = id
        self.image = image
        self.pseudo = pseudo
        self.progression = progression
        self.badges = badges
        self.greeting = greeting
    }
    
    
    
}

struct Theme: Identifiable {
    var id = UUID()
    var imagesThemes: String
    var namesThemes: String
    var popUps: [PopUp]
}

struct PopUp {
    var titlePopUp : String
    var smallTitlePopUp: String
    var imagesPopUp: String
    var descriptionPopUp: String
    var descriptionLink: String
}

struct Method: Identifiable {
    var id = UUID()
    var imagesMethod: String
    var namesMethod: String
    var activities: [ActivityChoice]
}

struct Badge: Identifiable {
    var id = UUID()
    var level: String
    //    var image: String
    // AJOUT imageGrey + imageColor
    var imageGrey: String
    var imageColor: String
    var stickers: [Sticker]
    var isCompleted: Bool
    // AJOUT
    var stickersCount: Int
    var backgroundColor: Color
    var backgroundColorBorder: Color
}

struct Activity: Identifiable {
    var id = UUID()
    var imageTitleActivity: String
    var nameTitleActivity: String
    var imageActivity: String
    var durationActivity: String
    var objectiveActivity: String
    var stepActivity: [String]
    var counterActivity: Double
    var variante: String
    var isFinished: Bool
    var stickers: String
    var summary: [String]
    var medal: String
}

struct ActivityChoice: Identifiable {
    var id = UUID()
//    var methodId: UUID  // lien avec la méthode
    var image: String
    var name: String
}

// AJOUT
struct Sticker: Identifiable, Hashable {
    let id = UUID()
    let grey: String
    let color: String
}
