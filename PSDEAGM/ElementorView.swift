//
//  ElementorView.swift
//  PSDEAGM
//
//  Created by MacBook Pro on 30/03/2025.
//

import SwiftUI
import WebKit

struct ElementorView: View {
    var urlPath: String

    var body: some View {
        VStack{
            WebViewElementor(url: URL(string: urlPath)!)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            
            
        }
    }
}

struct WebViewElementor: UIViewRepresentable {
    let url: URL

    func makeUIView(context: Context) -> WKWebView {
        let webview = WKWebView()
        let request = URLRequest(url: self.url, cachePolicy: .returnCacheDataElseLoad)
        webview.load(request)
        return webview
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        let request = URLRequest(url: self.url, cachePolicy: .reloadIgnoringLocalCacheData)
        uiView.load(request)
    }
}

#Preview {
    ElementorView(urlPath: "https://psde.pide.org.pk/profile-book-mobile-app/")
}
