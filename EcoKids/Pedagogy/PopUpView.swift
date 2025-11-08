//
//  PopUpView.swift
//  EcoKids
//
//  Created by Fatoumatou Dramé on 17/09/2025.
//

import SwiftUI
// Exemple de popups
let samplePopUps: [PopUp] = [
    PopUp(
        titlePopUp: "🌞 Le Soleil",
        smallTitlePopUp: "L'énergie gratuite",
        imagesPopUp: "sun_icon",
        descriptionPopUp: "Le soleil est une source d’énergie propre qui peut produire de l’électricité.",
        descriptionLink: "https://www.ecologie.gouv.fr/info-tri"
    ),
    PopUp(
        titlePopUp: "💧 L’eau précieuse",
        smallTitlePopUp: "Chaque goutte compte",
        imagesPopUp: "water_icon",
        descriptionPopUp: "L’eau est indispensable à la vie. Ne la gaspille pas, chaque goutte est précieuse.",
        descriptionLink: "https://www.ecologie.gouv.fr/info-tri"
    ),
    PopUp(
        titlePopUp: "♻️ Le tri sélectif",
        smallTitlePopUp: "Donne une seconde vie",
        imagesPopUp: "recycle_icon",
        descriptionPopUp: "En triant tes déchets, tu permets de recycler le papier, le plastique et le verre.",
        descriptionLink: "https://www.ecologie.gouv.fr/info-tri"
    ),
    PopUp(
        titlePopUp: "🌱 La nature qui pousse",
        smallTitlePopUp: "Les plantes sont vivantes",
        imagesPopUp: "plant_icon",
        descriptionPopUp: "Planter une graine et la voir grandir, c’est participer à protéger la planète.",
        descriptionLink: "https://www.ecologie.gouv.fr/info-tri"
    ),
    PopUp(
        titlePopUp: "🚲 Bouger sans polluer",
        smallTitlePopUp: "Le vélo, c’est rigolo !",
        imagesPopUp: "bike_icon",
        descriptionPopUp: "Aller à l’école à vélo ou à pied, c’est bon pour ta santé et pour la planète.",
        descriptionLink: "https://www.ecologie.gouv.fr/info-tri"
    ),
    PopUp(
        titlePopUp: "🏡 Ma maison écolo",
        smallTitlePopUp: "Une maison qui respire",
        imagesPopUp: "house_icon",
        descriptionPopUp: "Éteindre la lumière en quittant une pièce permet d’économiser beaucoup d’énergie.",
        descriptionLink: "https://www.ecologie.gouv.fr/info-tri"
    )
]
struct PopUpView: View {
    var popup: PopUp
    @Binding var isPresented: Bool
//    var onGoToMethod: (() -> Void)? = nil
    @State private var goToMethod = false
    
    //permet de changer de tab quand on termine une activité
    @Binding var onGoingTab: Int
    
    var body: some View {
        ZStack {
            // Fond semi-transparent
            Color.black.opacity(0.5)
                .edgesIgnoringSafeArea(.all)
                .onTapGesture {
                    isPresented = false
                }
            
            ZStack(alignment: .topTrailing) { // ZStack interne pour pop-up
                            VStack(spacing: 20) {
                              
                                
                                // Titre
                                Text(popup.titlePopUp)
                                    .font(.custom("Baloo", size: 28))
                                    .foregroundColor(.blue)
                                
                                // Petit titre
                                Text(popup.smallTitlePopUp)
                                    .font(.custom("ComicNeue-Bold", size: 20))
                                    .foregroundColor(.gray)
                                
                                // Description
                                Text(popup.descriptionPopUp)
                                    .font(.custom("ComicNeue-Bold", size: 20))
                                    .multilineTextAlignment(.center)
                                    .padding(.horizontal)

                                
                                // Lien
//                                Button(action: {
//                                    print("Lien cliqué : \(popup.descriptionLink)")
//                                }) {
//                                    Text(popup.descriptionLink)
//                                        .underline()
//                                        .foregroundColor(.blue)
//                                        .font(.custom("ComicNeue", size: 18))
//
//                                }
                                Link("En savoir plus", destination: URL(string:popup.descriptionLink)!)
                                    .underline()
                                    .foregroundColor(.blue)
                                    .font(.custom("ComicNeue", size: 18))
                                
                               
                                Button {
                                    goToMethod.toggle()
                                } label: {
                                    Text("Aller à la méthode")
                                        .font(.custom("ComicNeue-Bold", size: 20))
                                        .foregroundColor(.white)
                                        .padding()
                                        .frame(maxWidth: .infinity)
                                        .background(Color.boutonPopUp)
                                        .cornerRadius(12)
                                }
                                .navigationDestination(isPresented: $goToMethod) {
                                    MethodView(hidePopUp: $isPresented, onGoingTab: $onGoingTab)
                                }
                                
                            }
                            .padding()
                            .background(Color("FondBeige"))
                            .cornerRadius(20)
                            
                            // Croix en haut à droite, à l'intérieur du pop-up beige
                            Button(action: {
                                isPresented = false
                            }) {
                                Image(systemName: "xmark.circle.fill")
                                    .font(.system(size: 24))
                                    .foregroundColor(.gray)
                            }
                            .padding(10)
                        }
            .padding()
//                        .padding(40) // padding autour du pop-up
                    }
                }
            }

#Preview {
    PopUpView(popup: samplePopUps[0], isPresented: .constant(true), onGoingTab: .constant(0))
}
