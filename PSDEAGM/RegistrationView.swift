//
//  RegistrationView.swift
//  psde
//
//  Created by MacBook Pro on 15/02/2025.
//

import SwiftUI
import WebKit

struct RegistrationView: View {
    var googleFormURL: String = "https://psde.pide.org.pk/mobile-registration/"

    var body: some View {
        VStack{
            WebViewForm(url: URL(string: googleFormURL)!)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            
            
        }
    }
}

struct WebViewForm: UIViewRepresentable {
    let url: URL

    func makeUIView(context: Context) -> WKWebView {
        let webview = WKWebView()
        let request = URLRequest(url: self.url, cachePolicy: .returnCacheDataElseLoad)
        webview.load(request)
        return webview
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        let request = URLRequest(url: self.url, cachePolicy: .returnCacheDataElseLoad)
        uiView.load(request)
    }
}

#Preview {
    RegistrationView()
}
