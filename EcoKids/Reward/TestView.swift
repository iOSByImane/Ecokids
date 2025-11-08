//
//  TestView.swift
//  EcoKids
//
//  Created by Imâne Boujnane on 22/09/2025.
//

import SwiftUI

struct TestView: View {
    
var badge: Badge
    
let columns = Array(repeating: GridItem(.flexible()), count: 5)
    
    @Environment(User.self) private var user
    
var body: some View {
    
        
        ZStack {

// BACKGROUND
            
            RoundedRectangle(cornerRadius: 15)
                .fill(badge.stickersCount > 0 ? badge.backgroundColor : Color.grisClair)
                .frame(width: 370, height: 170)
                .shadow(radius: 7)
                .overlay(
                    RoundedRectangle(cornerRadius: 7)
                        .stroke(badge.stickersCount > 0 ? badge.backgroundColorBorder : Color.grisCards,
                                lineWidth: 2.5)
                )

// STICKERS
            
            LazyVGrid(columns: columns, spacing: 10) {
                ForEach(badge.stickers.indices, id: \.self) { index in
                    let sticker = badge.stickers[index]
                    Image(index < badge.stickersCount ? sticker.color : sticker.grey)
                }
            }.frame(width: 210)
                .padding(.top, 32)
                .padding(.trailing, 110)
            
// NIVEAU
            
                HStack {
                    Text(badge.level)
                        .font(.custom("ComicNeue-Bold", size: 20))
                        .foregroundColor(badge.stickersCount > 0 ? badge.backgroundColorBorder : .grisCards)
                        .padding(.leading, 40)
                        .padding(.bottom, 110)

                    Spacer()
                }
                    
// AVATAR
                    
                    HStack {
                        
                        Spacer()
                        
                        Image(badge.stickersCount > 0 ? badge.imageColor : badge.imageGrey)
                            .frame(width: 80, height: 80)
                            .padding(.trailing, 40)
                    }

        }
    }
}


#Preview {
    TestView(badge: Badge(
        level: "Petit protecteur",
        imageGrey: "aventure-1-gris",
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
        stickersCount: 7, // l’enfant a gagné 2 gommettes
        backgroundColor: .vertClair,
        backgroundColorBorder: .tabBarVert
    ))
    .environment(faisem)
}
