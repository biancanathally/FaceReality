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
    
    var body: some View {
        ZStack {
            VStack(alignment: .center, spacing: 2) {
                Text(titleText)
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding()
                
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
            .background(RoundedRectangle(cornerRadius: 15).fill(.regularMaterial).opacity(0.6).shadow(radius: 4, y: 4))
            .padding()
        }
    }
}
