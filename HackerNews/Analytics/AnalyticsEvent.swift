//
//  AnalyticsEvent.swift
//  HackerNews
//
//  Created by Anton Kaliuzhnyi on 13.05.2021.
//

import Foundation

protocol AnalyticsEvent {
    
    var name: String { get }
    var parameters: [String: Any] { get }
    
}
