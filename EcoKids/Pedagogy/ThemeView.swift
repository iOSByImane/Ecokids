//
//  ThemeView.swift
//  EcoKids
//
//  Created by Fatoumatou Dramé on 17/09/2025.
//

import SwiftUI

struct ThemeView: View {
    @State private var selectedThemeId: UUID? = nil
    
    // Liste des thèmes
    @State private var themes: [Theme] = [
        Theme(imagesThemes: "L'énergie du soleil", namesThemes: "L’énergie du soleil", popUps: []),
        Theme(imagesThemes: "L'eau magique", namesThemes: "L'eau est magique", popUps: []),
        Theme(imagesThemes: "Les couleurs du tri", namesThemes: "Les couleurs du tri", popUps: []),
        Theme(imagesThemes: "La nature qui pousse", namesThemes: "La nature qui pousse", popUps: []),
        Theme(imagesThemes: "Bouger sans polluer", namesThemes: "Bouger sans polluer", popUps: []),
        Theme(imagesThemes: "Ma maison écolo", namesThemes: "Ma maison écolo", popUps: []),
    ]
    
    @State private var showPopup = false
    @State private var currentPopup: PopUp? = nil
    @State private var navigateToMethod = false
    @Environment(User.self) private var user
    
    //permet de changer de tab quand on termine une activité
    @Binding var onGoingTab: Int
    
    // 2 colonnes pour la grille
    let columns = [
        GridItem(.fixed(150), spacing: 30),
        GridItem(.fixed(150))
    ]
    
    
    
    var body: some View {
        
        NavigationStack {
            ZStack {
                // Fond
                Image("FondTheme")
                    .resizable()
                    .ignoresSafeArea()
                VStack{
                    HStack{
                        Image(user.image)
                            .resizable()
                            .frame(width: 100, height: 100)
                            .padding(.leading, 20)
                        VStack{Text("THÈMES")
                                .font(.custom("Baloo", size: 40))
                            
                            Text("Je sélectionne mon thème")
                                .font(.custom("ComicNeue", size: 23))
                            
                            
                        }
                        
                        
                        
                    }
                    
                    
                    VStack {
                        
                        
                        Rectangle()
                            .fill(Color.white)
                            .frame(height: 3)
                        
                        Spacer()
                        
                        ScrollView {
                            LazyVGrid(columns: columns, spacing: 20) {
                                ForEach(themes.indices, id: \.self) { index in
                                    VStack {
                                        Image(themes[index].imagesThemes)
                                            .resizable()
                                            .scaledToFit()
                                            .padding(15)
                                            .background(Circle().fill(Color("FondBeige")))
                                            .frame(height: 120)
                                        
                                        Text(themes[index].namesThemes)
                                            .font(.custom("ComicNeue-Bold", size: 17))
                                            .multilineTextAlignment(.center)
                                    }
                                    .foregroundStyle(.black)
                                    .frame(width: 120, height: 200)
                                    .padding()
                                    .background(Color.white)
                                    .cornerRadius(15)
                                    .overlay(
                                        //Bordure de la carte uniquement si sélectionnée
                                        RoundedRectangle(cornerRadius: 15)
                                            .stroke(
                                                selectedThemeId == themes[index].id ? Color.boutonPopUp : Color.clear,
                                                lineWidth: 4
                                            )
                                    )
                                    .onTapGesture {
                                        currentPopup = samplePopUps.randomElement()
                                        showPopup = true
                                    }
                                    .simultaneousGesture(
                                        TapGesture().onEnded {
                                            // Met à jour la carte sélectionnée quand on clique dessus
                                            selectedThemeId = themes[index].id
                                        }
                                    )
                                }
                            }
                            .shadow(radius: 7)
                            .padding()
                        }
                        
                        .padding(.bottom, 1)
                    }
                    
                    // Popup overlay
                    
                }
                
                if showPopup, let popup = currentPopup {
                    PopUpView(
                        popup: popup,
                        isPresented: $showPopup,
                        onGoingTab: $onGoingTab
                    )
                    .transition(.opacity)
                }
            }
            
        }
        .tint(.blue)
    }
}


#Preview {
    ThemeView(onGoingTab: .constant(0))
        .environment(faisem)
}
