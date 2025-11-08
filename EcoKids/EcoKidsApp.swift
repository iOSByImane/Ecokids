//
//  EcoKidsApp.swift
//  EcoKids
//
//  Created by Fatoumatou Dramé on 12/09/2025.
//

import SwiftUI

@main
struct EcoKidsApp: App {
    @State private var user = faisem
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(user)
        }
    }
}
