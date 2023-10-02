//
//  ARViewModel.swift
//  Face Reality
//
//  Created by livia on 21/07/23.
//

import Foundation
import RealityKit
import SwiftUI
import ARKit

class ARViewModel: UIViewController, ObservableObject, ARSessionDelegate {
    @Published var model : ARModel = ARModel()
    @Published var emotions: Emotions = .Joy
    @Published var smileMuscles: SmileMuscles = SmileMuscles()
//    @Published var genuineSmileMuscles = GenuineSmileMuscles()
    @Published var sadnessMuscles: SadnessMuscles = SadnessMuscles()
    @Published var angerMuscles: AngerMuscles = AngerMuscles()
    @Published var surpriseMuscles: SurpriseMuscles = SurpriseMuscles()
    @Published var disgustMuscles: DisgustMuscles = DisgustMuscles()



    
    func startSessionDelegate() {
        model.arView.session.delegate = self
        
    }
    
    func session(_ session: ARSession, didUpdate anchors: [ARAnchor]) {
        if let faceAnchor = anchors.first as? ARFaceAnchor {
            model.update(faceAnchor: faceAnchor)
        }
    }
    
    var arView : ARView {
        model.arView
    }
    
//    var isSmiling: Bool {
//        var smileHelper = false
//        if model.smileLeft > 0.3 || model.smileRight > 0.3 {
//            smileHelper = true
//        }
//        return smileHelper
//
//    }
    
    func isPersonSmiling(smileLeft: Float, smileRight: Float) -> Bool {
        if smileLeft > 0.3 || smileRight > 0.3 {
            return true
        }
        return false
    }
    
//    var genuineSmiling: Bool {
//        var genSmileHelper = false
//        if model.smileLeft > 0.3 && model.smileRight > 0.3 && model.squintLeft > 0.15 && model.squintRight > 0.15 {
//            genSmileHelper = true
//        }
//        return genSmileHelper
//    }
    
    func isPersonGenuineSmiling(smileLeft: Float, smileRight: Float, squintLeft: Float, squintRight: Float) -> Bool {
        if smileLeft > 0.3 && smileRight > 0.3 && squintLeft > 0.15 && squintRight > 0.15 {
            return true
        }
       return false
    }
    
//    var isScowling: Bool {
//        var scowlHelper = false
//        if model.sneerLeft > 0.17 && model.sneerRight > 0.17 && model.squintLeft > 0.05 && model.squintRight > 0.05 || model.shrugLower > 0.3 {
//
//            scowlHelper = true
//        }
//        
//        return scowlHelper
//    }
    
    func isPersonScowling(sneerLeft: Float, sneerRight: Float, squintLeft: Float, squintRight: Float, shrugLower: Float) -> Bool {
        if sneerLeft > 0.17 && sneerRight > 0.17 && squintLeft > 0.05 && squintRight > 0.05 || shrugLower > 0.3 {

            return true
        }
        return false
    }
    
//    var isScared: Bool {
//        var scaredHelper = false
//        if model.wideLeft > 0.3 && model.wideRight > 0.3 {
//
//            scaredHelper = true
//        }
//
//        return scaredHelper
//    }
    
    func isPersonScared(wideLeft: Float, wideRight: Float) -> Bool {
        if wideLeft > 0.3 && wideRight > 0.3 {
            
            return true
        }
        return false
    }
    
//    var isDisgusted: Bool {
//        var disgustedHelper = false
//        if model.sneerLeft > 0.2 && model.sneerRight > 0.2 {
//            
//            disgustedHelper = true
//        }
//        
//        return disgustedHelper
//    }
    
    func isPersonDisgusted(sneerLeft: Float, sneerRight: Float) -> Bool {
        if sneerLeft > 0.2 && sneerRight > 0.2 {
            
            return true
        }
        return false
    }
    
//    var isFrowning: Bool {
//        var frownHelper = false
//        if model.browInnerUp > 0.2 || model.mouthRollUpper > 0.2 || model.frownLeft > 0.2 || model.frownRight > 0.2 {
//
//            frownHelper = true
//        }
//
//        return frownHelper
//    }
    
    func isPersonFrowning(browInnerUp: Float, mouthRollUpper: Float, frownLeft: Float, frownRight: Float) -> Bool {
       if browInnerUp > 0.2 || mouthRollUpper > 0.2 || frownLeft > 0.2 || frownRight > 0.2 {
           
           return true
       }
        return false
    }
    
    
    
    func smileChecker(isSmiling: Bool, isGenuineSmiling: Bool) -> String {
        if isSmiling {
            if isGenuineSmiling {
                return "Sorriso genuíno! 🤩"
            }
            else {
                return "Sorrindo 😊"
            }
        }
        else {
            return "Neutro 😐"
        }
    }
    
    func sadnessChecker(isPersonFrowning: Bool) -> String {
        if isPersonFrowning {
            return "Tristeza 😭"
        }
        else {
            return "Neutro 😐"
        }
    }
    
    func scowlChecker(isPersonScowling: Bool) -> String {
        if isPersonScowling {
            return "Raiva! 😡"
        }
        else {
            return "Neutro 😐"
            
        }
    }
    
    func surprisedChecker(isPersonScared: Bool) -> String {
        if isPersonScared {
            return "Surpresa! 😮"
        }
        return "Neutro 😐"
        
    }
    
    func disgustChecker(isPersonDisgusted: Bool) -> String {
        if isPersonDisgusted {
            return "Nojo! 🥴"
        }
        return "Neutro 😐"
    }
}
