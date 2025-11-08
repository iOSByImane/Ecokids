//
//  AgeView.swift
//  EcoKids
//
//  Created by Fatoumatou Dramé on 17/09/2025.
//

import SwiftUI

struct AgeView: View {
    @Binding var isOnboardingDone: Bool
    var body: some View {
        
            //pour ce code la "sky" sera toujours en haut de l’écran et "ImageAge" reste en arrière-plan
            ZStack {
                
                // image de fond
                Image("ImageAge")
                    .resizable()
                    .ignoresSafeArea()
                
                // image en haut
                VStack {
                    Image("sky")
                        .resizable()
                        .scaledToFit() // garde les proportions
                        .frame(height: 400)
                    
                    Spacer()
                }
                .ignoresSafeArea()
                
                VStack(spacing: 20) {
                    NavigationLink(destination: InscriptionView(isOnboardingDone: $isOnboardingDone)) {
                        Text("  3 ANS - 5 ANS  ")
                            .font(.custom("Baloo", size: 30))
                            .foregroundColor(.white)
                            .padding(15)
                            .background(Color.blue)
                            .cornerRadius(20)
                    }
                    .padding(50)
                    NavigationLink(destination: InscriptionView(isOnboardingDone: $isOnboardingDone)) {
                        Text("  6 ANS - 8 ANS  ")
                            .font(.custom("Baloo", size: 30))
                            .foregroundColor(.white)
                            .padding(15)
                            .background(Color.blue)
                            .cornerRadius(20)
                    }
                }
            }
        
    }
}

#Preview {
    AgeView(isOnboardingDone: .constant(false))
        .environment(faisem)
}
