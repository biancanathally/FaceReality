//
//  PopupView.swift
//  FaceReality
//
//  Created by Bianca Nathally Bezerra de Lima on 06/09/23.
//

import SwiftUI

struct PopupView: View {
    var dismissAction: () -> Void
    let titleText: String
    let bodyText: String
    let isReference: Bool
    let buttonLabel: String
    let imageIllustration: String?
    let isOnboardingSteps: Bool
    @State private var offsetAnimation = false
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 8) {
                VStack {
//                    Text(titleText)
//                        .font(.title2)
//                        .fontWeight(.bold)
//                        .padding()
                    VStack(alignment: .leading, spacing: 2) {
                        
                        if isOnboardingSteps == false {
                            VStack(alignment: .leading) {
                                HStack {
                                    Text(titleText)
                                        .font(.title2)
                                        .fontWeight(.bold)
                                        .padding(.top, 16)
                                        .padding(.bottom, 8)
                                        .padding(.horizontal, 16)
                                }
                                
                                VStack {
                                    Text(bodyText)
                                        .font(.body)
                                        .padding(.bottom, 8)
                                        .fixedSize(horizontal: false, vertical: true)
                                        .padding(.horizontal, 16)
                                    
                                }
                                .padding(.bottom)
                                
                                if isReference == false  {
                                    Image(imageIllustration ?? "")
                                        .padding(.bottom, 16)
                                        .padding(.horizontal, 16)

                                    
                                }
                            }
//                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
//                            .padding(.horizontal, 50)
                            .frame(width: UIScreen.main.bounds.width/8 * 7, alignment: .leading)

                            
                            
                            
                        }
                        
                        if isOnboardingSteps == true {
                            HStack(spacing: 30) {
                                VStack(alignment: .leading) {
                                    Text(titleText)
                                        .fontWeight(.bold)
                                        .padding(.top, 17)
                                    Text(bodyText)
                                        .fontWeight(.regular)
                                        .padding(.bottom, 17)
                                }
                                .padding(.leading, 21)
                                ZStack {
                                    Image(imageIllustration ?? "")
                                        .resizable()
                                        .padding(.all, 10)
                                        .frame(width: 102, height: 102)
                                    
                                    Image("pointingFinger")
                                        .resizable()
                                        .frame(width: 60, height: 60)
                                        .offset(x: offsetAnimation ? -40 : -20, y: offsetAnimation ? 20 : -0)
                                        .animation(Animation.easeInOut(duration: 1.0).repeatForever(autoreverses: true))
                                        .onAppear() {
                                            self.offsetAnimation.toggle()
                                        }
                                    
                                    
                                }
                                
                            }
                            
                        }
                        
//                        VStack {
//                            if isReference == false  {
//                                Image(imageIllustration ?? "")
//                                    .padding()
//                                    .frame(alignment: .leading)
//                            }
//                        }
                    }
                    .background(RoundedRectangle(cornerRadius: 15).fill(.regularMaterial).shadow(radius: 4, y: 4))
                    .padding()
                    .padding(.horizontal, 10)
                    
                }
            }
        }
    }
}
