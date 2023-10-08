//
//  FaceRealityApp.swift
//  FaceReality
//
//  Created by Bianca Nathally Bezerra de Lima on 06/09/23.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
}


@main
struct FaceRealityApp: App {
    @State private var showOnboarding = false
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    
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

