//
//  APIEnvironmentKey.swift
//  HackerNews
//
//  Created by Anton Kaliuzhnyi on 11.05.2021.
//

import SwiftUI

struct APIEnvironmentKey: EnvironmentKey {
    
    static let defaultValue: API = API()
    
}

extension EnvironmentValues {
    
    var api: API {
        get {
            return self[APIEnvironmentKey.self]
        }
        set {
            self[APIEnvironmentKey.self] = newValue
        }
    }
    
}
