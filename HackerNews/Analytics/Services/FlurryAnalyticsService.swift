//
//  FlurryAnalyticsService.swift
//  HackerNews
//
//  Created by Anton Kaliuzhnyi on 13.05.2021.
//

import FlurryAnalytics

struct FlurryAnalyticsService: AnalyticsService {
    
    enum LogLevel: Int {
        case none = 0
        case criticalOnly
        case debug
        case all
    }
    
    let apiKey: String
    
    let logLevel: LogLevel
    
    let isCrashReportingEnabled: Bool
    
    func start() {
        Flurry.startSession(apiKey, with: FlurrySessionBuilder
              .init()
              .withCrashReporting(isCrashReportingEnabled)
              .withLogLevel(FlurryLogLevel(UInt32(logLevel.rawValue))))
    }
    
    func track(_ event: AnalyticsEvent) {
        Flurry.logEvent(event.snakeCaseName, withParameters: event.parameters)
    }
    
}
