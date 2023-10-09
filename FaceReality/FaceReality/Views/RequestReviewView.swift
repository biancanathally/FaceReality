//
//  RequestReviewView.swift
//  FaceReality
//
//  Created by livia on 09/10/23.
//

import StoreKit
import SwiftUI

struct ReviewAppCode: View {
    
    @Environment(\.requestReview) var requestReview
    @AppStorage("openCount") private var openCount = 0

    var body: some View {
        VStack{
            Text("Welcome to my App")
                .font(.headline)
            Text("You have opened the app \(openCount) times")
        }.onAppear(perform: {
            openCount += 1
            if openCount == 3 {
                requestReview()
            }
        })
    }
}
