//
//  ActivityChoiceView.swift
//  EcoKids
//
//  Created by Fatoumatou Dramé on 17/09/2025.
//

import SwiftUI

struct ActivityChoiceView: View {
    // Stocke l'ID de la méthode sélectionnée pour appliquer la bordure uniquement à cette carte
    @State private var selectedActivityChoiceId: UUID? = nil
    @Environment(User.self) private var user
    
    //permet de changer de tab quand on termine une activité
    @Binding var onGoingTab: Int

    let selectedMethod: Method
    
    // Colonnes de la grille
    let columns = [
        GridItem(.fixed(150), spacing: 20),
        GridItem(.fixed(150))
    ]
    
    var body: some View {
        VStack{
            ZStack{
                //fond
                Image("FondTheme")
                    .resizable()
                    .ignoresSafeArea()
                
                VStack{
                    HStack{
                        Image(user.image)
                            .resizable()
                            .frame(width: 100, height: 100)
                            .padding(.leading, 20)
                        VStack{
                            // Titre
                            Text("ACTIVITÉS")
                                .font(.custom("Baloo", size: 40))
                            // Sous-titre
                            Text("Choisis ton activité")
                                .font(.custom("ComicNeue", size: 23))
                        }
                    }
                    
                    
                    // Séparateur
                    Rectangle()
                        .fill(Color.white)
                        .frame(height: 3)
                        .padding(.bottom)
                    
                    //LazyVGrid
                    ScrollView{
                        LazyVGrid(columns: columns, spacing: 30) {
                            ForEach(selectedMethod.activities) { activity in
                                //Navigation vers la page ActivityInstructionsView
                                NavigationLink{
                                    ActivityInstructionsView(onGoingTab: $onGoingTab, selectedActivity: activity)
                                } label: {
                                    VStack {
                                        Image(activity.image)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(height: 100)
                                            .background(
                                                Circle().fill(Color("FondBeige"))
                                            )
                                        
                                        //Bordure de la carte uniquement si sélectionnée
                                        
                                        Text(activity.name)
                                            .bold()
                                            .font(.custom("ComicNeue", size: 16))
                                            .multilineTextAlignment(.center)
                                    }
                                    .foregroundStyle(.black)
                                    .frame(width: 120, height: 200)
                                    .padding()
                                    .background(Color.white)
                                    .cornerRadius(15)
                                    .overlay(
                                        // Bordure de la carte uniquement si sélectionnée
                                        RoundedRectangle(cornerRadius: 15)
                                            .stroke(
                                                selectedActivityChoiceId == activity.id ? Color.boutonPopUp : Color.clear,
                                                lineWidth: 4
                                            )
                                    )
                                    
                                }
                                .simultaneousGesture(
                                    TapGesture().onEnded {
                                        // Met à jour la carte sélectionnée quand on clique dessus
                                        selectedActivityChoiceId = activity.id
                                    }
                                )
                            }
                        }
                    }
                    .shadow(radius: 7)
                    .padding(.bottom, 1)
                }
            }
        }
    }
}

#Preview {
    ActivityChoiceView(onGoingTab: .constant(0), selectedMethod: Method(imagesMethod: "", namesMethod: "Jeux ludiques", activities: [
        ActivityChoice(image: "La chasse au tri dans la maison", name: "La chasse au tri dans la maison"),
        ActivityChoice(image: "Le jeu du tri en mouvement", name: "Le jeu du tri en mouvement"),
        ActivityChoice(image: "La pêche aux déchets", name: "La pêche aux déchets"),
        ActivityChoice(image: "Mon déchet va où ?", name: "Mon déchet va où ?")
    ]))
    .environment(faisem)
}
