//
//  TabView.swift
//  EcoKids
//
//  Created by Fatoumatou Dramé on 17/09/2025.
//

import SwiftUI

struct ContentView: View {
    
    //Import des couleurs de la TabBar
    init() {
        UITabBar.appearance().backgroundColor = UIColor(Color.tabBarVert)
        UITabBar.appearance().unselectedItemTintColor = UIColor(Color.white)
        
        
    }
    
    @State private var onBoardingHasEnded = false
    @State private var selectedTab = 0
    
    var body: some View {
        if onBoardingHasEnded {
            TabView(selection: $selectedTab) {
                Tab("Thèmes", systemImage: "book.fill", value: 0) {
                    ThemeView(onGoingTab: $selectedTab)
                }
                
                Tab("Récompenses", systemImage: "trophy.fill", value: 1) {
                    BadgeView()
                }
                
                Tab("Profil", systemImage: "person.fill", value: 2) {
                    UserView(onGoingTab: $selectedTab)
                }
            }
            .tint(.boutonPopUp)
            .navigationBarBackButtonHidden()
        } else {
            OnboardingView(isOnboardingDone: $onBoardingHasEnded)
        }
    }
}

#Preview {
    ContentView()
        .environment(faisem)
    
}
