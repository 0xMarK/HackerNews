//
//  LoadingView.swift
//  HackerNews
//
//  Created by Anton Kaliuzhnyi on 12.05.2021.
//

import SwiftUI

struct LoadingView<Content>: View where Content: View {
    
    @Binding var isShowing: Bool
    
    var content: () -> Content
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .center) {
                content()
                    .disabled(isShowing)
                    .blur(radius: isShowing ? 3 : 0)
                VStack {
                    Text("Loading...")
                    ProgressView()
                }
                .frame(width: geometry.size.width / 2,
                       height: geometry.size.height / 5)
                .background(Color.secondary.colorInvert())
                .foregroundColor(Color.primary)
                .cornerRadius(20)
                .opacity(isShowing ? 1 : 0)
            }
        }
    }
    
}

struct LoadingView_Previews: PreviewProvider {
    
    static var previews: some View {
        LoadingView(isShowing: .constant(false)) {
            Color(.gray)
        }
    }
    
}
