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
    
    let analyticsCenter = AnalyticsCenter()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        analyticsCenter.add(FirebaseAnalyticsService(
            googleAppID: Configuration.Firebase.googleAppID,
            gcmSenderID: Configuration.Firebase.gcmSenderID,
            apiKey: Configuration.Firebase.apiKey,
            bundleID: nil,
            projectID: Configuration.Firebase.projectID,
            clientID: Configuration.Firebase.clientID,
            storageBucket: Configuration.Firebase.storageBucket,
            eventNameFormatter: EventNameFormatter(format: .snakeCase)
        ))
        analyticsCenter.add(FlurryAnalyticsService(
            apiKey: Configuration.Flurry.apiKey,
            logLevel: Configuration.Flurry.logLevel,
            isCrashReportingEnabled: Configuration.Flurry.isCrashReportingEnabled,
            eventNameFormatter: EventNameFormatter(format: .snakeCase)
        ))
        analyticsCenter.add(MixpanelAnalyticsService(
            apiToken: Configuration.Mixpanel.apiToken,
            eventNameFormatter: EventNameFormatter(format: .capitalized)
        ))
        analyticsCenter.start()
        return true
    }
    
}
