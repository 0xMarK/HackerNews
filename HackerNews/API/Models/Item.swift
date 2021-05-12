//
//  Item.swift
//  HackerNews
//
//  Created by Anton Kaliuzhnyi on 11.05.2021.
//

import Foundation

struct Item: Codable {
    
    let by: String
    let descendants: Int?
    let id: Int
    let kids: [Int]?
    let score: Int
    let text: String?
    let time: Int
    let title: String
    let type: String
    let url: String?
    
}
