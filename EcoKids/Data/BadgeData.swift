//
//  BadgeData.swift
//  EcoKids
//
//  Created by Zohra ACHOUR on 24/09/2025.
//

import SwiftUI

var badge = Badge (
    level: "",
    // AJOUT imageGrey + imageColor
    imageGrey: "",
    imageColor: "",
    stickers: [],
    isCompleted: false,
    // AJOUT
    stickersCount: 0,
    backgroundColor: .grisClair,
    backgroundColorBorder: .boutonBleu
)

var badgeUn = Badge(
    level: "Petit protecteur",
    imageGrey : "cadenas",
    imageColor: "aventure-1",
    stickers: [
        Sticker(grey: "1-gris", color: "1"),
        Sticker(grey: "2-gris", color: "2"),
        Sticker(grey: "3-gris", color: "3"),
        Sticker(grey: "4-gris", color: "4"),
        Sticker(grey: "5-gris", color: "5"),
        Sticker(grey: "6-gris", color: "6"),
        Sticker(grey: "7-gris", color: "7"),
        Sticker(grey: "8-gris", color: "8"),
        Sticker(grey: "9-gris", color: "9"),
        Sticker(grey: "10-gris", color: "10"),
        Sticker(grey: "11-gris", color: "11"),
        Sticker(grey: "12-gris", color: "12"),
        Sticker(grey: "13-gris", color: "13"),
        Sticker(grey: "14-gris", color: "14"),
        Sticker(grey: "15-gris", color: "15")
    ],
    isCompleted: false,
    stickersCount : 15,
    backgroundColor: .vertClair,
    backgroundColorBorder: .tabBarVert
)

var badgeDeux = Badge(
    level: "Héro de l’eau",
    imageGrey: "cadenas",
    imageColor: "aventure-2",
    stickers: [
        Sticker(grey: "16-gris", color: "16"),
        Sticker(grey: "17-gris", color: "17"),
        Sticker(grey: "18-gris", color: "18"),
        Sticker(grey: "19-gris", color: "19"),
        Sticker(grey: "20-gris", color: "20"),
        Sticker(grey: "21-gris", color: "21"),
        Sticker(grey: "22-gris", color: "22"),
        Sticker(grey: "23-gris", color: "23"),
        Sticker(grey: "24-gris", color: "24"),
        Sticker(grey: "25-gris", color: "25"),
        Sticker(grey: "1-gris", color: "1"),
        Sticker(grey: "2-gris", color: "2"),
        Sticker(grey: "3-gris", color: "3"),
        Sticker(grey: "4-gris", color: "4"),
        Sticker(grey: "5-gris", color: "5")
    ],
    isCompleted: false,
    stickersCount : 7,
    backgroundColor: .fondBleu,
    backgroundColorBorder: .boutonBleu
)

var badgeTrois = Badge(
   
    level: "Ami des animaux",
    imageGrey: "cadenas",
    imageColor: "aventure-3",
    stickers: [
        Sticker(grey: "6-gris", color: "6"),
        Sticker(grey: "7-gris", color: "7"),
        Sticker(grey: "8-gris", color: "8"),
        Sticker(grey: "9-gris", color: "9"),
        Sticker(grey: "10-gris", color: "10"),
        Sticker(grey: "11-gris", color: "11"),
        Sticker(grey: "12-gris", color: "12"),
        Sticker(grey: "13-gris", color: "13"),
        Sticker(grey: "14-gris", color: "14"),
        Sticker(grey: "15-gris", color: "15"),
        Sticker(grey: "16-gris", color: "16"),
        Sticker(grey: "17-gris", color: "17"),
        Sticker(grey: "18-gris", color: "18"),
        Sticker(grey: "19-gris", color: "19"),
        Sticker(grey: "20-gris", color: "20")
    ],
    isCompleted: false,
    stickersCount: 0,
    backgroundColor: .orangeClair,
    backgroundColorBorder: .orangeFoncer
)

var badgeQuatre = Badge(

    level: "Champion vert",
    imageGrey: "cadenas",
    imageColor: "aventure-4",
    stickers: [
        Sticker(grey: "6-gris", color: "6"),
        Sticker(grey: "7-gris", color: "7"),
        Sticker(grey: "8-gris", color: "8"),
        Sticker(grey: "9-gris", color: "9"),
        Sticker(grey: "10-gris", color: "10"),
        Sticker(grey: "11-gris", color: "11"),
        Sticker(grey: "12-gris", color: "12"),
        Sticker(grey: "13-gris", color: "13"),
        Sticker(grey: "14-gris", color: "14"),
        Sticker(grey: "15-gris", color: "15"),
        Sticker(grey: "16-gris", color: "16"),
        Sticker(grey: "17-gris", color: "17"),
        Sticker(grey: "18-gris", color: "18"),
        Sticker(grey: "19-gris", color: "19"),
        Sticker(grey: "20-gris", color: "20")
    ],
    isCompleted: false,
    stickersCount: 0,
    backgroundColor: .rougeClair,
    backgroundColorBorder: .rouge
)

var badgeCinq = Badge(

    level: "Héro du tri",
    imageGrey: "cadenas",
    imageColor: "aventure-5",
    stickers: [
        Sticker(grey: "6-gris", color: "6"),
        Sticker(grey: "7-gris", color: "7"),
        Sticker(grey: "8-gris", color: "8"),
        Sticker(grey: "9-gris", color: "9"),
        Sticker(grey: "10-gris", color: "10"),
        Sticker(grey: "11-gris", color: "11"),
        Sticker(grey: "12-gris", color: "12"),
        Sticker(grey: "13-gris", color: "13"),
        Sticker(grey: "14-gris", color: "14"),
        Sticker(grey: "15-gris", color: "15"),
        Sticker(grey: "16-gris", color: "16"),
        Sticker(grey: "17-gris", color: "17"),
        Sticker(grey: "18-gris", color: "18"),
        Sticker(grey: "19-gris", color: "19"),
        Sticker(grey: "20-gris", color: "20")
    ],
    isCompleted: false,
    stickersCount : 0,
    backgroundColor: .vertClair,
    backgroundColorBorder: .tabBarVert
)

var badgeSix = Badge(
 
    level: "Gardien planétaire",
    imageGrey: "cadenas",
    imageColor: "aventure-6",
    stickers: [
        Sticker(grey: "6-gris", color: "6"),
        Sticker(grey: "7-gris", color: "7"),
        Sticker(grey: "8-gris", color: "8"),
        Sticker(grey: "9-gris", color: "9"),
        Sticker(grey: "10-gris", color: "10"),
        Sticker(grey: "11-gris", color: "11"),
        Sticker(grey: "12-gris", color: "12"),
        Sticker(grey: "13-gris", color: "13"),
        Sticker(grey: "14-gris", color: "14"),
        Sticker(grey: "15-gris", color: "15"),
        Sticker(grey: "16-gris", color: "16"),
        Sticker(grey: "17-gris", color: "17"),
        Sticker(grey: "18-gris", color: "18"),
        Sticker(grey: "19-gris", color: "19"),
        Sticker(grey: "20-gris", color: "20")
    ],
    isCompleted: false,
    stickersCount : 0,
    backgroundColor: .fondBleu,
    backgroundColorBorder: .boutonBleu

)
