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
    
    var body: some View {
        if let text = story.text {
            ScrollView {
                Text(text)
                    .padding()
            }
        } else if let url = story.url {
            WebView(webView: webViewStore.webView)
                .navigationBarTitle(Text(verbatim: webViewStore.title ?? ""), displayMode: .inline)
                .navigationBarItems(trailing: HStack {
                    Button(action: goBack) {
                        Image(systemName: "chevron.left")
                            .imageScale(.large)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 32, height: 32)
                    }.disabled(!webViewStore.canGoBack)
                    Button(action: goForward) {
                        Image(systemName: "chevron.right")
                            .imageScale(.large)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 32, height: 32)
                    }.disabled(!webViewStore.canGoForward)
                })
                .onAppear {
                    webViewStore.webView.load(URLRequest(url: URL(string: url)!))
                }
        }
    }
    
    func goBack() {
        webViewStore.webView.goBack()
    }
    
    func goForward() {
        webViewStore.webView.goForward()
    }
    
}

struct StoryView_Previews: PreviewProvider {
    
    static var previews: some View {
        StoryView(story: Item(by: "Author", descendants: 0, id: 0, kids: nil, score: 0, text: "Text", time: 0, title: "Title", type: "story", url: nil))
    }
    
}
