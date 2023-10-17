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
            return String(localized: "twodaynotiftitle-string")
        case .oneWeek:
            return String(localized: "oneweeknotiftitle-string")
        case .twoWeeks:
            return String(localized:"twoweeknotiftitle-string")
        }
    }
    
    var body: String {
        switch self {
        case .twoDays:
            return String(localized:"twodaynotifbody-string")
        case .oneWeek:
            return String(localized:"oneweeknotifbody-string")
        case .twoWeeks:
            return String(localized:"twoweeknotifbody-string")
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

