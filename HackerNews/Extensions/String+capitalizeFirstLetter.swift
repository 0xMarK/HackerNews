//
//  String+capitalizeFirstLetter.swift
//  HackerNews
//
//  Created by Anton Kaliuzhnyi on 17.05.2021.
//

import Foundation

extension String {
    
    var firstLetterCapitalized: String {
        return prefix(1).capitalized + dropFirst()
    }
    
    mutating func capitalizeFirstLetter() {
        self = self.firstLetterCapitalized
    }
    
}
