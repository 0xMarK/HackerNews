//
//  AnalyticsCenter.swift
//  HackerNews
//
//  Created by Anton Kaliuzhnyi on 13.05.2021.
//

import Foundation

class AnalyticsCenter {
    
    private(set) var services: [AnalyticsService] = []
    
    func add(_ service: AnalyticsService) {
        services.append(service)
    }
    
    func start() {
        services.forEach {
            $0.start()
        }
    }
    
    func track(_ event: AnalyticsEvent) {
        services.forEach {
            $0.track(event)
        }
    }
    
}
