//
//  String+HTML.swift
//  HackerNews
//
//  Created by Anton Kaliuzhnyi on 12.05.2021.
//

import UIKit

extension String {
    
    public func htmlMutableAttributed(defaultFont font: UIFont? = nil, defaultTextColor color: UIColor? = nil, lineHeight: Float? = nil) -> NSMutableAttributedString? {
        guard let htmlAttributed = htmlAttributed(defaultFont: font, defaultTextColor: color, lineHeight: lineHeight) else {
            return nil
        }
        return NSMutableAttributedString(attributedString: htmlAttributed)
    }
    
    public func htmlAttributed(defaultFont font: UIFont? = nil, defaultTextColor color: UIColor? = nil, lineHeight: Float? = nil) -> NSAttributedString? {
        let fontFamily: String
        if let font = font, !font.isSystemFont {
            fontFamily = "'\(font.fontName)', -apple-system"
        } else {
            fontFamily = "-apple-system"
        }
        
        let fontSizeDeclaration: String
        if let font = font {
            fontSizeDeclaration = "font-size: \(font.pointSize)px; "
        } else {
            fontSizeDeclaration = ""
        }
        
        let colorDeclaration: String
        if let color = color {
            colorDeclaration = "color: #\(color.hexString); "
        } else {
            colorDeclaration = ""
        }
        
        let lineHeightDeclation: String
        if let lineHeight = lineHeight {
            lineHeightDeclation = "line-height: \(lineHeight); "
        } else {
            lineHeightDeclation = ""
        }
        
        let direction: String
        if Locale.current.isRTL {
            direction = "html { direction: rtl; } "
        } else {
            direction = ""
        }
        
        let htmlCSSString =
            "<style> " +
                direction +
                "html * " +
                "{ " +
                "font-family: \(fontFamily); " +
                fontSizeDeclaration +
                colorDeclaration +
                lineHeightDeclation +
                "} " +
        "</style> \(self)"
        
        return htmlCSSString.htmlAttributed
    }
    
    private var htmlAttributed: NSAttributedString? {
        htmlAttributedAndDocumentAttributes.0?.trimming(characterSet: .whitespacesAndNewlines)
    }
    
    /// There is the last parameter `documentAttributes`.
    /// This parameter works by reference (not by value) and at the end of the function
    /// it is populated with some useful information about attributed text that has just been created.
    /// These data can be useful to know the actual screen rendering area and other service information
    /// that would otherwise be difficult to retrieve.
    private var htmlAttributedAndDocumentAttributes: (NSAttributedString?, NSDictionary?) {
        do {
            guard let data = data(using: .utf8) else {
                return (nil, nil)
            }
            let options: [NSAttributedString.DocumentReadingOptionKey: Any] = [
                .documentType: NSAttributedString.DocumentType.html,
                .characterEncoding: String.Encoding.utf8.rawValue
            ]
            var dict: NSDictionary? = NSMutableDictionary()
            return try (NSAttributedString(data: data,
                                           options: options,
                                           documentAttributes: &dict), dict)
        } catch {
            print("Error: ", error)
            return (nil, nil)
        }
    }
    
}
