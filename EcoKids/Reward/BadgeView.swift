//
//  BadgeView.swift
//  EcoKids
//
//  Created by Fatoumatou Dramé on 17/09/2025.
//







import SwiftUI

struct BadgeView: View {
    @Environment(User.self) private var user

    
    let allBadges: [Badge] = [badgeUn, badgeDeux, badgeTrois, badgeQuatre, badgeCinq, badgeSix]
    
    var body: some View {
        
        
            ZStack {
                Color.fondBeige
                    .ignoresSafeArea()
                
                VStack {
                    // En-tête
                    HStack {
                        Image(user.image)
                            .resizable()
                            .frame(width: 100, height: 100)
                            .padding(.leading, 20)
                        
                        VStack(alignment: .leading) {
                            Text(user.pseudo)
                                .font(.custom("ComicNeue-Bold", size:30))
                                .padding(.bottom, 5)
                            
                            Text("Mes récompenses")
                                .font(.custom("ComicNeue-Bold", size:20))
                        }
                        .padding(.leading, 15)
                    }
                    
                    // Séparateur
                    Rectangle()
                        .fill(Color.white)
                        .frame(width:400, height: 3)
                        .padding(10)
                    
                    ScrollView {
                        // Mes gommettes
                        HStack {
                            Text("MES GOMMETTES")
                                .font(
                                    .custom("Baloo-Regular", size:35))
                                .foregroundColor(.tabBarVert)
                                .padding(.leading, 30)
                                .padding(.bottom, 10)
                            
                            Spacer()
                        }
                        
                        // Cards
                        VStack {
                            ForEach(user.badges, id: \.level) { badge in
                                TestView(badge: badge)
                            }.padding(.bottom, 10)
                        }
                    }
                    .padding(.bottom, 1)
                }
            }
    
    }
}


#Preview {
    BadgeView()
        .environment(faisem)
}
