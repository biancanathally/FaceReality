//
//  FRContentView.swift
//  FaceReality
//
//  Created by Bianca Nathally Bezerra de Lima on 06/09/23.
//

import SwiftUI
import RealityKit

struct FRContentView : View {
    @ObservedObject var arViewModel: ARViewModel = ARViewModel()
    @State private var showInfo = false
    @State private var strokeArray = [true, false, false, false, false]
    @Environment(\.dismiss) private var dismiss
    @State private var isCameraShowing: Bool = false
    
    var body: some View {
        ZStack {
            if isCameraShowing {
                ARViewContainer(arViewModel: arViewModel).edgesIgnoringSafeArea(.all)
            }
            
            HStack {
                VStack(alignment: .center, spacing: 5) {
                    HStack(alignment: .top) {
                        
                        Button(action: {
                            dismiss()
                        }) {
                            Image(systemName: "house.fill")
                                .foregroundColor(.iconColor)
                                .font(.system(size: 26))
                                .frame(width: 28, height: 28)
                                .padding(.horizontal, 11)
                                .padding(.vertical, 6)
                        }
                        .background(RoundedRectangle(cornerRadius: 12).fill(.regularMaterial))
                        .shadow(radius: 4, y: 4)
                        
                        Spacer()
                        
                        VStack {
                            Rectangle()
                                .frame(height: 25)
                                .foregroundColor(.clear)
                            
                            switch arViewModel.emotions {
                            case .Joy:
                                Text(arViewModel.smileChecker(isSmiling: arViewModel.isPersonSmiling(smileLeft: arViewModel.model.smileLeft, smileRight: arViewModel.model.smileRight), isGenuineSmiling: arViewModel.isPersonGenuineSmiling(smileLeft: arViewModel.model.smileLeft, smileRight: arViewModel.model.smileRight, squintLeft: arViewModel.model.squintLeft, squintRight: arViewModel.model.squintRight)))
                                    .padding(.horizontal, 15)
                                    .padding(.vertical, 5)
                                    .foregroundColor(arViewModel.isPersonSmiling(smileLeft: arViewModel.model.smileLeft, smileRight: arViewModel.model.smileRight) ? .green : .red)
                                    .background(RoundedRectangle(cornerRadius: 8).fill(.regularMaterial).opacity(0.5))
                                    .shadow(radius: 4, y: 4)

                                
                            case .Sadness:
                                Text(arViewModel.sadnessChecker(isPersonFrowning: arViewModel.isPersonFrowning(browInnerUp: arViewModel.model.browInnerUp, mouthRollUpper: arViewModel.model.mouthRollUpper, frownLeft: arViewModel.model.frownLeft, frownRight: arViewModel.model.frownRight)))
                                    .padding(.horizontal, 15)
                                    .padding(.vertical, 5)
                                    .foregroundColor(arViewModel.isPersonFrowning(browInnerUp: arViewModel.model.browInnerUp, mouthRollUpper: arViewModel.model.mouthRollUpper, frownLeft: arViewModel.model.frownLeft, frownRight: arViewModel.model.frownRight) ? .green : .red)
                                    .background(RoundedRectangle(cornerRadius: 8).fill(.regularMaterial).opacity(0.5))
                                    .shadow(radius: 4, y: 4)

                            case .Rage:
                                Text(arViewModel.scowlChecker(isPersonScowling: arViewModel.isPersonScowling(sneerLeft: arViewModel.model.sneerLeft, sneerRight: arViewModel.model.sneerRight, squintLeft: arViewModel.model.squintLeft, squintRight: arViewModel.model.squintRight, shrugLower: arViewModel.model.shrugLower)))
                                    .padding(.horizontal, 15)
                                    .padding(.vertical, 5)
                                    .foregroundColor(arViewModel.isPersonScowling(sneerLeft: arViewModel.model.sneerLeft, sneerRight: arViewModel.model.sneerRight, squintLeft: arViewModel.model.squintLeft, squintRight: arViewModel.model.squintRight, shrugLower: arViewModel.model.shrugLower) ? .green : .red)
                                    .background(RoundedRectangle(cornerRadius: 8).fill(.regularMaterial).opacity(0.5))
                                    .shadow(radius: 4, y: 4)

                                
                            case .Surprise:
                                Text(arViewModel.surprisedChecker(isPersonScared: arViewModel.isPersonScowling(sneerLeft: arViewModel.model.sneerLeft, sneerRight: arViewModel.model.sneerRight, squintLeft: arViewModel.model.squintLeft, squintRight: arViewModel.model.squintRight, shrugLower: arViewModel.model.shrugLower)))
                                    .padding(.horizontal, 15)
                                    .padding(.vertical, 5)
                                    .foregroundColor(arViewModel.isPersonScared(wideLeft: arViewModel.model.wideLeft, wideRight: arViewModel.model.wideRight) ? .green : .red)
                                    .background(RoundedRectangle(cornerRadius: 8).fill(.regularMaterial).opacity(0.5))
                                    .shadow(radius: 4, y: 4)

                            case .Disgust:
                                Text(arViewModel.disgustChecker(isPersonDisgusted: arViewModel.isPersonDisgusted(sneerLeft: arViewModel.model.sneerLeft, sneerRight: arViewModel.model.sneerRight)))
                                    .padding(.horizontal, 15)
                                    .padding(.vertical, 5)
                                    .foregroundColor(arViewModel.isPersonDisgusted(sneerLeft: arViewModel.model.sneerLeft, sneerRight: arViewModel.model.sneerRight) ? .green : .red)
                                    .background(RoundedRectangle(cornerRadius: 8).fill(.regularMaterial).opacity(0.5))
                                    .shadow(radius: 4, y: 4)

                            }
                        }
                        
                        Button(action: {
                            withAnimation(.easeInOut(duration: 0.5)) {
                                showInfo = true
                            }
                        }) {
                            Image(systemName: "book.closed.fill")
                                .foregroundColor(.iconColor)
                                .font(.system(size: 26))
                                .frame(width: 28, height: 28)
                                .padding(.horizontal, 11)
                                .padding(.vertical, 6)
                        }
                        .background(RoundedRectangle(cornerRadius: 12).fill(.regularMaterial))
                        .shadow(radius: 4, y: 4)
                    }
                    .padding()
                    
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
        }
        .onAppear {
            isCameraShowing.toggle()
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

#if DEBUG
struct FRContentView_Previews : PreviewProvider {
    static var previews: some View {
        FRContentView()
    }
}
#endif
