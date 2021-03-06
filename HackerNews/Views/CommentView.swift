//
//  CommentView.swift
//  HackerNews
//
//  Created by Anton Kaliuzhnyi on 12.05.2021.
//

import SwiftUI

struct CommentView: View {
    
    @Environment(\.api) private var api
    
    @State var id: Int
    
    @State var item: Item?
    
    @State private var desiredHeight: CGFloat = 50
    
    @State private var didAppearTimeInterval: TimeInterval = 0
    
    var body: some View {
        if let item = item {
            VStack(alignment: .leading) {
                HStack(alignment: .lastTextBaseline) {
                    if let author = item.by {
                        Image(systemName: "person.crop.circle.fill")
                        Text(author)
                            .fontWeight(.medium)
                    }
                    if let date = Date(timeIntervalSince1970: TimeInterval(item.time)) {
                        HStack(spacing: 4) {
                            Text(date, style: .relative)
                            Text("ago")
                        }
                        .font(.caption)
                        .foregroundColor(.secondary)
                    }
                }
                if item.deleted ?? false {
                    Text("Deleted")
                        .foregroundColor(.secondary)
                } else {
                    HTMLView(html: item.text ?? "", desiredHeight: $desiredHeight)
                        .font(.body)
                        .frame(minHeight: desiredHeight)
                }
            }
            .padding(.vertical, 8)
        } else {
            ProgressView()
                .onAppear(perform: onAppear)
        }
    }
    
    private func onAppear() {
        // Workaround: not to be called too often
        if Date().timeIntervalSince1970 - didAppearTimeInterval > 0.5 {
            loadData()
        }
        didAppearTimeInterval = Date().timeIntervalSince1970
    }
    
    private func loadData() {
        api.item(id: id) { result in
            item = try? result.get()
        }
    }
    
}

struct CommentView_Previews: PreviewProvider {
    
    static var previews: some View {
        CommentView(id: 123)
            .environment(\.api, APIMock())
    }
    
}
