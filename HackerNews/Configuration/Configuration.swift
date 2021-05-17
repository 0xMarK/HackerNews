//
//  Configuration.swift
//  HackerNews
//
//  Created by Anton Kaliuzhnyi on 13.05.2021.
//

import Foundation

enum Configuration {
    
    enum Firebase {
        static let googleAppID = "1:390XXXXX009:ios:5005XXXXXXXXXXXXXXd1c0"
        static let gcmSenderID = "390XXXXX009"
        static let apiKey = "AIzaXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXUeGw"
        static let projectID = "hackernews-XXXXX"
        static let clientID = "390XXXXX009-5r15XXXXXXXXXXXXXXXXXXXXXXX34btf.apps.googleusercontent.com"
        static let storageBucket = "hackernews-XXXXX.appspot.com"
    }
    
    enum Flurry {
        static let apiKey = "BF6MXXXXXXXXXXXXWP75"
        static let isCrashReportingEnabled = true
        static let logLevel = FlurryAnalyticsService.LogLevel.criticalOnly
    }
    
    enum Mixpanel {
        static let apiToken = "61b9XXXXXXXXXXXXXXXXXXXXXXXX62f9"
    }
    
}
