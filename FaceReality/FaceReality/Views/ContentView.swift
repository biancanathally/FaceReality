//
//  ContentView.swift
//  FaceReality
//
//  Created by Bianca Nathally Bezerra de Lima on 06/09/23.
//

import SwiftUI
import UIKit
import AVFoundation
import Firebase

struct ContentView: View {
    @State private var showReferences: Bool = false
    @State private var isReferencesOpen: Bool = false
    @State private var isShowingFRDestinationView = false
    @ObservedObject var arViewModel : ARViewModel = ARViewModel()
    
    @State private var isOpen = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                ARViewContainer(arViewModel: arViewModel).edgesIgnoringSafeArea(.all).blur(radius: 40)
                
                Button(action: {
                    withAnimation(.easeInOut(duration: 0.5)) {
                        showReferences.toggle()
                    }
                }) {
                    Image(systemName: "info.circle")
                        .font(.system(size: 26))
                        .foregroundColor(showReferences ? .navyBlue: .projectWhite)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 8.5)
                }
                .background(RoundedRectangle(cornerRadius: 12).fill(.regularMaterial).opacity(0.3))
                .shadow(radius: 4, y: 4)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
                .padding(.all)
                
                VStack(spacing: 22) {
                    VStack(spacing: 44) {
                        Text("Face Reality")
                            .font(Font.custom("RedHatDisplayItalic-SemiBold", size: 36))
                            .fontWeight(.semibold)
                            .foregroundStyle(.white)
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color.projectWhite, lineWidth: 2).frame(width: 230, height: 74).opacity(0.22)
                            )
                        
                        Button("Começar") {
                            isShowingFRDestinationView = true
                        }
                        .buttonStyle(ButtonStyleSelect())
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                
                if showReferences {
                    let title = String(localized: "referencestitle-string")
                    let body = String(localized: "referencesbody-string")
                    VStack(alignment: .leading) {
                        PopupView(dismissAction: {
                                withAnimation(.easeInOut(duration: 0.5)) {
                                    showReferences.toggle()
                                }
                            },
                            titleText: title,
                            bodyText: body,
                            isReference: true,
                            buttonLabel: "Fechar",
                            imageIllustration: "").frame(height: UIScreen.main.bounds.height / 2.4)
                        Spacer()
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                }
                
                if isShowingFRDestinationView {
                    IntermadiateViewToFRContent(showFR: $isShowingFRDestinationView)
                }
            }
        }
        .onAppear(perform: {
            ReviewHandler.requestReview()
        })
    }
}

struct IntermadiateViewToFRContent: View {
    @Binding var showFR: Bool
    @State var shouldShow = false
    
    var body: some View {
        if shouldShow {
            FRContentView(showContent: $showFR)
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

struct ButtonStyleSelect: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.horizontal, 15)
            .padding(.vertical, 15)
            .font(Font.custom("SF Pro Text", size: 16))
            .fontWeight(.semibold)
            .foregroundStyle(Color.projectWhite)
            .background(Color.navyBlue)
            .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}

struct ModeButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.horizontal, 33)
            .padding(.vertical, 13)
            .font(Font.custom("SF Pro Text", size: 20))
            .fontWeight(.medium)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
