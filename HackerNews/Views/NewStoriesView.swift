//
//  NewStoriesView.swift
//  HackerNews
//
//  Created by Anton Kaliuzhnyi on 12.05.2021.
//

import SwiftUI

struct NewStoriesView: View {
    
    @Environment(\.api) private var api
    
    @State var items: [Int] = []
    
    var body: some View {
        List {
            ForEach(items, id: \.self) { id in
                StoryCellView(id: id)
            }
        }
        .navigationTitle("New Stories")
        .onAppear(perform: loadData)
    }
    
    func loadData() {
        api.newStories { result in
            if let itemsArray = try? result.get() {
                items = itemsArray
            }
        }
    }
    
}

struct NewStoriesView_Previews: PreviewProvider {
    
    static var previews: some View {
        NewStoriesView()
    }
    
}
