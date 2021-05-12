//
//  HackerNewsApp.swift
//  HackerNews
//
//  Created by Anton Kaliuzhnyi on 11.05.2021.
//

import SwiftUI

@main
struct HackerNewsApp: App {
    
    var body: some Scene {
        WindowGroup {
            TabView {
                NavigationView {
                    TopStoriesView()
                }
                .tabItem {
                    Label("Top Stories", systemImage: "1.circle.fill")
                }
                NavigationView {
                    NewStoriesView()
                }
                .tabItem {
                    Label("New Stories", systemImage: "bolt.fill")
                }
                NavigationView {
                    BestStoriesView()
                }
                .tabItem {
                    Label("Best Stories", systemImage: "star.fill")
                }
            }
        }
    }
    
}
