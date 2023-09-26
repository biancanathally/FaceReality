//
//  FRContentView.swift
//  FaceReality
//
//  Created by Bianca Nathally Bezerra de Lima on 06/09/23.
//

import SwiftUI
import RealityKit

struct HostingWindowFinder: UIViewRepresentable {
    var callback: (UIWindow?) -> ()
    
    func makeUIView (context: Context) -> UIView {
        let view = UIView()
        DispatchQueue.main.async { [weak view] in
            self.callback (view? .window)
        }
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
    }
}

struct FRContentView : View {
    @ObservedObject var arViewModel: ARViewModel = ARViewModel()
    @State private var showInfo = false
    @State private var strokeArray = [true, false, false, false, false]
    @State private var isShowingContentDestinationView = false
    @Binding var showContent: Bool
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack {
            ARViewContainer(arViewModel: arViewModel).edgesIgnoringSafeArea(.all)
            
            HostingWindowFinder { window in
                Unity.shared.setHostMainWindow(window)
            }
            
            HStack {
                VStack(alignment: .center, spacing: 5) {
                    HStack(alignment: .top, spacing: 202) {
                        
                        Button(action: {
                            showContent = false
                        }) {
                            Image(systemName: "house.fill")
                                .foregroundColor(.projectWhite)
                                .padding(.horizontal, 10)
                                .padding(.vertical, 8.5)
                        }
                        .background(RoundedRectangle(cornerRadius: 12).fill(.regularMaterial).opacity(0.3))
                        .shadow(radius: 4, y: 4)
                        
                        HStack(spacing: 20) {
                            
                            Button(action: {
//                                Play3D()
                                Unity.shared.show()
                            }) {
                                Image(systemName: "cube.fill")
                                    .foregroundColor(.projectWhite)
                                    .padding(.horizontal, 10)
                                    .padding(.vertical, 8.5)
                            }
                            .background(RoundedRectangle(cornerRadius: 12).fill(.regularMaterial).opacity(0.3))
                            .shadow(radius: 4, y: 4)
                            
                            Button(action: {
                                withAnimation(.easeInOut(duration: 0.5)) {
                                    showInfo = true
                                }
                            }) {
                                Image(systemName: "book.closed.fill")
                                    .foregroundColor(.projectWhite)
                                    .padding(.horizontal, 10)
                                    .padding(.vertical, 8.5)
                            }
                            .background(RoundedRectangle(cornerRadius: 12).fill(.regularMaterial).opacity(0.3))
                            .shadow(radius: 4, y: 4)
                        }
                    }
                    
                    VStack {
                        Rectangle()
                            .frame(height: 25)
                            .foregroundColor(.clear)
                        
                        switch arViewModel.emotions {
                        case .Joy:
                            Text(arViewModel.smileChecker())
                                .padding(.horizontal, 15)
                                .padding(.vertical, 5)
                                .foregroundColor(arViewModel.isSmiling ? .green : .red)
                                .background(RoundedRectangle(cornerRadius: 8).fill(.regularMaterial).opacity(0.5))
                                .shadow(radius: 4, y: 4)
                            
                        case .Sadness:
                            Text(arViewModel.sadnessChecker())
                                .padding(.horizontal, 15)
                                .padding(.vertical, 5)
                                .foregroundColor(arViewModel.isFrowning ? .green : .red)
                                .background(RoundedRectangle(cornerRadius: 8).fill(.regularMaterial).opacity(0.5))
                                .shadow(radius: 4, y: 4)
                            
                        case .Rage:
                            Text(arViewModel.scowlChecker())
                                .padding(.horizontal, 15)
                                .padding(.vertical, 5)
                                .foregroundColor(arViewModel.isScowling ? .green : .red)
                                .background(RoundedRectangle(cornerRadius: 8).fill(.regularMaterial).opacity(0.5))
                                .shadow(radius: 4, y: 4)
                            
                        case .Surprise:
                            Text(arViewModel.surprisedChecker())
                                .padding(.horizontal, 15)
                                .padding(.vertical, 5)
                                .foregroundColor(arViewModel.isScared ? .green : .red)
                                .background(RoundedRectangle(cornerRadius: 8).fill(.regularMaterial).opacity(0.5))
                                .shadow(radius: 4, y: 4)
                            
                        case .Disgust:
                            Text(arViewModel.disgustChecker())
                                .padding(.horizontal, 15)
                                .padding(.vertical, 5)
                                .foregroundColor(arViewModel.isDisgusted ? .green : .red)
                                .background(RoundedRectangle(cornerRadius: 8).fill(.regularMaterial).opacity(0.5))
                                .shadow(radius: 4, y: 4)
                        }
                    }
                    
                    Spacer()
                    
                    HStack(spacing: 15) {
                        VStack {
                            Button(action: {
                                arViewModel.emotions = .Joy
                                
                                if strokeArray[0] == false {
                                    strokeArray = [true, false, false, false, false]
                                    
                                } else {
                                    strokeArray[0] = false
                                }
                                
                            }) {
                                Image(strokeArray[0] ? "Smiley face" : "smile.stroke")
                                    .foregroundColor(.white)
                                    .font(.system(size: 60))
                            }
                            
                            if strokeArray[0] {
                                Text("Sorriso")
                                    .foregroundColor(.white)
                            }
                        }
                        
                        VStack {
                            Button(action: {
                                arViewModel.emotions = .Sadness
                                
                                if strokeArray[1] == false {
                                    strokeArray = [false, true, false, false, false]
                                    
                                } else {
                                    strokeArray[1] = false
                                }
                            }) {
                                Image(strokeArray[1] ? "Sad face": "sad.stroke")
                                    .foregroundColor(.white)
                                    .font(.system(size: 60))
                            }
                            
                            if strokeArray[1] {
                                Text("Tristeza")
                                    .foregroundColor(.white)
                            }
                        }
                        
                        VStack {
                            Button(action: {
                                arViewModel.emotions = .Surprise
                                
                                if strokeArray[3] == false {
                                    strokeArray = [false, false, false, true, false]
                                    
                                } else {
                                    strokeArray[3] = false
                                }
                            }) {
                                Image(strokeArray[3] ? "Surprised face": "surprise.stroke")
                                    .foregroundColor(.white)
                                    .font(.system(size: 60))
                            }
                            
                            if strokeArray[3] {
                                Text("Surpresa")
                                    .foregroundColor(.white)
                            }
                        }
                        
                        VStack {
                            Button(action: {
                                arViewModel.emotions = .Rage
                                
                                if strokeArray[2] == false {
                                    strokeArray = [false, false, true, false, false]
                                    
                                } else {
                                    strokeArray[2] = false
                                }
                            }) {
                                Image(strokeArray[2] ? "Angry face": "anger.stroke")
                                    .foregroundColor(.white)
                                    .font(.system(size: 60))
                            }
                            
                            if strokeArray[2] {
                                Text("Raiva")
                                    .foregroundColor(.white)
                            }
                        }
                        
                        VStack {
                            Button(action: {
                                arViewModel.emotions = .Disgust
                                if strokeArray[4] == false {
                                    strokeArray = [false, false, false, false, true]
                                    
                                } else {
                                    strokeArray[4] = false
                                }
                            }) {
                                Image(strokeArray[4] ? "Disgust face" : "disgust.stroke")
                                    .foregroundColor(.white)
                                    .font(.system(size: 60))
                            }
                            
                            if strokeArray[4] {
                                Text("Nojo")
                                    .foregroundColor(.white)
                            }
                        }
                    }
                    .padding(.all)
                    .shadow(radius: 4, y: 4)
                    .background(RoundedRectangle(cornerRadius: 20).fill(.regularMaterial).opacity(0.5).shadow(radius: 4, y: 4))
                }
            }
            
            if showInfo {
                switch arViewModel.emotions {
                case .Joy:
                    InfoPopup(dismissAction: {
                        showInfo = false
                    }, arrayMuscles: arViewModel.smileMuscles.muscles)
                    
                case .Sadness:
                    InfoPopup(dismissAction: {
                        showInfo = false
                    }, arrayMuscles: arViewModel.sadnessMuscles.muscles)
                    
                case .Rage:
                    InfoPopup(dismissAction: {
                        showInfo = false
                        
                    }, arrayMuscles: arViewModel.angerMuscles.muscles)
                    
                case .Surprise:
                    InfoPopup(dismissAction: {
                        showInfo = false
                    }, arrayMuscles: arViewModel.surpriseMuscles.muscles)
                    
                case .Disgust:
                    InfoPopup(dismissAction: {
                        showInfo = false
                    }, arrayMuscles: arViewModel.disgustMuscles.muscles)
                    
                }
            }
            
            if isShowingContentDestinationView {
                IntermadiateViewFromFRToContent()
            }
        }
    }
}

struct Play3D: View {
//     var mode: String

     var body: some View {
         VStack {
             Text("Volte à página inicial").onAppear{
                 Unity.shared.show()
             }
         }
         .background (
             HostingWindowFinder { window in
                 Unity.shared.setHostMainWindow(window)
             }
         )
     }
 }

struct IntermadiateViewFromFRToContent: View {
    @State var shouldShow = false
    
    var body: some View {
        if shouldShow {
            ContentView()
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

struct HomeButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
        Image(systemName: "house.fill")
            .foregroundColor(.iconColor)
            .font(.system(size: 26))
            .frame(width: 28, height: 28)
            .padding(.horizontal, 11)
            .padding(.vertical, 6)
            .background(RoundedRectangle(cornerRadius: 12).fill(.regularMaterial))
            .shadow(radius: 4, y: 4)
    }
}

struct ARViewContainer: UIViewRepresentable {
    var arViewModel: ARViewModel
    
    func makeUIView(context: Context) -> ARView {
        arViewModel.startSessionDelegate()
        return arViewModel.arView
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
    
}
