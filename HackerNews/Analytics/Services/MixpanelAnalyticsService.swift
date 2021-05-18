//
//  MixpanelAnalyticsService.swift
//  HackerNews
//
//  Created by Anton Kaliuzhnyi on 13.05.2021.
//

import Mixpanel

struct MixpanelAnalyticsService: AnalyticsService {
    
    let apiToken: String
    
    let eventNameFormatter: AnalyticsEventNameFormatter?
    
    func start() {
        Mixpanel.initialize(token: apiToken)
    }
    
    func track(_ event: AnalyticsEvent) {
        let mixpanelProperties = event.parameters.compactMapValues { $0 as? MixpanelType }
        let name = eventNameFormatter?.format(event.name) ?? event.name
        Mixpanel.mainInstance().track(event: name, properties: mixpanelProperties)
    }
    
}
