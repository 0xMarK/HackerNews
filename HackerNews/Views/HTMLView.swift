//
//  HTMLView.swift
//  HackerNews
//
//  Created by Anton Kaliuzhnyi on 12.05.2021.
//

import SwiftUI

struct HTMLView: UIViewRepresentable {
    
    let html: String
    
    var textContainerInset: UIEdgeInsets = UIEdgeInsets.zero
    
    var lineFragmentPadding: CGFloat = 0
    
    func updateUIView(_ uiView: UITextView, context: UIViewRepresentableContext<Self>) {
        DispatchQueue.main.async {
            var uiFont: UIFont?
            if let font = context.environment.font {
                uiFont = UIFont.preferredFont(from: font)
            }
            if let htmlAttributed = html.htmlAttributed(defaultFont: uiFont) {
                uiView.isEditable = false
                uiView.attributedText = htmlAttributed
            }
        }
    }
    
    func makeUIView(context: UIViewRepresentableContext<Self>) -> UITextView {
        let textView = UITextView()
        textView.textContainerInset = textContainerInset
        textView.textContainer.lineFragmentPadding = lineFragmentPadding
        return textView
    }
    
}
