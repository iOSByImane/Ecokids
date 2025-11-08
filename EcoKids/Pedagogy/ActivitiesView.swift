//  EcoKids
//
//  Created by Fatoumatou Dramé on 17/09/2025.
//
//
//  ActivitiesView.swift
//  EcoKids
//
//  Created by Fatoumatou Dramé on 17/09/2025.
//
// CENTRER -> BRAVO
import SwiftUI
// confettis
import ConfettiSwiftUI


struct ActivitiesView: View {
    
    
    let bravo: String = "Bravo !"
    
    let messagesFinished : [String] = [
        "🌱 Bravo ! Grâce à toi, la Terre respire mieux.",
        "🌍 Tu es un super héros de la planète !",
        "🌳 Merci de protéger la nature, elle t’en remercie !",
        "🌸 Félicitations ! Tu rends le monde beau et plus vert.",
        "🐦 Les animaux et les arbres sont fiers de toi !",
        "☀️ Grâce à tes gestes, la Terre sourit.",
        "🍃 Bravo petit protecteur de la nature !",
        "🌎 Tu es un champion des amis de la Terre.",
        "🦋 La planète est heureuse d’avoir un ami comme toi !"
    ]
    
    // Compteur pour déclencher les confettis
    @State private var trigger: Int = 0
    @Environment(User.self) private var user
    
    //permet de changer de tab quand on termine une activité
    @Binding var onGoingTab: Int

    var body: some View {
        
        // NavigationStack
        
            // BACKGROUND BEIGE
            ZStack {
                Color.fondBeige
                    .ignoresSafeArea()
                
                // SENS DU SCROLL
                // EVITE LA SUPERPOSITION (ZSTACK)
                VStack() {
                    
                    // SECTION 1 : EN TETE
                    // -> avatar
                    HStack {
                        
                        ZStack {
                            HStack {
                                Image(user.image)
                                    .resizable()
                                    .frame(width: 100, height: 100)
                            }
                            Spacer()
                            
                        }
                        // -> bravo
                        VStack {
                            HStack {
                                Text(bravo)
                                    .font(
                                        .custom("Baloo-Regular", size:35))
                            }
                            HStack {
                                // -> Message aléatoire
                                Text(messagesFinished.randomElement()!)
                                
                                    .font(
                                        .custom("ComicNeue-Bold", size:20)
                                    )
                                    .multilineTextAlignment(.center)
                                    .padding(.trailing)
                            }
                        }
                    }
                    
                    // 🎊 Ajout des confettis
                    //num: 250 = nombre de conféttis
                    //radius: 250 = zone dans laquelle les confettis peuvent apparaître
                    .confettiCannon(trigger: $trigger, num: 250, openingAngle: .degrees(110), closingAngle: .degrees(100), radius: 250)
                    
                    // SEPARATEUR
                    Rectangle()
                        .fill(Color.white)
                        .frame(height: 3)
                        
                    
                    
                    // SECTION 2 : RECAPITULATIF
                    
                    // -> background blanc
                    ZStack {
                        Rectangle()
                            .foregroundColor(.white)
                            .cornerRadius(20)
                        
                        // SENS DU SCROLL
                        // EVITE LA SUPERPOSITION (ZSTACK)
                        
                        VStack () {
                            
                            // -> image stickers
                            Image("zo")
                                .resizable()
                                .scaledToFit()
                            
                            // -> Message aléatoire
                            Text(activity.summary.randomElement()!)
                                .font(
                                    .custom("ComicNeue-Bold", size:20)
                                )
                                .multilineTextAlignment(.center)
                                .padding(.trailing, 20)
                                .padding(.leading, 20)
                            
                            // -> medail
                            Image(activity.medal)
                            
                            //Button qui ramène a la deuxième vue dans la TabView
                            Button {
                                onGoingTab = 1
                            } label: {
                                Spacer()
                                
                                Text("Voir ma collection !")
                                    .font(
                                        .custom("ComicNeue-Bold", size:25)
                                    )
                                    .foregroundColor(.white)
                                    .padding(10)
                                    .background(Color.blue)
                                    .cornerRadius(20)
                                
                                Spacer()
                            }

                            
//                            NavigationLink(destination: BadgeView()) {
//                                
//                                Spacer()
//                                
//                                Text("Voir ma collection !")
//                                    .font(
//                                        .custom("ComicNeue-Bold", size:25)
//                                    )
//                                    .foregroundColor(.white)
//                                    .padding(10)
//                                    .background(Color.blue)
//                                    .cornerRadius(20)
//                                
//                                Spacer()
//                            } /*.navigationTitle("BRAVO")*/
                            
                            // 🎊 Ajout des confettis
                            //num: 250 = nombre de conféttis
                            //radius: 250 = zone dans laquelle les confettis peuvent apparaître
                            .confettiCannon(trigger: $trigger, num: 250, openingAngle: .degrees(110), closingAngle: .degrees(100), radius: 250)
                        }
                        .padding(.vertical, 10)
                    }
                    .padding()
                }
            }
            
            .onAppear {
                // petit délai pour être sûr que la vue est visible
                //Attente de 0,3sec avant l'exécution du code
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                    
                    //trigger = bouton secret qui dit au canon : "lance les confettis"
                    
                    trigger += 1
                }
                user.progression += 1
                user.badges[1].stickersCount += 1
            }
            
        
    }
}

#Preview {
    ActivitiesView(onGoingTab: .constant(0))
        .environment(faisem)
}
