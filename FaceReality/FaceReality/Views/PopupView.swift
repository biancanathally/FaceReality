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
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 2) {
                
                if isOnboardingSteps == false {
                    HStack {
                        Text(titleText)
                            .font(.title2)
                            .fontWeight(.bold)
                            .padding()
                    }
                    
                    VStack {
                        Text(bodyText)
                            .font(.body)
                            .padding()
                            .fixedSize(horizontal: false, vertical: true)
                    }
                    .padding(.bottom)
                    
                    if isReference == false  {
                        Image(imageIllustration ?? "")
                            .padding()
                    }
                }
                
                if isOnboardingSteps == true {
                    HStack {
                        VStack(alignment: .leading) {
                            Text(titleText)
                                .fontWeight(.bold)
                                .padding(.top, 17)
                            Text(bodyText)
                                .fontWeight(.regular)
                                .padding(.bottom, 17)
                        }
                        .padding(.leading, 21)
                        Image(imageIllustration ?? "")
                            .resizable()
                            .padding(.all, 10)
                            .frame(width: 102, height: 102)
//                            .font(Font.custom("SFProText-Bold", size: 30))

//                            .foregroundColor(.iconColor)
//                            .padding()
                        
                    }

                }

                
                
            }
            .background(RoundedRectangle(cornerRadius: 15).fill(.regularMaterial).shadow(radius: 4, y: 4))
            .padding()
        }
    }
}
