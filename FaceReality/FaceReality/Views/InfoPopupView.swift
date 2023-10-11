//
//  InfoPopupView.swift
//  FaceReality
//
//  Created by Bianca Nathally Bezerra de Lima on 11/10/23.
//

import SwiftUI

struct InfoPopupView: View {
    var dismissAction: () -> Void
    let titleTextInfo: String
    let bodyTextInfo: String
    let isReferenceInfo: Bool
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 8) {
                VStack {
                    Text(titleTextInfo)
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding()
                }
                
                VStack {
                    Text(bodyTextInfo)
                        .font(.body)
                        .padding()
                        .fixedSize(horizontal: false, vertical: true)
                }
            }
            .background(RoundedRectangle(cornerRadius: 15).fill(.regularMaterial).shadow(radius: 4, y: 4))
            .padding()
        }
    }
}
