//
//  TopStoriesView.swift
//  HackerNews
//
//  Created by Anton Kaliuzhnyi on 11.05.2021.
//

import SwiftUI

struct TopStoriesView: View {
    
    @Environment(\.api) private var api
    
    @Environment(\.analytics) private var analytics
    
    @State var items: [Int] = []
    
    @State private var didAppearTimeInterval: TimeInterval = 0
    
    var body: some View {
        List {
            ForEach(items, id: \.self) { id in
                StoryCellView(id: id)
            }
        }
        .navigationTitle("Top Stories")
        .onAppear(perform: onAppear)
    }
    
    private func onAppear() {
        // Workaround: not to be called 2 times on app start
        if Date().timeIntervalSince1970 - didAppearTimeInterval > 0.5 {
            analytics.track(Event.screenView(screenClass: nil, screenName: "Top Stories"))
            loadData()
        }
        didAppearTimeInterval = Date().timeIntervalSince1970
    }
    
    private func loadData() {
        api.topStories { result in
            if let itemsArray = try? result.get() {
                items = itemsArray
            }
        }
    }
    
}

struct TopStoriesView_Previews: PreviewProvider {
    
    static var previews: some View {
        TopStoriesView()
            .environment(\.api, APIMock())
    }
    
}
