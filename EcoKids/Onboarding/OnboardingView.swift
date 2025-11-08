//
//  ContentView.swift
//  EcoKids
//
//  Created by Fatoumatou Dramé on 12/09/2025.
//

import SwiftUI

struct OnboardingView: View {
    @Binding var isOnboardingDone: Bool
    
    var body: some View {
        NavigationStack {
            
            ZStack {
                // Image de fond
                Image("unboarding")
                    .resizable()
                    .ignoresSafeArea()
                
                VStack{
 
                    Spacer()
                    
                    // Bouton
                    NavigationLink(destination: AgeView(isOnboardingDone: $isOnboardingDone)) {
                        Text(" Commencer l'aventure ")
                            .font(.custom("Baloo", size: 28))
                            .foregroundColor(.white)
                            .padding(10)
                            .background(Color.blue)
                            .cornerRadius(20)
                            .padding(.bottom, 40)
                    }
                    
                    
                }
                
                
            }
            .tint(.boutonPopUp)
        }
        
    }
    
}

#Preview {
    OnboardingView(isOnboardingDone: .constant(false))
        .environment(faisem)
}
