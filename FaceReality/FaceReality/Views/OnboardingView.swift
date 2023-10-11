//
//  OnboardingView.swift
//  FaceReality
//
//  Created by Bianca Nathally Bezerra de Lima on 06/09/23.
//

import SwiftUI
import RealityKit
import UserNotifications


struct OnboardingView: View {
    @ObservedObject var arViewModel : ARViewModel = ARViewModel.shared
    @State private var isShowingDestinationView = false
//    var showStepByStep = UserDefaults.standard.set(true, forKey: UserDefaultsKeys.showStepByStep)
    
//    let appStatus: AppStatus = .main
    var dismissAction: () -> Void
    var body: some View {
//        NavigationView {
            ZStack {
//                ARViewContainer(arViewModel: arViewModel).edgesIgnoringSafeArea(.all).blur(radiuqs: 40)
                Color.black.opacity(0.5).edgesIgnoringSafeArea(.all)
                
                VStack(spacing: 24) {
                    VStack(spacing: 24) {
                        Text("onboardingtitle-string")
                            .font(.system(size: 18))
                            .foregroundColor(.black)
                            .padding(.top, 16)
                        
                        Text("onboardingbody-string")
                            .font(.system(size: 14))
                            .foregroundColor(.black)
                            .padding()
                            .minimumScaleFactor(0.01)
                            .multilineTextAlignment(.center)
                    }
                    
                    Button("onboardingbutton-string") {
                        isShowingDestinationView = true
                        dismissAction()

                    }
                    .padding(.horizontal, 50)
                    .padding(.vertical, 12)
                    .foregroundColor(Color.projectWhite)
                    .background(Color.navyBlue)
                    .cornerRadius(20)
                    .padding(.bottom, 16)
                }
                .background(RoundedRectangle(cornerRadius: 8).fill(.regularMaterial).opacity(0.25).shadow(radius: 8, y: 8))
                .padding(.horizontal, 60)
                .padding(.vertical, 250)
                
                if isShowingDestinationView {
//                    AppOverview(appStatus: appStatus)
                }
                
            }
            .background(BackgroundBlurView().ignoresSafeArea(.all))
            .onAppear {
                UserDefaults.standard.set(true, forKey: UserDefaultsKeys.showStepByStep)
            }
//        }
    }
}

struct IntermadiateViewToContent: View {
    @State var shouldShow = false
    
    var body: some View {
        if shouldShow {
            ContentView(dismissAction: {})
        }
        else {
            Text("Loading")
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now()){
                        self.shouldShow = true
                    }
                }
        }
    }
}

#if DEBUG
struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView(dismissAction: {})
    }
}
#endif
