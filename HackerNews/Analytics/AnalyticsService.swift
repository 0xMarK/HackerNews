//
//  AnalyticsService.swift
//  HackerNews
//
//  Created by Anton Kaliuzhnyi on 13.05.2021.
//

import Foundation

protocol AnalyticsService {
    
    func start()
    
    func track(_ event: AnalyticsEvent)
    
}
