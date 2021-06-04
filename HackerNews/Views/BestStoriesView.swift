//
//  BestStoriesView.swift
//  HackerNews
//
//  Created by Anton Kaliuzhnyi on 12.05.2021.
//

import SwiftUI

struct BestStoriesView: View {
    
    @Environment(\.api) private var api
    
    @Environment(\.analytics) private var analytics
    
    @State private var didAppearTimeInterval: TimeInterval = 0
    
    @State var items: [Int] = []
    
    var body: some View {
        List {
            ForEach(items, id: \.self) { id in
                StoryCellView(id: id)
            }
        }
        .navigationTitle("Best Stories")
        .onAppear(perform: onAppear)
    }
    
    private func onAppear() {
        // Workaround: not to be called 2 times on app start
        if Date().timeIntervalSince1970 - didAppearTimeInterval > 0.5 {
            analytics.track(Event.screenView(screenClass: nil, screenName: "Best Stories"))
            loadData()
        }
        didAppearTimeInterval = Date().timeIntervalSince1970
    }
    
    private func loadData() {
        api.bestStories { result in
            if let itemsArray = try? result.get() {
                items = itemsArray
            }
        }
    }
    
}

struct BestStoriesView_Previews: PreviewProvider {
    
    static var previews: some View {
        BestStoriesView()
            .environment(\.api, APIMock())
    }
    
}
