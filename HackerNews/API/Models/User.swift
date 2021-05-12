//
//  User.swift
//  HackerNews
//
//  Created by Anton Kaliuzhnyi on 12.05.2021.
//

import Foundation

struct User: Codable {
    
    let about: String
    let created : Int
    let id: String
    let karma: Int
    let submitted: [Int]
    
}
