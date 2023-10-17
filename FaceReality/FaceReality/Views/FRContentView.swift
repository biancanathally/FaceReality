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
            self.callback (view?.window)
        }
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
    }
}

struct FRContentView: View {
    @ObservedObject var arViewModel = ARViewModel.shared
    @State private var showInfo = false
    @State private var strokeArray = [true, false, false, false, false]
    @State private var isShowingContentDestinationView = false
    @Binding var showContent: Bool
    @Environment(\.dismiss) private var dismiss
    @State private var shouldShowCamera = false
    var dismissAction: () -> Void
    @State private var appStatus: AppStatus = .main
    @State private var showStepByStep = UserDefaults.standard.bool(forKey: UserDefaultsKeys.showStepByStep)
    @State private var stepOne = false
    @State private var stepTwo = false
    @State private var stepThree = false
    
    
    var body: some View {
        ZStack {
            //                ARViewContainer(arViewModel: arViewModel).edgesIgnoringSafeArea(.all)
            
            
            
            HStack {
                VStack(alignment: .center, spacing: 5) {
                    HStack(alignment: .top) { //spacing: 264.11
                        
                        Button(action: {
                            showContent = false
                            dismissAction()
                            appStatus = .start
                        }) {
                            Image(systemName: "house.fill")
                                .foregroundColor(.iconColor)
                                .font(Font.custom("SFProText-Bold", size: 20))
                            
                                .padding(.horizontal, 10)
                                .padding(.vertical, 8.5)
                        }
                        .background(RoundedRectangle(cornerRadius: 12).fill(.regularMaterial).opacity(0.3).shadow(radius: 4, y: 4))
//                        .shadow(radius: 4, y: 4)

                        
                        Spacer()
                        
                        VStack {
                            
                            switch arViewModel.emotions {
                            case .Joy:
                                Text(arViewModel.smileChecker(isSmiling: arViewModel.isPersonSmiling(smileLeft: arViewModel.model.smileLeft, smileRight: arViewModel.model.smileRight), isGenuineSmiling: arViewModel.isPersonGenuineSmiling(smileLeft: arViewModel.model.smileLeft, smileRight: arViewModel.model.smileRight, squintLeft: arViewModel.model.squintLeft, squintRight: arViewModel.model.squintRight)))
                                    .padding(.horizontal, 10)
                                    .padding(.vertical, 10)
                                    .foregroundColor(.white)
                                    .background(arViewModel.isPersonSmiling(smileLeft: arViewModel.model.smileLeft, smileRight: arViewModel.model.smileRight) ? RoundedRectangle(cornerRadius: 12).fill(.green).opacity(0.3) : RoundedRectangle(cornerRadius: 12).fill(.white).opacity(0.3))
                                    .foregroundColor(.white)
                                    .background(arViewModel.isPersonSmiling(smileLeft: arViewModel.model.smileLeft, smileRight: arViewModel.model.smileRight) ? RoundedRectangle(cornerRadius: 12).fill(.green).opacity(0.3) : RoundedRectangle(cornerRadius: 12).fill(.white).opacity(0.3))
                                    .shadow(radius: 4, y: 4)
                                
                            case .Sadness:
                                Text(arViewModel.sadnessChecker(isPersonFrowning: arViewModel.isPersonFrowning(browInnerUp: arViewModel.model.browInnerUp, mouthRollUpper: arViewModel.model.mouthRollUpper, frownLeft: arViewModel.model.frownLeft, frownRight: arViewModel.model.frownRight)))
                                    .padding(.horizontal, 10)
                                    .padding(.vertical, 10)
                                    .foregroundColor(.white)
                                    .background(arViewModel.isPersonFrowning(browInnerUp: arViewModel.model.browInnerUp, mouthRollUpper: arViewModel.model.mouthRollUpper, frownLeft: arViewModel.model.frownLeft, frownRight: arViewModel.model.frownRight) ? RoundedRectangle(cornerRadius: 12).fill(.green).opacity(0.3) : RoundedRectangle(cornerRadius: 12).fill(.white).opacity(0.3))
                                    .shadow(radius: 4, y: 4)
                                
                            case .Rage:
                                Text(arViewModel.scowlChecker(isPersonScowling: arViewModel.isPersonScowling(sneerLeft: arViewModel.model.sneerLeft, sneerRight: arViewModel.model.sneerRight, squintLeft: arViewModel.model.squintLeft, squintRight: arViewModel.model.squintRight, shrugLower: arViewModel.model.shrugLower, smileLeft: arViewModel.model.smileLeft, smileRight: arViewModel.model.smileRight)))
                                    .padding(.horizontal, 10)
                                    .padding(.vertical, 10)
                                    .foregroundColor(.white)
                                    .background(arViewModel.isPersonScowling(sneerLeft: arViewModel.model.sneerLeft, sneerRight: arViewModel.model.sneerRight, squintLeft: arViewModel.model.squintLeft, squintRight: arViewModel.model.squintRight, shrugLower: arViewModel.model.shrugLower, smileLeft: arViewModel.model.smileLeft, smileRight: arViewModel.model.smileRight) ? RoundedRectangle(cornerRadius: 12).fill(.green).opacity(0.3) : RoundedRectangle(cornerRadius: 12).fill(.white).opacity(0.3))
                                    .shadow(radius: 4, y: 4)
                                
                            case .Surprise:
                                Text(arViewModel.surprisedChecker(isPersonScared: arViewModel.isPersonScared(wideLeft: arViewModel.model.wideLeft, wideRight: arViewModel.model.wideRight)))
                                    .padding(.horizontal, 10)
                                    .padding(.vertical, 10)
                                    .foregroundColor(.white)
                                    .background(arViewModel.isPersonScared(wideLeft: arViewModel.model.wideLeft, wideRight: arViewModel.model.wideRight) ? RoundedRectangle(cornerRadius: 12).fill(.green).opacity(0.3) : RoundedRectangle(cornerRadius: 12).fill(.white).opacity(0.3))
                                    .shadow(radius: 4, y: 4)
                                
                            case .Disgust:
                                Text(arViewModel.disgustChecker(isPersonDisgusted: arViewModel.isPersonDisgusted(sneerLeft: arViewModel.model.sneerLeft, sneerRight: arViewModel.model.sneerRight)))
                                    .padding(.horizontal, 10)
                                    .padding(.vertical, 10)
                                    .foregroundColor(.white)
                                    .background(arViewModel.isPersonDisgusted(sneerLeft: arViewModel.model.sneerLeft, sneerRight: arViewModel.model.sneerRight) ? RoundedRectangle(cornerRadius: 12).fill(.green).opacity(0.3) : RoundedRectangle(cornerRadius: 12).fill(.white).opacity(0.3))
                                    .shadow(radius: 4, y: 4)
                            }
                        }
                        
                        Spacer()
                        HStack(spacing: 20) {
                            
//                            Button(action: {
//                                withAnimation(.easeInOut(duration: 0.5)) {
//                                    showInfo = true
//                                }
//                            }) {
//                                Image(systemName: "book.closed.fill")
//                                    .foregroundColor(.iconColor)
//                                    .padding(.horizontal, 10)
//                                    .padding(.vertical, 8.5)
//                            }
//                            .background(RoundedRectangle(cornerRadius: 12).fill(.regularMaterial).opacity(0.3))
//                            .shadow(radius: 4, y: 4)
                            
                            
                            VStack {
                                Button(action: {
                                    Unity.shared.show()
                                }, label: {
                                    
//                                    VStack(spacing: 0) {
                                        Image("icon3d")
                                            .resizable()
                                            .frame(width: 50, height: 86)
//                                            .font(Font.custom("SFProText-Bold", size: 20))
//                                            .foregroundColor(.iconColor)
                                            .shadow(radius: 6, y: 4)
//
//                                            .padding(.horizontal, 10)
//                                            .padding(.vertical, 8.5)
//                                        Text("3D")
//                                            .foregroundColor(.iconColor)
//                                            .font(Font.custom("SFProText-Bold", size: 14))
//                                            .padding(.horizontal, 10)
//                                            .padding(.vertical, 8.5)
//                                            .background(RoundedRectangle(cornerRadius: 12).fill(.regularMaterial).opacity(0.3))
//                                            .shadow(radius: 4, y: 4)
//                                    }
//                                    .padding(.bottom, 5)
//                                    .background(RoundedRectangle(cornerRadius: 12).fill(.regularMaterial).opacity(0.3))
                                    
                                    
                                })
                            }.background(
                                HostingWindowFinder { window in
                                    Unity.shared.setHostMainWindow(window)
                                }
                            )
                            
                        }
                    }
                    .padding()
                    
                    VStack {

                        switch arViewModel.emotions {
                        case .Joy:
                            Text(arViewModel.smileChecker(isSmiling: arViewModel.isPersonSmiling(smileLeft: arViewModel.model.smileLeft, smileRight: arViewModel.model.smileRight), isGenuineSmiling: arViewModel.isPersonGenuineSmiling(smileLeft: arViewModel.model.smileLeft, smileRight: arViewModel.model.smileRight, squintLeft: arViewModel.model.squintLeft, squintRight: arViewModel.model.squintRight)))
                                .padding(.horizontal, 10)
                                .padding(.vertical, 10)
                                .foregroundColor(.white/*arViewModel.isSmiling ? .green : .red*/)
                                .background(arViewModel.isPersonSmiling(smileLeft: arViewModel.model.smileLeft, smileRight: arViewModel.model.smileRight) ? RoundedRectangle(cornerRadius: 12).fill(.green).opacity(0.3) : RoundedRectangle(cornerRadius: 12).fill(.white).opacity(0.3))
                                .foregroundColor(.white)
                                .background(arViewModel.isPersonSmiling(smileLeft: arViewModel.model.smileLeft, smileRight: arViewModel.model.smileRight) ? RoundedRectangle(cornerRadius: 12).fill(.green).opacity(0.3) : RoundedRectangle(cornerRadius: 12).fill(.white).opacity(0.3))
                                .shadow(radius: 4, y: 4)
                            
                        case .Sadness:
                            Text(arViewModel.sadnessChecker(isPersonFrowning: arViewModel.isPersonFrowning(browInnerUp: arViewModel.model.browInnerUp, mouthRollUpper: arViewModel.model.mouthRollUpper, frownLeft: arViewModel.model.frownLeft, frownRight: arViewModel.model.frownRight)))
                                .padding(.horizontal, 10)
                                .padding(.vertical, 10)
                                .foregroundColor(.white)
                                .background(arViewModel.isPersonFrowning(browInnerUp: arViewModel.model.browInnerUp, mouthRollUpper: arViewModel.model.mouthRollUpper, frownLeft: arViewModel.model.frownLeft, frownRight: arViewModel.model.frownRight) ? RoundedRectangle(cornerRadius: 12).fill(.green).opacity(0.3) : RoundedRectangle(cornerRadius: 12).fill(.white).opacity(0.3))
                                .shadow(radius: 4, y: 4)
                            
                        case .Rage:
                            Text(arViewModel.scowlChecker(isPersonScowling: arViewModel.isPersonScowling(sneerLeft: arViewModel.model.sneerLeft, sneerRight: arViewModel.model.sneerRight, squintLeft: arViewModel.model.squintLeft, squintRight: arViewModel.model.squintRight, shrugLower: arViewModel.model.shrugLower)))
                                .padding(.horizontal, 10)
                                .padding(.vertical, 10)
                                .foregroundColor(.white)
                                .background(arViewModel.isPersonScowling(sneerLeft: arViewModel.model.sneerLeft, sneerRight: arViewModel.model.sneerRight, squintLeft: arViewModel.model.squintLeft, squintRight: arViewModel.model.squintRight, shrugLower: arViewModel.model.shrugLower) ? RoundedRectangle(cornerRadius: 12).fill(.green).opacity(0.3) : RoundedRectangle(cornerRadius: 12).fill(.white).opacity(0.3))
                                .shadow(radius: 4, y: 4)
                            
                        case .Surprise:
                            Text(arViewModel.surprisedChecker(isPersonScared: arViewModel.isPersonScared(wideLeft: arViewModel.model.wideLeft, wideRight: arViewModel.model.wideRight)))
                                .padding(.horizontal, 10)
                                .padding(.vertical, 10)
                                .foregroundColor(.white)
                                .background(arViewModel.isPersonScared(wideLeft: arViewModel.model.wideLeft, wideRight: arViewModel.model.wideRight) ? RoundedRectangle(cornerRadius: 12).fill(.green).opacity(0.3) : RoundedRectangle(cornerRadius: 12).fill(.white).opacity(0.3))
                                .shadow(radius: 4, y: 4)
                            
                        case .Disgust:
                            Text(arViewModel.disgustChecker(isPersonDisgusted: arViewModel.isPersonDisgusted(sneerLeft: arViewModel.model.sneerLeft, sneerRight: arViewModel.model.sneerRight)))
                                .padding(.horizontal, 10)
                                .padding(.vertical, 10)
                                .foregroundColor(.white)
                                .background(arViewModel.isPersonDisgusted(sneerLeft: arViewModel.model.sneerLeft, sneerRight: arViewModel.model.sneerRight) ? RoundedRectangle(cornerRadius: 12).fill(.green).opacity(0.3) : RoundedRectangle(cornerRadius: 12).fill(.white).opacity(0.3))
                                .shadow(radius: 4, y: 4)
                        }
                    }
                    
                
                    
                    Spacer()
                    
                    VStack(spacing: 6.45) {
                        HStack(spacing: 65) {
                            // smile 1
                            VStack {
                                if strokeArray[0] == true {
                                    if showInfo == false {
                                        Button(action: {
                                            withAnimation(.easeInOut(duration: 0.2)) {
                                                showInfo = true
                                            }
                                        }) {
                                            Image(systemName: "chevron.up")
                                                .foregroundColor(.white)
                                                .font(Font.custom("SFProText-Bold", size: 30))
                                        }
                                    }
                                    
                                    if showInfo == true {
                                        Button(action: {
                                            withAnimation(.easeInOut(duration: 0.2)) {
                                                showInfo = false
                                            }
                                        }) {
                                            Image(systemName: "chevron.down")
                                                .foregroundColor(.white)
                                                .font(Font.custom("SFProText-Bold", size: 30))
                                        }
                                    }
                                }
                            }
                            
                            // sad 2
                            VStack {
                                if strokeArray[1] == true {
                                    if showInfo == false {
                                        Button(action: {
                                            withAnimation(.easeInOut(duration: 0.2)) {
                                                showInfo = true
                                            }
                                        }) {
                                            
                                            Image(systemName: "chevron.up")
                                                .foregroundColor(.white)
                                                .font(Font.custom("SFProText-Bold", size: 30))
                                        }
                                    }
                                    
                                    if showInfo == true {
                                        Button(action: {
                                            withAnimation(.easeInOut(duration: 0.2)) {
                                                showInfo = false
                                            }
                                        }) {
                                            Image(systemName: "chevron.down")
                                                .foregroundColor(.white)
                                                .font(Font.custom("SFProText-Bold", size: 30))
                                        }
                                    }
                                }
                            }
                            
                            // angry 4
                            VStack {
                                if strokeArray[3] == true {
                                    if showInfo == false {
                                        Button(action: {
                                            withAnimation(.easeInOut(duration: 0.2)) {
                                                showInfo = true
                                            }
                                        }) {
                                            Image(systemName: "chevron.up")
                                                .foregroundColor(.white)
                                                .font(Font.custom("SFProText-Bold", size: 30))
                                        }
                                    }
                                    
                                    if showInfo == true {
                                        Button(action: {
                                            withAnimation(.easeInOut(duration: 0.2)) {
                                                showInfo = false
                                            }
                                        }) {
                                            Image(systemName: "chevron.down")
                                                .foregroundColor(.white)
                                                .font(Font.custom("SFProText-Bold", size: 30))
                                        }
                                    }
                                }
                            }
                            
                            // surprise 3
                            VStack {
                                if strokeArray[2] == true {
                                    if showInfo == false {
                                        Button(action: {
                                            withAnimation(.easeInOut(duration: 0.2)) {
                                                showInfo = true
                                            }
                                        }) {
                                            Image(systemName: "chevron.up")
                                                .foregroundColor(.white)
                                                .font(Font.custom("SFProText-Bold", size: 30))
                                        }
                                    }
                                    
                                    if showInfo == true {
                                        Button(action: {
                                            withAnimation(.easeInOut(duration: 0.2)) {
                                                showInfo = false
                                            }
                                        }) {
                                            Image(systemName: "chevron.down")
                                                .foregroundColor(.white)
                                                .font(Font.custom("SFProText-Bold", size: 30))
                                        }
                                    }
                                }
                            }
                            
                            // disgust 5
                            VStack {
                                if strokeArray[4] == true {
                                    if showInfo == false {
                                        Button(action: {
                                            withAnimation(.easeInOut(duration: 0.2)) {
                                                showInfo = true
                                            }
                                        }) {
                                            Image(systemName: "chevron.up")
                                                .foregroundColor(.white)
                                                .font(Font.custom("SFProText-Bold", size: 30))
                                        }
                                    }
                                    
                                    if showInfo == true {
                                        Button(action: {
                                            withAnimation(.easeInOut(duration: 0.2)) {
                                                showInfo = false
                                            }
                                        }) {
                                            Image(systemName: "chevron.down")
                                                .foregroundColor(.white)
                                                .font(Font.custom("SFProText-Bold", size: 30))
                                        }
                                    }
                                }
                            }
                        }
                        
                        HStack(spacing: 15) {
                            VStack {
                                Button(action: {
                                    arViewModel.emotions = .Joy
                                    
//                                    if strokeArray[0] == false {
                                        strokeArray = [true, false, false, false, false]
                                        
//                                    }
//                                    else {
//                                        strokeArray[0] = false
//                                    }
                                    
                                }) {
                                    Image(strokeArray[0] ? "Smiley face" : "smile.stroke")
                                        .foregroundColor(.white)
                                        .font(.system(size: 60))
                                }
                                
                                if strokeArray[0] {
                                    Text("happy-string")
                                        .foregroundColor(.white)
                                        .font(Font.custom("SFProText-Medium", size: 12))
                                }
                            }
                            
                            VStack {
                                Button(action: {
                                    arViewModel.emotions = .Sadness
                                    
//                                    if strokeArray[1] == false {
                                        strokeArray = [false, true, false, false, false]
                                        
//                                    } else {
//                                        strokeArray[1] = false
//                                    }
                                }) {
                                    Image(strokeArray[1] ? "Sad face": "sad.stroke")
                                        .foregroundColor(.white)
                                        .font(.system(size: 60))
                                }
                                
                                if strokeArray[1] {
                                    Text("sad-string")
                                        .foregroundColor(.white)
                                        .font(Font.custom("SFProText-Medium", size: 12))
                                }
                            }
                            
                            VStack {
                                Button(action: {
                                    arViewModel.emotions = .Surprise
                                    
//                                    if strokeArray[3] == false {
                                        strokeArray = [false, false, false, true, false]
                                        
//                                    } else {
//                                        strokeArray[3] = false
//                                    }
                                }) {
                                    Image(strokeArray[3] ? "Surprised face": "surprise.stroke")
                                        .foregroundColor(.white)
                                        .font(.system(size: 60))
                                }
                                
                                if strokeArray[3] {
                                    Text("surprised-string")
                                        .foregroundColor(.white)
                                        .font(Font.custom("SFProText-Medium", size: 12))
                                }
                            }
                            
                            VStack {
                                Button(action: {
                                    arViewModel.emotions = .Rage
                                    
//                                    if strokeArray[2] == false {
                                        strokeArray = [false, false, true, false, false]
                                        
//                                    } else {
//                                        strokeArray[2] = false
//                                    }
                                }) {
                                    Image(strokeArray[2] ? "Angry face": "anger.stroke")
                                        .foregroundColor(.white)
                                        .font(.system(size: 60))
                                }
                                
                                if strokeArray[2] {
                                    Text("angry-string")
                                        .foregroundColor(.white)
                                        .font(Font.custom("SFProText-Medium", size: 12))
                                }
                            }
                            
                            VStack {
                                Button(action: {
                                    arViewModel.emotions = .Disgust
//                                    if strokeArray[4] == false {
                                        strokeArray = [false, false, false, false, true]
                                        
//                                    } else {
//                                        strokeArray[4] = false
//                                    }
                                }) {
                                    Image(strokeArray[4] ? "Disgust face" : "disgust.stroke")
                                        .foregroundColor(.white)
                                        .font(.system(size: 60))
                                }
                                
                                if strokeArray[4] {
                                    Text("disgust-string")
                                        .foregroundColor(.white)
                                        .font(Font.custom("SFProText-Medium", size: 12))
                                }
                            }
                        }
                        .padding(.all)
                        .shadow(radius: 4, y: 4)
                        .background(RoundedRectangle(cornerRadius: 20).fill(.regularMaterial).opacity(0.5).shadow(radius: 4, y: 4))
                    }
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
            
            if showStepByStep {
                
                Color.black.ignoresSafeArea(.all).opacity(0.3)
                    .onAppear {
                        stepOne = true
                    }
                        .onTapGesture {
                            if stepOne {
                                UserDefaults.standard.set(false, forKey: UserDefaultsKeys.showStepByStep)
                                stepOne = false
                                stepTwo = true
                                print("tocou 1")
                            } else
                            
                            if stepTwo {
                                stepTwo = false
                                stepThree = true
                            } else
                            if stepThree {
                                stepThree = false
                                showStepByStep = false

                            }
                        }

                    
                VStack {
                    
                    if stepOne {
                        PopupView(dismissAction: {}, titleText: String(localized: "steponetitle-string"), bodyText: String(localized: "steponebody-string"), isReference: false, buttonLabel: "", imageIllustration: "stepOne", isOnboardingSteps: true)
                            .padding(.top, 88)

                            .onTapGesture {
                                UserDefaults.standard.set(false, forKey: UserDefaultsKeys.showStepByStep)
                                stepOne = false
                                stepTwo = true
                                
                    }
                        Spacer()
                    }
                    
                    if stepTwo {
                        VStack {
                            PopupView(dismissAction: {}, titleText: String(localized: "steptwotitle-string"), bodyText: String(localized: "steptwobody-string"), isReference: false, buttonLabel: "", imageIllustration: "stepTwo", isOnboardingSteps: true)
                                .padding(.top, 372)
                            
                                .onTapGesture {
                                    stepTwo = false
                                    stepThree = true
                                }
                        }
                    }

                    if stepThree {
                        VStack {
                            PopupView(dismissAction: {}, titleText: String(localized: "stepthreetitle-string"), bodyText: String(localized: "stepthreebody-string"), isReference: false, buttonLabel: "", imageIllustration: "stepThree", isOnboardingSteps: true)
                                .padding(.top, 372)
                            
                                .onTapGesture {
                                    stepThree = false
                                    showStepByStep = false
                                }
                        }
                        
                    }


                    }
           
                
            }
            
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5, execute: {
                shouldShowCamera = true
                
            })
        }
    }
}

struct IntermadiateViewFromFRToContent: View {
    @State var shouldShow = false
    
    var body: some View {
        if shouldShow {
            ContentView(dismissAction: {})
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
    
    func updateUIView(_ uiView: ARView, context: Context) {
    }
}
