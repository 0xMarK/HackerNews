//
//  FirebaseAnalyticsService.swift
//  HackerNews
//
//  Created by Anton Kaliuzhnyi on 13.05.2021.
//

import Firebase

struct FirebaseAnalyticsService: AnalyticsService {
    
    let googleAppID: String
    
    let gcmSenderID: String
    
    let apiKey: String
    
    let bundleID: String?
    
    let projectID: String
    
    let clientID: String
    
    let storageBucket: String
    
    let eventNameFormatter: AnalyticsEventNameFormatter?
    
    func start() {
        let firebaseOptions = FirebaseOptions(googleAppID: googleAppID, gcmSenderID: gcmSenderID)
        firebaseOptions.apiKey = apiKey
        firebaseOptions.projectID = projectID
        firebaseOptions.clientID = clientID
        firebaseOptions.storageBucket = storageBucket
        if let bundleID = bundleID {
            firebaseOptions.bundleID = bundleID
        }
        FirebaseApp.configure(options: firebaseOptions)
    }
    
    func track(_ event: AnalyticsEvent) {
        let name = eventNameFormatter?.format(event.name) ?? event.name
        Analytics.logEvent(name, parameters: event.parameters)
    }
    
}
