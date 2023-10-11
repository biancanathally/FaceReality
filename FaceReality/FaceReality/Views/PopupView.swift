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
            VStack(alignment: .leading, spacing: 8) {
                VStack {
                    Text(titleText)
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                
                VStack {
                    Text(bodyText)
                        .font(.body)
                        .padding()
                        .fixedSize(horizontal: false, vertical: true)
                }
                
                VStack {
                    if isReference == false  {
                        Image(imageIllustration ?? "")
                            .padding()
                            .frame(alignment: .leading)
                    }
                }
            }
            .background(RoundedRectangle(cornerRadius: 15).fill(.regularMaterial).shadow(radius: 4, y: 4))
            .padding()
            .padding(.horizontal, 10)
        }
    }
}
