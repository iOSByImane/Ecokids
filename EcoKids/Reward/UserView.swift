//
//  UserView.swift
//  EcoKids
//
//  Created by Fatoumatou Dramé on 17/09/2025.
//

import SwiftUI

var faisem = User(
    image : "avatar-5",
    pseudo: "Faisem",
    progression: 17.0,
    badges: [badgeUn, badgeDeux, badgeTrois, badgeQuatre, badgeCinq, badgeSix],
    greeting: ""
)

struct UserView: View {
    
    //    @State private var user = faisem
    
    @Environment(User.self) private var user
    
    let totalActivities: Int = 96
    
    //permet de changer de tab quand on termine une activité
    @Binding var onGoingTab: Int
    
    var body: some View {
        
        
        
        // BACKGROUND BLEU
        
            ZStack {
                Color.fondBleu
                    .ignoresSafeArea()
                // SENS DU SCROLL & EVITE LA SUPERPOSITION (ZSTACK)
                VStack() {
                    
                    // EN TETE
                    
                    // -> avatar
                    HStack {
                        Image(user.image)
                            .resizable()
                            .frame(width: 100, height: 100)
                            .padding(.leading, 20)
                        
                        // -> pseudo
                        VStack(alignment: .leading) {
                            Text(user.pseudo)
                                .font(
                                    .custom("ComicNeue-Bold", size:30))
                                .padding(.bottom, 5)
                            
                            // -> Mes récompenses
                            Text("Mes récompenses ")
                                .font(
                                    .custom("ComicNeue-Bold", size:20)
                                )
                        } .padding(.leading, 15)
                    }
                    
                    // SEPARATEUR
                    Rectangle()
                        .fill(Color.white)
                        .frame(width:400, height: 3)
                        .padding(10)
                    
                    ScrollView {
                        
                        
                        // PROGRESSION
                        
                        // -> progression
                        HStack {
                            Text("PROGRESSION")
                                .font(
                                    .custom("Baloo-Regular", size:35))
                                .padding(.bottom, 10)
                                .foregroundColor(.tabBarVert)
                                .padding(.leading, 30)
                            Spacer()
                        }
                        
                        // -> description
                        HStack {
                            Text("Chaque activité réussie te fait avancer.")
                                .font(
                                    .custom("ComicNeue-Bold", size:18))
                                .foregroundColor(.tabBarVert)
                            Spacer()
                        } .padding(.leading, 30)
                        
                        // IMAGE PROGRESSION
                        
                        // -> image progression
                        Image("Progression")
                            .resizable()
                            .frame(width: 400, height: 50)
                            .padding(.top)
                        
                        // BARRE DE PROGRESSION : Simulation 25 activités réalisées
                        
                        ZStack(alignment: .leading) {
                            // -> Barre de fond
                            Rectangle()
                                .foregroundColor(.white)
                                .frame(width: 300, height: 10)
                                .cornerRadius(10)
                                .shadow(radius: 5)
                            
                            // -> Barre remplie
                            Rectangle()
                                .foregroundColor(.vertClair)
                                .frame(width: min(user.progression / Double(totalActivities), 1.0) * 300, height: 10)
                                .cornerRadius(10)
                            
                            // -> Cercle au bout
                            Circle()
                                .fill(.boutonBleu)
                                .frame(width: 25, height: 25)
                                .offset(x: min(user.progression / Double(totalActivities), 1.0) * 300 - 12.5)
                        }
                        
                        // AVENTURE
                        
                        // -> progression
                        HStack {
                            Text("AVENTURE")
                                .font(
                                    .custom("Baloo-Regular", size:35))
                                .padding(.bottom, 10)
                                .foregroundColor(.tabBarVert)
                            
                            Spacer()
                        } .padding(.leading, 30)
                            .padding(.top, 15)
                        
                        // -> description
                        HStack {
                            Text("16 gommettes = 1 badge gagné !")
                                .font(
                                    .custom("ComicNeue-Bold", size:18))
                                .foregroundColor(.tabBarVert)
                            Spacer()
                        } .padding(.leading, 30)
                        
                        // CARTE 1 ET 2
                        
                        
                        

                        
                        HStack(spacing: 20) {
                            Button {
                                onGoingTab = 1
                            } label: {
                                ZStack {
                                    Rectangle()
                                        .frame(width: 170, height: 170)
                                        .foregroundColor(.tabBarVert)
                                        .cornerRadius(15)
                                        .shadow(radius: 5)
                                    
                                    VStack {
                                        Text("Petit protecteur")
                                            .font(.custom("ComicNeue-Bold", size: 20))
                                            .foregroundColor(.fondBleu)
                                            .padding(.top, 10)
                                        
                                        Image("aventure-1")
                                            .padding(.bottom, 10)
                                    }
                                }
                            }
                            .buttonStyle(PlainButtonStyle())
                            
//                            NavigationLink(destination: BadgeView()) {
//                                ZStack {
//                                    Rectangle()
//                                        .frame(width: 170, height: 170)
//                                        .foregroundColor(.tabBarVert)
//                                        .cornerRadius(15)
//                                        .shadow(radius: 5)
//                                    
//                                    VStack {
//                                        Text("Petit protecteur")
//                                            .font(.custom("ComicNeue-Bold", size: 20))
//                                            .foregroundColor(.fondBleu)
//                                            .padding(.top, 10)
//                                        
//                                        Image("aventure-1")
//                                            .padding(.bottom, 10)
//                                    }
//                                }
//                            }
//                            .buttonStyle(PlainButtonStyle())
                            
                            
                            
                            Button {
                                onGoingTab = 1
                            } label: {
                                ZStack {
                                    Rectangle()
                                        .frame(width: 170, height: 170)
                                        .foregroundColor(.boutonBleu)
                                        .cornerRadius(15)
                                        .shadow(radius: 5)
                                    
                                    VStack {
                                        Text("Héro de l’eau")
                                            .font(.custom("ComicNeue-Bold", size: 20))
                                            .foregroundColor(.fondBleu)
                                            .padding(.top, 10)
                                        
                                        Image("aventure-2")
                                            .padding(.bottom, 10)
                                    }
                                }
                            }
                            .buttonStyle(PlainButtonStyle())
                            
//                            NavigationLink(destination: BadgeView()) {
//                                ZStack {
//                                    Rectangle()
//                                        .frame(width: 170, height: 170)
//                                        .foregroundColor(.boutonBleu)
//                                        .cornerRadius(15)
//                                        .shadow(radius: 5)
//                                    
//                                    VStack {
//                                        Text("Héro de l’eau")
//                                            .font(.custom("ComicNeue-Bold", size: 20))
//                                            .foregroundColor(.fondBleu)
//                                            .padding(.top, 10)
//                                        
//                                        Image("aventure-2")
//                                            .padding(.bottom, 10)
//                                    }
//                                }
//                            }
                        }
                        .padding()
                        
                        // CARTE 3 ET 4
                        HStack(spacing: 20) {
                            NavigationLink(destination: BadgeView()) {
                                ZStack {
                                    Rectangle()
                                        .frame(width: 170, height: 170)
                                        .foregroundColor(.grisClair)
                                        .cornerRadius(15)
                                        .shadow(radius: 5)
                                    
                                    VStack {
                                        Text("Ami des animaux")
                                            .font(.custom("ComicNeue-Bold", size: 20))
                                            .foregroundColor(.grisCards)
                                            .padding(.top, 10)
                                        Image("cadenas")
                                            .padding(.bottom, 10)
                                    }
                                }
                            }
                            
                            NavigationLink(destination: BadgeView()) {
                                ZStack {
                                    Rectangle()
                                        .frame(width: 170, height: 170)
                                        .foregroundColor(.grisClair)
                                        .cornerRadius(15)
                                        .shadow(radius: 5)
                                    
                                    VStack {
                                        Text("Champion vert")
                                            .font(.custom("ComicNeue-Bold", size: 20))
                                            .foregroundColor(.grisCards)
                                            .padding(.top, 10)
                                        
                                        Image("cadenas")
                                            .padding(.bottom, 10)
                                    }
                                }
                            }
                        }
                        .padding()
                        
                        // CARTE 5 ET 6
                        HStack(spacing: 20) {
                            NavigationLink(destination: BadgeView()) {
                                ZStack {
                                    Rectangle()
                                        .frame(width: 170, height: 170)
                                        .foregroundColor(.grisClair)
                                        .cornerRadius(15)
                                        .shadow(radius: 5)
                                    
                                    VStack {
                                        Text("Héro du trie")
                                            .font(.custom("ComicNeue-Bold", size: 20))
                                            .foregroundColor(.grisCards)
                                            .padding(.top, 10)
                                        
                                        Image("cadenas")
                                            .padding(.bottom, 10)
                                    }
                                }
                            }
                            
                            Button {
                                
                            } label: {
                                ZStack {
                                    Rectangle()
                                        .frame(width: 170, height: 170)
                                        .foregroundColor(.grisClair)
                                        .cornerRadius(15)
                                        .shadow(radius: 5)
                                    
                                    VStack {
                                        Text("Gardien planétaire")
                                            .font(.custom("ComicNeue-Bold", size: 20))
                                            .foregroundColor(.grisCards)
                                            .padding(.top, 10)
                                        
                                        Image("cadenas")
                                            .padding(.bottom, 10)
                                    }
                                }
                            }

                            
//                            NavigationLink(destination: BadgeView()) {
//                                ZStack {
//                                    Rectangle()
//                                        .frame(width: 170, height: 170)
//                                        .foregroundColor(.grisClair)
//                                        .cornerRadius(15)
//                                        .shadow(radius: 5)
//                                    
//                                    VStack {
//                                        Text("Gardien planétaire")
//                                            .font(.custom("ComicNeue-Bold", size: 20))
//                                            .foregroundColor(.grisCards)
//                                            .padding(.top, 10)
//                                        
//                                        Image("cadenas")
//                                            .padding(.bottom, 10)
//                                    }
//                                }
//                            }
                        }
                        .padding()
                    }
                    .padding(.bottom, 1)
                }
                .onAppear {
                    print(user.progression)
                }
            }
      
    }
}

#Preview {
    UserView(onGoingTab: .constant(0))
        .environment(faisem)
}
