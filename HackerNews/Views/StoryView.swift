//
//  StoryView.swift
//  HackerNews
//
//  Created by Anton Kaliuzhnyi on 12.05.2021.
//

import SwiftUI

struct StoryView: View {
    
    @State var story: Item
    
    @StateObject private var webViewStore = WebViewStore()
    
    @State private var showingAuthor = false
    
    @State private var showingComments = false
    
    var body: some View {
        if let text = story.text {
            ScrollView {
                Text(text)
                    .padding()
            }
        } else if let url = story.url {
            LoadingView(isShowing: .constant(webViewStore.webView.isLoading)) {
                WebView(webView: webViewStore.webView)
                    .navigationBarTitle(Text(verbatim: webViewStore.title ?? ""), displayMode: .inline)
                    .navigationBarItems(trailing: HStack {
                        Button(action: goBack) {
                            Image(systemName: "chevron.left")
                        }.disabled(!webViewStore.canGoBack)
                        Button(action: goForward) {
                            Image(systemName: "chevron.right")
                        }.disabled(!webViewStore.canGoForward)
                        Button(action: showAuthor) {
                            Image(systemName: "person.crop.circle.fill")
                        }
                        Button(action: showComments) {
                            Image(systemName: "text.bubble.fill")
                        }
                    })
                    .onAppear {
                        if webViewStore.webView.url != URL(string: url)! {
                            webViewStore.webView.load(URLRequest(url: URL(string: url)!))
                        }
                    }
            }
            NavigationLink(destination: UserView(id: story.by), isActive: $showingAuthor) {
                EmptyView()
            }
            .frame(width: 0, height: 0)
            .disabled(true)
            NavigationLink(destination: Text("Comments"), isActive: $showingComments) {
                EmptyView()
            }
            .frame(width: 0, height: 0)
            .disabled(true)
        }
    }
    
    func goBack() {
        webViewStore.webView.goBack()
    }
    
    func goForward() {
        webViewStore.webView.goForward()
    }
    
    func showAuthor() {
        showingAuthor = true
    }
    
    func showComments() {
        showingComments = true
    }
    
}

struct StoryView_Previews: PreviewProvider {
    
    static var previews: some View {
        StoryView(story: Item(by: "Author", descendants: 0, id: 0, kids: nil, score: 0, text: "Text", time: 0, title: "Title", type: "story", url: nil))
    }
    
}
