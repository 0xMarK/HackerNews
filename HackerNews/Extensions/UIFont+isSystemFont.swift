//
//  UIFont+isSystemFont.swift
//  HackerNews
//
//  Created by Anton Kaliuzhnyi on 12.05.2021.
//

import UIKit

extension UIFont {
    
    public var isSystemFont: Bool { familyName == UIFont.systemFont(ofSize: pointSize).familyName }
    
}
