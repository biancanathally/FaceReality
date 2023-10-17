//
//  File.swift
//  FaceReality
//
//  Created by mvitoriapereirac on 17/10/23.
//

import Foundation
import SwiftUI

struct CustomLaunchScreen: View {
    var body: some View {
        ZStack {
            Color.launchScreen // Background color
            Image("launchScreenImg")
                .resizable()
                .scaledToFit()
        }
        .edgesIgnoringSafeArea(.all) // To fill the entire screen
    }
}
