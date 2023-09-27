//
//  NotificationType.swift
//  FaceReality
//
//  Created by mvitoriapereirac on 26/09/23.
//
import SwiftUI
import Foundation

enum NotificationType {
    case twoDays
    case oneWeek
    case twoWeeks
    
    var identifier: String {
        switch self {
        case .twoDays:
            return "twoDaysInactivityNotification"
        case .oneWeek:
            return "oneWeekInactivityNotification"
        case .twoWeeks:
            return "twoWeekInactivityNotification"
        }
    }
    
    var title: String {
        switch self {
        case .twoDays:
            return "Você não visita há dois dias"
        case .oneWeek:
            return "Já faz uma semana..."
        case .twoWeeks:
            return "Vai deixar pra última hora?"
        }
    }
    
    var body: String {
        switch self {
        case .twoDays:
            return "Estudar aqui é fácil!"
        case .oneWeek:
            return "Revise os conteúdos agora!"
        case .twoWeeks:
            return "Não deixe seu aprendizado de lado!"
        }
    }
    
    var timeInterval: TimeInterval {
        switch self {
        case .twoDays: //172800
            return 172800
        case .oneWeek: //604800
            return 604800
        case .twoWeeks: //1209600
            return 1209600
        }
    }
    
    var repeats: Bool {
        switch self {
        case .twoDays:
            return false
        case .oneWeek:
            return false
        case .twoWeeks:
            return true
        }
    }
    
    var sound: UNNotificationSound {
        switch self {
        case .twoDays:
            return .default
        case .oneWeek:
            return .default
        case .twoWeeks:
            return .default
        }
    }
    
    
}

