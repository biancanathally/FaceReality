//
//  AppDelegate.swift
//  FaceReality
//
//  Created by mvitoriapereirac on 26/09/23.
//

import UIKit
import SwiftUI

class AppDelegate: NSObject, UIApplicationDelegate {
    @ObservedObject var notificationManager = NotificationManager.shared

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        notificationManager.requestAuthorization()
        return true

    }
}

