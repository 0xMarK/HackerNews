//
//  Event.swift
//  HackerNews
//
//  Created by Anton Kaliuzhnyi on 18.05.2021.
//

import AnalyticsCenter

enum Event {
    
    /// By logging this event when an App becomes active, developers can understand
    /// how often users leave and return during the course of a Session.
    /// Although Sessions are automatically reported, this event can provide
    /// further clarification around the continuous engagement of app-users.
    case appOpen
    
    /// This event signifies a screen view. Use this when a screen transition occurs.
    /// This event can be logged irrespective of whether automatic screen tracking is enabled.
    case screenView(screenClass: String?, screenName: String?)
    
    /// This general purpose event signifies that a user has selected some content
    /// of a certain type in an app. The content can be any object in your app.
    /// This event can help you identify popular content and categories of content in your app.
    case selectContent(contentType: String, itemID: String)
    
}

extension Event: AnalyticsEvent {
    
    var name: String {
        guard let range = String(describing: self).range(of: #"^[^(]+"#, options: .regularExpression) else {
            return String(describing: self)
        }
        return String(String(describing: self)[range])
    }
    
    var parameters: [String: Any]? {
        var parameters: [String: Any] = [:]
        if let firstChild = Mirror(reflecting: self).children.first {
            for childOfValue in Mirror(reflecting: firstChild.value).children {
                if let key = childOfValue.label,
                   case Optional<Any>.some(let value) = childOfValue.value {
                    parameters[key] = value
                }
                
            }
        }
        return parameters
    }
    
}
