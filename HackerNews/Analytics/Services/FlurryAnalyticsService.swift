//
//  FlurryAnalyticsService.swift
//  HackerNews
//
//  Created by Anton Kaliuzhnyi on 13.05.2021.
//

import FlurryAnalytics
import AnalyticsCenter

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
    
    let eventNameFormatter: AnalyticsEventNameFormatter?
    
    func start() {
        Flurry.startSession(apiKey, with: FlurrySessionBuilder
              .init()
              .withCrashReporting(isCrashReportingEnabled)
              .withLogLevel(FlurryLogLevel(UInt32(logLevel.rawValue))))
    }
    
    func track(_ event: AnalyticsEvent) {
        let name = eventNameFormatter?.format(event.name) ?? event.name
        Flurry.logEvent(name, withParameters: event.parameters)
    }
    
}
