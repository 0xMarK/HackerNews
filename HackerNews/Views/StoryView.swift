//
//  StoryView.swift
//  HackerNews
//
//  Created by Anton Kaliuzhnyi on 12.05.2021.
//

import SwiftUI

struct StoryView: View {
    
    @Environment(\.analytics) private var analytics
    
    @State var story: Item
    
    @StateObject private var webViewStore = WebViewStore()
    
    @State private var showingAuthor = false
    
    @State private var showingComments = false
    
    var body: some View {
        if let text = story.text {
            HTMLView(html: text, textContainerInset: UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16))
                .font(.body)
                .navigationBarTitle(Text(story.title ?? ""), displayMode: .inline)
                .navigationBarItems(trailing: navigationBarItems)
                .onAppear(perform: onAppear)
        } else if let url = story.url {
            LoadingView(isShowing: .constant(webViewStore.webView.isLoading)) {
                WebView(webView: webViewStore.webView)
                    .navigationBarTitle(Text(verbatim: webViewStore.title ?? ""), displayMode: .inline)
                    .navigationBarItems(trailing: navigationBarItems)
                    .onAppear {
                        if webViewStore.webView.url != URL(string: url)! {
                            webViewStore.webView.load(URLRequest(url: URL(string: url)!))
                        }
                    }
            }
            .onAppear(perform: onAppear)
        }
        NavigationLink(destination: UserView(id: story.by ?? ""), isActive: $showingAuthor) {
            EmptyView()
        }
        .frame(width: 0, height: 0)
        .disabled(true)
        NavigationLink(destination: CommentsView(story: story), isActive: $showingComments) {
            EmptyView()
        }
        .frame(width: 0, height: 0)
        .disabled(true)
    }
    
    private func onAppear() {
        analytics.track(.selectContent(contentType: "story", itemID: "\(story.id)"))
    }
    
    private var navigationBarItems: some View {
        HStack {
            if story.url != nil {
                Button(action: goBack) {
                    Image(systemName: "chevron.left")
                }.disabled(!webViewStore.canGoBack)
                Button(action: goForward) {
                    Image(systemName: "chevron.right")
                }.disabled(!webViewStore.canGoForward)
            }
            if story.by != nil {
                Button(action: showAuthor) {
                    Image(systemName: "person.crop.circle.fill")
                }
            }
            Button(action: showComments) {
                Image(systemName: "text.bubble.fill")
            }
        }
    }
    
    private func goBack() {
        webViewStore.webView.goBack()
    }
    
    private func goForward() {
        webViewStore.webView.goForward()
    }
    
    private func showAuthor() {
        showingAuthor = true
    }
    
    private func showComments() {
        showingComments = true
    }
    
}

struct StoryView_Previews: PreviewProvider {
    
    static var previews: some View {
        StoryView(story: APIMock.randomItem)
    }
    
}
