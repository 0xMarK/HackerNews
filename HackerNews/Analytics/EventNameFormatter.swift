//
//  EventNameFormatter.swift
//  HackerNews
//
//  Created by Anton Kaliuzhnyi on 18.05.2021.
//

import Foundation

class EventNameFormatter: AnalyticsEventNameFormatter {
    
    enum Format {
        case camelCase
        case capitalizedCamelCase
        case snakeCase
        case capitalizedSnakeCase
        case upperSnakeCase
        case kebabCase
        case capitalizedKebabCase
        case upperKebabCase
        case capitalized
        case sentence
    }
    
    let format: Format
    
    init(format: Format) {
        self.format = format
    }
    
    func format(_ name: String) -> String {
        let words = words(from: name)
        var result = ""
        switch format {
        case .camelCase:
            for (i, w) in words.enumerated() {
                if i == 0 {
                    result = w.lowercased()
                } else {
                    result += capitalizeFirstLetter(w)
                }
            }
        case .capitalizedCamelCase:
            for w in words {
                result += capitalizeFirstLetter(w)
            }
        case .snakeCase:
            for (i, w) in words.enumerated() {
                if i == 0 {
                    result = w.lowercased()
                } else {
                    result += "_" + w.lowercased()
                }
            }
        case .capitalizedSnakeCase:
            for (i, w) in words.enumerated() {
                if i == 0 {
                    result = capitalizeFirstLetter(w)
                } else {
                    result += "_" + capitalizeFirstLetter(w)
                }
            }
        case .upperSnakeCase:
            for (i, w) in words.enumerated() {
                if i == 0 {
                    result = w.uppercased()
                } else {
                    result += "_" + w.uppercased()
                }
            }
        case .kebabCase:
            for (i, w) in words.enumerated() {
                if i == 0 {
                    result = w.lowercased()
                } else {
                    result += "-" + w.lowercased()
                }
            }
        case .capitalizedKebabCase:
            for (i, w) in words.enumerated() {
                if i == 0 {
                    result = capitalizeFirstLetter(w)
                } else {
                    result += "-" + capitalizeFirstLetter(w)
                }
            }
        case .upperKebabCase:
            for (i, w) in words.enumerated() {
                if i == 0 {
                    result = w.uppercased()
                } else {
                    result += "-" + w.uppercased()
                }
            }
        case .capitalized:
            for (i, w) in words.enumerated() {
                if i == 0 {
                    result = capitalizeFirstLetter(w)
                } else {
                    result += " " + capitalizeFirstLetter(w)
                }
            }
        case .sentence:
            for (i, w) in words.enumerated() {
                if i == 0 {
                    result = capitalizeFirstLetter(w)
                } else {
                    result += " " + w.lowercased()
                }
            }
        }
        return result
    }
    
    private func words(from string: String) -> [String] {
        let stringTrimmed = string.trimmingCharacters(in: .whitespacesAndNewlines)
        var words: [String] = []
        if stringTrimmed.contains("_"),
            let snakeCaseRange = stringTrimmed.range(of: #"^\S+(_\S+)*$"#, options: .regularExpression) { // #"^\w+(_\w+)*$"#
            words = String(stringTrimmed[snakeCaseRange])
                .replacingOccurrences(of: #"[_\W]+"#, with: "_", options: .regularExpression)
                .components(separatedBy: "_")
                .compactMap { $0.isEmpty ? nil : $0 }
        } else if stringTrimmed.contains(" ") {
            words = stringTrimmed
                .replacingOccurrences(of: #"[_\W]+"#, with: " ", options: .regularExpression)
                .components(separatedBy: " ")
                .compactMap { $0.isEmpty ? nil : $0 }
        } else if !splitByUppercasedLetters(stringTrimmed).isEmpty {
            let splitByNonWordCharacters = splitByNonWordCharacters(stringTrimmed)
            var splitWords: [String] = []
            for word in splitByNonWordCharacters {
                splitWords.append(contentsOf: splitByUppercasedLetters(word))
            }
            words = splitWords
        } else {
            print("else")
            words.append(stringTrimmed)
        }
        return words
    }
    
    private func splitByNonWordCharacters(_ s: String) -> [String] {
        return s
            .replacingOccurrences(of: #"\W+"#, with: " ", options: .regularExpression)
            .trimmingCharacters(in: .whitespacesAndNewlines)
            .components(separatedBy: " ")
    }
    
    private func splitByUppercasedLetters(_ s: String) -> [String] {
        let regex = try! NSRegularExpression(pattern: "([a-z]*)([A-Z])")
        let range = NSRange(s.startIndex..., in: s)
        return regex
            .stringByReplacingMatches(in: s, range: range, withTemplate: "$1 $2")
            .trimmingCharacters(in: .whitespacesAndNewlines)
            .components(separatedBy: " ")
    }
    
    private func capitalizeFirstLetter(_ string: String) -> String {
        return string.prefix(1).capitalized + string.dropFirst().lowercased()
    }
    
}
