//
//  UIColor+hex.swift
//  HackerNews
//
//  Created by Anton Kaliuzhnyi on 12.05.2021.
//

import UIKit

extension UIColor {
    
    public var hexString: String {
        guard let components = cgColor.components else { fatalError() }
        let r = components[0]
        let g = components[1]
        let b = components[2]
        return String(format: "%02X%02X%02X", (Int)(r * 255), (Int)(g * 255), (Int)(b * 255))
    }
    
}
