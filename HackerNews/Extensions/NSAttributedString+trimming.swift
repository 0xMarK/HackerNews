//
//  NSAttributedString+trimming.swift
//  HackerNews
//
//  Created by Anton Kaliuzhnyi on 12.05.2021.
//

import Foundation

extension NSAttributedString {
    
    public func trimming(characterSet: CharacterSet) -> NSAttributedString {
        let attributedString = NSMutableAttributedString(attributedString: self)
        attributedString.trim(characterSet: characterSet)
        return attributedString
    }
    
}
