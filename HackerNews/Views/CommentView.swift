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
    
    var body: some View {
        if let item = item {
            VStack(alignment: .leading) {
                HStack(alignment: .lastTextBaseline) {
                    Image(systemName: "person.crop.circle.fill")
                    Text(item.by)
                        .fontWeight(.medium)
                    if let date = Date(timeIntervalSince1970: TimeInterval(item.time)) {
                        HStack(spacing: 4) {
                            Text(date, style: .relative)
                            Text("ago")
                        }
                        .font(.caption)
                        .foregroundColor(.secondary)
                    }
                }
                HTMLView(html: item.text ?? "", desiredHeight: $desiredHeight)
                    .font(.body)
                    .frame(minHeight: desiredHeight)
            }
            .padding(.vertical, 8)
        } else {
            ProgressView()
                .onAppear(perform: loadData)
        }
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
