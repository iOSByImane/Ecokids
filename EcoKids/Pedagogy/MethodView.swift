//
//  MethodView.swift
//  EcoKids
//
//  Created by Fatoumatou Dramé on 17/09/2025.
//

import SwiftUI

struct MethodView: View {
    
    // Stocke l'ID de la méthode sélectionnée pour appliquer la bordure uniquement à cette carte
    @State private var selectedMethodId: UUID? = nil
    @Environment(User.self) private var user
    
    //cache la popup
    @Binding var hidePopUp: Bool
    
    //permet de changer de tab quand on termine une activité
    @Binding var onGoingTab: Int
    
    // Liste des méthodes disponibles
    @State private var methods: [Method] = [
        Method(imagesMethod: "jeux ludiques", namesMethod: "Jeux ludiques", activities: [
            ActivityChoice(image: "La chasse au tri dans la maison", name: "La chasse au tri dans la maison"),
            ActivityChoice(image: "Le jeu du tri en mouvement", name: "Le jeu du tri en mouvement"),
            ActivityChoice(image: "La pêche aux déchets", name: "La pêche aux déchets"),
            ActivityChoice(image: "Mon déchet va où ?", name: "Mon déchet va où ?")
        ]),
        
        Method(imagesMethod: "Activités_créatives", namesMethod: "Activités créatives", activities: [
            ActivityChoice(image: "act5", name: "Activité 5"),
            ActivityChoice(image: "act6", name: "Activité 6"),
            ActivityChoice(image: "act7", name: "Activité 7"),
            ActivityChoice(image: "act8", name: "Activité 8")
        ]),
        
        Method(imagesMethod: "Expériences concrètes", namesMethod: "Expériences concrètes", activities: [
            ActivityChoice(image: "act9", name: "Activité 9"),
            ActivityChoice(image: "act10", name: "Activité 10"),
            ActivityChoice(image: "act11", name: "Activité 11"),
            ActivityChoice(image: "act12", name: "Activité 12")
        ]),
        
        Method(imagesMethod: "histoires & mises en scene", namesMethod: "Histoires & mises en scène", activities: [
            ActivityChoice(image: "act13", name: "Activité 13"),
            ActivityChoice(image: "act14", name: "Activité 14"),
            ActivityChoice(image: "act15", name: "Activité 15"),
            ActivityChoice(image: "act16", name: "Activité 16")
        ])
    ]
    
    // Définition des colonnes pour la grid
    let columns = [
        GridItem(.fixed(150), spacing: 20),
        GridItem(.fixed(150))
    ]
    
    var body: some View {
            ZStack {
                // Fond de la vue
                Image("FondTheme")
                    .resizable()
                    .ignoresSafeArea()
                    
                    VStack {
                        HStack{
                            Image(user.image)
                                .resizable()
                                .frame(width: 100, height: 100)
                                .padding(.leading, 20)
                            VStack{
                                // Titre principal
                                Text("MÉTHODES")
                                    .font(.custom("Baloo-Regular", size: 40))
                                
                                // Sous-titre
                                Text("Que veux-tu apprendre aujourd'hui ?")
                                    .font(.custom("ComicNeue", size: 23))
                            }
                        }
                        
                        // Séparateur blanc
                        Rectangle()
                            .fill(Color.white)
                            .frame(height: 3)
                        
                        
                                                
                        ScrollView {
                            // Grid verticale avec LazyVGrid
                            LazyVGrid(columns: columns, spacing: 30) {
                                ForEach(methods) { method in
                                    
                                    // Chaque carte est un NavigationLink vers la page ActivityChoiceView
                                    NavigationLink(destination: ActivityChoiceView(onGoingTab: $onGoingTab, selectedMethod: method)) {
                                        
                                        VStack {
                                            // Image de la méthode
                                            Image(method.imagesMethod)
                                                .resizable()
                                                .scaledToFit()
                                                .frame(height: 100)
                                                .padding(15)
                                                .background(
                                                    Circle().fill(Color("FondBeige"))
                                                )
                                            
                                            // Nom de la méthode
                                            Text(method.namesMethod)
                                                .bold()
                                                .font(.custom("ComicNeue", size: 18))
                                                .multilineTextAlignment(.center)
                                            
                                        }
                                        .frame(width: 120, height: 200)
                                        .padding()
                                        .background(Color.white)
                                        .cornerRadius(15)
                                        .overlay(
                                            // Bordure de la carte uniquement si sélectionnée
                                            RoundedRectangle(cornerRadius: 15)
                                                .stroke(
                                                    selectedMethodId == method.id ? Color.boutonPopUp : Color.clear,
                                                    lineWidth: 4
                                                )
                                        )
                                    }
                                    // Texte en noir
                                    .foregroundStyle(.black)
                                    .simultaneousGesture(
                                        TapGesture().onEnded {
                                            // Met à jour la carte sélectionnée quand on clique dessus
                                            selectedMethodId = method.id
                                        }
                                    )
                                }
                            }
                            .padding() // Padding autour de la grid
                        }
                        .shadow(radius: 7)
                       .padding(.bottom, 1)
                    }
                }
            .onAppear {
                withAnimation {
                    hidePopUp = false
                }
                
            }
    }
    }


#Preview {
    MethodView(hidePopUp: .constant(false), onGoingTab: .constant(0))
        .environment(faisem)
}
