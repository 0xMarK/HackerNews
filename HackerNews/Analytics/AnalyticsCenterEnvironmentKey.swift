//
//  AnalyticsCenterEnvironmentKey.swift
//  HackerNews
//
//  Created by Anton Kaliuzhnyi on 13.05.2021.
//

import SwiftUI

struct AnalyticsCenterEnvironmentKey: EnvironmentKey {
    
    static let defaultValue: AnalyticsCenter = AnalyticsCenter()
    
}

extension EnvironmentValues {
    
    var analytics: AnalyticsCenter {
        get {
            return self[AnalyticsCenterEnvironmentKey.self]
        }
        set {
            self[AnalyticsCenterEnvironmentKey.self] = newValue
        }
    }
    
}
