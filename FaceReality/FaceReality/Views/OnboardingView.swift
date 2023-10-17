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
    var showStepByStep = UserDefaults.standard.set(true, forKey: UserDefaultsKeys.showStepByStep)
    
    let appStatus: AppStatus = .main
    var dismissAction: () -> Void
    var body: some View {
//        NavigationView {
            ZStack {
//                ARViewContainer(arViewModel: arViewModel).edgesIgnoringSafeArea(.all).blur(radiuqs: 40)
                Color.black.opacity(0.5).edgesIgnoringSafeArea(.all)
                
                VStack(spacing: 24) {
                    VStack(spacing: 24) {
                        Text("onboardingtitle-string")
                            .font(.title2)
                            .foregroundColor(.black)
                            .padding(.top, 16)
                        
                        Text("onboardingbody-string")
                            .font(.body)
                            .foregroundColor(.black)
                            .padding(.horizontal, 16)
//                            .minimumScaleFactor(0.01)
                            .multilineTextAlignment(.leading)
                    }
                    
                    Button("onboardingbutton-string") {
                        isShowingDestinationView = true
                        dismissAction()

                    }
                    .padding(.horizontal, 16)
                    .padding(.vertical, 12)
                    .foregroundColor(Color.projectWhite)
                    .background(Color.navyBlue)
                    .cornerRadius(12)
                    .padding(.bottom, 16)
                }
                .background(RoundedRectangle(cornerRadius: 8).foregroundColor(.white).opacity(0.4).shadow(radius: 8, y: 8))
//                .background(.white.opacity(0.4))
                .padding(.horizontal, 45)
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
