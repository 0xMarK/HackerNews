//
//  NSMutableAttributedString+trim.swift
//  HackerNews
//
//  Created by Anton Kaliuzhnyi on 12.05.2021.
//

import Foundation

extension NSMutableAttributedString {
    
    public func trim(characterSet: CharacterSet) {
        var range = (string as NSString).rangeOfCharacter(from: characterSet as CharacterSet)
        
        // Trim leading characters from character set.
        while range.length != 0 && range.location == 0 {
            replaceCharacters(in: range, with: "")
            range = (string as NSString).rangeOfCharacter(from: characterSet)
        }
        
        // Trim trailing characters from character set.
        range = (string as NSString).rangeOfCharacter(from: characterSet, options: .backwards)
        while range.length != 0 && NSMaxRange(range) == length {
            replaceCharacters(in: range, with: "")
            range = (string as NSString).rangeOfCharacter(from: characterSet, options: .backwards)
        }
    }
    
}
