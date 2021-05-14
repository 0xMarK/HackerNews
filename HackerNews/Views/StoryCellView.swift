//
//  StoryCellView.swift
//  HackerNews
//
//  Created by Anton Kaliuzhnyi on 11.05.2021.
//

import SwiftUI

struct StoryCellView: View {
    
    @Environment(\.api) private var api
    
    @State var id: Int
    
    @State var item: Item?
    
    var body: some View {
        if let item = item {
            NavigationLink(
                destination: StoryView(story: item),
                label: {
                    VStack(alignment: .leading) {
                        Text(item.title ?? "")
                            .font(.headline)
                        HStack {
                            if let date = Date(timeIntervalSince1970: TimeInterval(item.time)) {
                                HStack(spacing: 4) {
                                    Text(date, style: .relative)
                                    Text("ago")
                                }
                            }
                            Text("by \(item.by)")
                        }
                        .font(.footnote)
                        .foregroundColor(.secondary)
                        HStack {
                            Text("\(item.score ?? 0) points")
                            if let descendents = item.descendants {
                                Text("\(descendents) comments")
                            }
                        }
                        .font(.footnote)
                        .foregroundColor(.secondary)
                    }
                }
            )
        } else {
            ProgressView()
                .onAppear(perform: onAppear)
        }
    }
    
    private func onAppear() {
        loadData()
    }
    
    private func loadData() {
        api.item(id: id) { result in
            item = try? result.get()
        }
    }
    
}

struct StoryCellView_Previews: PreviewProvider {
    
    static var previews: some View {
        StoryCellView(id: 27115372)
            .environment(\.api, APIMock())
    }
    
}
