//
//  InfoPopup.swift
//  FaceReality
//
//  Created by Bianca Nathally Bezerra de Lima on 06/09/23.
//

import Foundation
import SwiftUI

struct InfoPopup: View {
//    var dismissAction: () -> Void
    let arrayMuscles: [Muscle]
    
    var body: some View {
        ZStack {
            VStack {
                Rectangle()
                    .frame(height: 50)
                    .foregroundColor(.clear)
                
                ScrollView(showsIndicators: false){
                    ForEach(arrayMuscles, id: \.self) { muscle in
                        PopupView(dismissAction: {
                        }, titleText: muscle.muscleName, bodyText: muscle.muscleDescription, isReference: false, buttonLabel: "Fechar", imageIllustration: muscle.muscleIllustrationName)
                    }
                }
                .padding(.bottom, 150)
                .padding(.top, 40)
            }
        }
        .mask(LinearGradient(gradient: Gradient(colors: [.black, .black, .black, .black, .clear, .clear]), startPoint: .top, endPoint: .bottom))
    }
}
