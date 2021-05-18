//
//  AnalyticsEventNameFormatter.swift
//  HackerNews
//
//  Created by Anton Kaliuzhnyi on 18.05.2021.
//

import Foundation

protocol AnalyticsEventNameFormatter {
    
    func format(_ name: String) -> String
    
}
