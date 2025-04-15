//
//  RegistrationViewPicture.swift
//  PSDEAGM
//
//  Created by MacBook Pro on 29/03/2025.
//

import SwiftUI
import AVFoundation
@preconcurrency import WebKit

struct RegistrationViewPicture: View {
    var googleFormURL: String = "https://psde.pide.org.pk/mobile-registration/" //"https://psde.pide.org.pk/psde-38th-annual-conference-online-registration-form-apple-app/"
    
    @State private var isLoading = true
    @State private var showCameraDeniedAlert = false
    @State private var webViewDidLoad = false
    
    var body: some View {
        ZStack {
            WebView(
                url: URL(string: googleFormURL)!,
                isLoading: $isLoading,
                showCameraDeniedAlert: $showCameraDeniedAlert,
                webViewDidLoad: $webViewDidLoad
            )
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            
            if isLoading {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: .blue))
                    .scaleEffect(1.5)
            }
        }
        .alert(isPresented: $showCameraDeniedAlert) {
            Alert(
                title: Text("Camera Access Required"),
                message: Text("Please enable camera access in Settings to upload photos"),
                primaryButton: .default(Text("Settings"), action: {
                    if let settingsURL = URL(string: UIApplication.openSettingsURLString) {
                        UIApplication.shared.open(settingsURL)
                    }
                }),
                secondaryButton: .cancel()
            )
        }
    }
}

struct WebView: UIViewRepresentable {
    let url: URL
    @Binding var isLoading: Bool
    @Binding var showCameraDeniedAlert: Bool
    @Binding var webViewDidLoad: Bool
    
    func makeUIView(context: Context) -> WKWebView {
        let configuration = WKWebViewConfiguration()
        configuration.allowsInlineMediaPlayback = true
        configuration.mediaTypesRequiringUserActionForPlayback = []
        configuration.websiteDataStore = .default() // Enable cookies
        
        let webview = WKWebView(frame: .zero, configuration: configuration)
        webview.navigationDelegate = context.coordinator
        webview.uiDelegate = context.coordinator
        webview.customUserAgent = "Mozilla/5.0 (iPhone; CPU iPhone OS 16_0 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.0 Mobile/15E148 Safari/604.1"
        
        let request = URLRequest(url: self.url, cachePolicy: .returnCacheDataElseLoad)
        webview.load(request)
        return webview
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if !webViewDidLoad {
            let request = URLRequest(url: self.url, cachePolicy: .returnCacheDataElseLoad)
            uiView.load(request)
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, WKNavigationDelegate, WKUIDelegate {
        var parent: WebView
        
        init(_ parent: WebView) {
            self.parent = parent
        }
        
        func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
            parent.isLoading = true
        }
        
        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            parent.isLoading = false
            parent.webViewDidLoad = true
        }
        
        func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
            parent.isLoading = false
        }
        
        func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
            decisionHandler(.allow)
        }
        
        func webView(_ webView: WKWebView, requestMediaCapturePermissionFor origin: WKSecurityOrigin, initiatedByFrame frame: WKFrameInfo, type: WKMediaCaptureType, decisionHandler: @escaping (WKPermissionDecision) -> Void) {
            
            switch type {
            case .camera, .microphone, .cameraAndMicrophone:
                AVCaptureDevice.requestAccess(for: .video) { granted in
                    DispatchQueue.main.async {
                        if granted {
                            decisionHandler(.grant)
                        } else {
                            self.parent.showCameraDeniedAlert = true
                            decisionHandler(.deny)
                        }
                    }
                }
            @unknown default:
                decisionHandler(.deny)
            }
        }
    }
}

#Preview {
    RegistrationViewPicture()
}
