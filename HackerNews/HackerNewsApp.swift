//
//  HackerNewsApp.swift
//  HackerNews
//
//  Created by Anton Kaliuzhnyi on 11.05.2021.
//

import SwiftUI

@main
struct HackerNewsApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            TabView {
                NavigationView {
                    TopStoriesView()
                }
                .tabItem {
                    Label("Top Stories", systemImage: "1.circle.fill")
                }
                .navigationViewStyle(StackNavigationViewStyle()) // Workaround to silence the error
                NavigationView {
                    NewStoriesView()
                }
                .tabItem {
                    Label("New Stories", systemImage: "bolt.fill")
                }
                .navigationViewStyle(StackNavigationViewStyle()) // Workaround to silence the error
                NavigationView {
                    BestStoriesView()
                }
                .tabItem {
                    Label("Best Stories", systemImage: "star.fill")
                }
                .navigationViewStyle(StackNavigationViewStyle()) // Workaround to silence the error
            }
        }
    }
    
}
