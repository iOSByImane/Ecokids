//
//  InscriptionView.swift
//  EcoKids
//
//  Created by Fatoumatou Dramé on 17/09/2025.
//

import SwiftUI

struct InscriptionView: View {
    
    @State private var selectavatar = 0
    @State private var pseudo = ""
    
    @State private var navigateToTheme = false // <- état pour navigation
    
    @Environment(User.self) private var currentUser
    
    let avatars = ["avatar-1","avatar-2","avatar-3","avatar-4","avatar-5","avatar-6","avatar-7","avatar-8","avatar-9"]
    
    @Binding var isOnboardingDone: Bool
    
    var body: some View {
        
            ZStack{
                // Image de fond
                Image("Imageinscreption ")
                    .resizable()
                    .ignoresSafeArea()
                VStack(spacing: 20) {
                    // Titre
                    VStack {
                        Text("PROFIL")
                            .font(.custom("Baloo", size: 40))
                        Text("Je crée mon profil")
                            .font(.custom("ComicNeue", size: 20))
                    }
                    
                    // Separateur
                    Rectangle()
                        .fill(Color.white)
                        .frame(height: 3)
                    Spacer()
                    // Carrousel avatars
                    HStack {
                        Button(action: {
                            if selectavatar > 0 { selectavatar -= 1 }
                        }) {
                            Image(systemName: "chevron.left")
                                .font(.title)
                                .foregroundColor(.black)
                        }
                        
                        Spacer()
                        
                        Image(avatars[selectavatar])
                            .resizable()
                            .scaledToFit()
                            .frame(width: 120, height: 120)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 3))
                        
                        Spacer()
                        
                        Button(action: {
                            if selectavatar < avatars.count - 1 { selectavatar += 1 }
                        }) {
                            Image(systemName: "chevron.right")
                                .font(.title)
                                .foregroundColor(.black)
                        }
                    }
                    .padding(.horizontal)
                    
                    Spacer()
                    
                    // Champ pseudo
                    TextField("Choisis ton pseudo", text: $pseudo)
                        .multilineTextAlignment(.center)
                        .frame(width: 300, height: 25)
                        .padding()
                        .font(.custom("ComicNeue", size: 28))
                        .foregroundColor(.black)
                        .background(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(Color.blue, lineWidth: 1)
                        )
                        .padding(.horizontal)
                    
                    Spacer()
                    
                    Button(action: {
                        currentUser.pseudo = pseudo
                        currentUser.image = avatars[selectavatar]
                        //sors du onboarding
                        isOnboardingDone = true
                    }) {
                        Text("Valider")
                            .font(.custom("Baloo", size: 28))
                            .foregroundColor(.white)
                            .frame(width: 300, height: 25)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(12)
                    }
                    .padding(.horizontal)
                    
                    Button("Plus tard") {
                        print("Ignorer profil")
                        //sors du onboarding
                        isOnboardingDone = true
                    }
                    .padding(.top, 10)
                    .foregroundColor(.black)
                    .font(.custom("ComicNeue", size: 15))

                
                    Spacer()
                    
                }
                
            }
        
    }
}
#Preview {
    InscriptionView(isOnboardingDone: .constant(false))
        .environment(faisem)
}
