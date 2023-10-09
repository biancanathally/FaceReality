//
//  FaceRealityApp.swift
//  FaceReality
//
//  Created by Bianca Nathally Bezerra de Lima on 06/09/23.
//

import SwiftUI
import FirebaseCore
import Firebase
import FirebaseAnalytics




@main
struct FaceRealityApp: App {
    @State private var showOnboarding = false
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @Environment(\.scenePhase) private var scenePhase
    @ObservedObject var notificationManager = NotificationManager.shared


    
    var body: some Scene {
        WindowGroup {
            if !showOnboarding {
                ContentView()
                    .onAppear {
                        let hasLaunchedBefore = UserDefaults.standard.bool(forKey: "hasLaunchedBefore")
                        if !hasLaunchedBefore {
                            showOnboarding = true
                            UserDefaults.standard.set(true, forKey: "hasLaunchedBefore")
                            Analytics.logEvent("users_visit", parameters: ["is_first_visit": false])
                        }
                        Analytics.logEvent("users_visit", parameters: ["is_first_visit": true])

                    }
            } else {
            OnboardingView()
            }
          
        }.onChange(of: scenePhase) { newScenePhase in
            switch newScenePhase {
            case .active:
                notificationManager.deleteNotifications(notificationIdentifier: "Inactive")
                print("App is active")
            case .inactive:
                notificationManager.scheduleNotifications()
                print("App is inactive")
            case .background:
                print("App is in background")
            @unknown default:
                print("Oh - interesting: I received an unexpected new value.")
            }
        }
        
    }
}

