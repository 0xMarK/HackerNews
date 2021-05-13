//
//  HTMLView.swift
//  HackerNews
//
//  Created by Anton Kaliuzhnyi on 12.05.2021.
//

import SwiftUI

struct HTMLView: UIViewRepresentable {
    
    let html: String
    
    let textContainerInset: UIEdgeInsets
    
    let lineFragmentPadding: CGFloat
    
    let isScrollEnabled: Bool
    
    @Binding var desiredHeight: CGFloat
    
    init(html: String, textContainerInset: UIEdgeInsets = .zero, lineFragmentPadding: CGFloat = 0, isScrollEnabled: Bool = true, desiredHeight: Binding<CGFloat> = .constant(0)) {
        self.html = html
        self.textContainerInset = textContainerInset
        self.lineFragmentPadding = lineFragmentPadding
        self.isScrollEnabled = isScrollEnabled
        self._desiredHeight = desiredHeight
    }
    
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
            let maxWidth = uiView.frame.size.width
            let newSize = uiView.sizeThatFits(CGSize(width: maxWidth, height: .greatestFiniteMagnitude))
            desiredHeight = ceil(newSize.height)
        }
    }
    
    func makeUIView(context: UIViewRepresentableContext<Self>) -> UITextView {
        let textView = UITextView()
        textView.textContainerInset = textContainerInset
        textView.textContainer.lineFragmentPadding = lineFragmentPadding
        textView.isScrollEnabled = isScrollEnabled
        return textView
    }
    
}
