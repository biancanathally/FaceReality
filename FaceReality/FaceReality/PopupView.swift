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
    let subtitleText: String?
    let bodyText: String
    let isReference: Bool
    let buttonLabel: String
    let imageIllustration: String?
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 2) {
                HStack {
                    Text(titleText)
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding()
                    
                    Spacer()
                    
                    if isReference {
                        Button(action: {
                            withAnimation(.easeInOut(duration: 0.1)) {
                                dismissAction()}
                        }) {
                            Image(systemName: "x.circle")
                                .foregroundColor(.iconColor.opacity(0.9))
                                .font(.system(size: 24))
                                .padding()
                        }
                        .padding()
                    }
                }
                
                if isReference {
                    Text(subtitleText ?? "")
                        .font(.body)
                        .padding()
                        .fixedSize(horizontal: false, vertical: true)
                }
                
                ScrollView {
                    VStack {
                        Text(bodyText)
                            .font(.body)
                            .padding()
                            .fixedSize(horizontal: false, vertical: true)
                    }
                }
                .padding(.bottom)
                
                if isReference == false  {
                    Image(imageIllustration ?? "")
                        .padding()
                }
            }
            .background(RoundedRectangle(cornerRadius: 15).fill(.regularMaterial).shadow(radius: 4, y: 4))
            .padding()
        }
    }
}
