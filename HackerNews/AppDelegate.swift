//
//  AppDelegate.swift
//  HackerNews
//
//  Created by Anton Kaliuzhnyi on 13.05.2021.
//

import UIKit
import FlurryAnalytics
import Mixpanel
import Firebase

class AppDelegate: NSObject, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        let firebaseOptions = FirebaseOptions(googleAppID: Configuration.Firebase.googleAppID, gcmSenderID: Configuration.Firebase.gcmSenderID)
        firebaseOptions.apiKey = Configuration.Firebase.apiKey
        firebaseOptions.projectID = Configuration.Firebase.projectID
        firebaseOptions.clientID = Configuration.Firebase.clientID
        firebaseOptions.storageBucket = Configuration.Firebase.storageBucket
        FirebaseApp.configure(options: firebaseOptions)
        Flurry.startSession(Configuration.Flurry.apiKey, with: FlurrySessionBuilder
              .init()
              .withCrashReporting(true)
              .withLogLevel(FlurryLogLevelAll))
        Mixpanel.initialize(token: Configuration.Mixpanel.apiToken)
        return true
    }
    
}
