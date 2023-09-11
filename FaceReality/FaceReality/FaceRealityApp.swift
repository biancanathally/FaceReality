//
//  FaceRealityApp.swift
//  FaceReality
//
//  Created by Bianca Nathally Bezerra de Lima on 06/09/23.
//

import SwiftUI

@main
struct FaceRealityApp: App {
    @State private var showOnboarding = false
    
    var body: some Scene {
        WindowGroup {
            if !showOnboarding {
                ContentView()
                    .onAppear {
                        let hasLaunchedBefore = UserDefaults.standard.bool(forKey: "hasLaunchedBefore")
                        if !hasLaunchedBefore {
                            showOnboarding = true
                            UserDefaults.standard.set(true, forKey: "hasLaunchedBefore")
                        }
                    }
            } else {
                OnboardingView()
            }
        }
    }
}
