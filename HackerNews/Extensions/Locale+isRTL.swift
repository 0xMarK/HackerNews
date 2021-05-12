//
//  Locale+isRTL.swift
//  HackerNews
//
//  Created by Anton Kaliuzhnyi on 12.05.2021.
//

import Foundation

extension Locale {
    
    public var isRTL: Bool {
        guard let code = languageCode else {
            return false
        }
        return Locale.characterDirection(forLanguage: code) == .rightToLeft
    }
    
}
