//
//  CommentsView.swift
//  HackerNews
//
//  Created by Anton Kaliuzhnyi on 12.05.2021.
//

import SwiftUI

struct CommentsView: View {
    
    @Environment(\.api) private var api
    
    let story: Item
    
    var body: some View {
        if let kids = story.kids {
            List {
                ForEach(kids, id: \.self) { id in
                    CommentView(id: id)
                }
            }
            .navigationTitle("Comments")
        } else {
            Text("No comments")
                .navigationTitle("Comments")
        }
    }
    
}

struct CommentsView_Previews: PreviewProvider {
    
    static var previews: some View {
        CommentsView(story: APIMock.randomItem)
    }
    
}
