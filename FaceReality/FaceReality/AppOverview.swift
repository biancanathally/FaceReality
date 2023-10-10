//
//  ARView.swift
//  FaceReality
//
//  Created by mvitoriapereirac on 09/10/23.
//

import Foundation
import SwiftUI

struct AppOverview: View {
    @State var appStatus: AppStatus = .start
    @State var a = false
    @ObservedObject var arViewModel = ARViewModel.shared

    @State private var shouldShowCamera = false

    
    var body: some View {
        ZStack {
            if shouldShowCamera {
                ARViewContainer(arViewModel: arViewModel).edgesIgnoringSafeArea(.all)
               

//                switch appStatus {
//                case .start:
//                    ARViewContainer(arViewModel: arViewModel).edgesIgnoringSafeArea(.all).blur(radius: 40)
//                case .main:
//                    ARViewContainer(arViewModel: arViewModel).edgesIgnoringSafeArea(.all)
//
//                }

            }


            switch appStatus {
            case .onboarding:
                OnboardingView()
            case .start:
                ContentView(dismissAction: {
                    appStatus = .main
                })
//
            case .main:
                FRContentView(showContent: $a, dismissAction: {
                    appStatus = .start
                })

            }
            
        }

        .onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0, execute: {
                shouldShowCamera = true
            })
            
        }
        
        
        
        
    }
}

enum AppStatus {
    
    case onboarding
    case start
    case main
}
