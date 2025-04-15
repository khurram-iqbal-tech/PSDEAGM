//
//  HTMLtoSwiftUiView.swift
//  psde
//
//  Created by MacBook Pro on 20/03/2025.
//

import SwiftUI
import UIKit

struct HTMLtoSwiftUi: UIViewRepresentable {
    let htmlContent: String
    @Environment(\.colorScheme) var colorScheme

    func makeUIView(context: Context) -> UITextView {
        let textView = UITextView()
        textView.isEditable = false
        textView.backgroundColor = .clear
        textView.attributedText = htmlToAttributedString(htmlContent)
        return textView
    }

    func updateUIView(_ uiView: UITextView, context: Context) {
        // Update the attributed text when the color scheme changes
        uiView.attributedText = htmlToAttributedString(htmlContent)
    }

    func htmlToAttributedString(_ html: String) -> NSAttributedString? {
        guard let data = html.data(using: .utf8) else { return nil }
        return try? NSAttributedString(
            data: data,
            options: [.documentType: NSAttributedString.DocumentType.html],
            documentAttributes: nil
        )
    }
}

struct HTMLtoSwiftUiView: View {
    var urlPath: String
    @Environment(\.colorScheme) var colorScheme
    @State private var htmlString: String = ""
    @State private var isLoading: Bool = true

    var body: some View {
        VStack {
            if isLoading {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
                    .padding()
            } else {
                HTMLtoSwiftUi(htmlContent: htmlString)
                    .padding()
                    .environment(\.colorScheme, colorScheme) // Pass the color scheme to the HTMLTextView
            }
        }
        .onAppear {
            fetchHTMLContent(urlPath: urlPath)
        }
    }

    private func fetchHTMLContent(urlPath:String) {
        guard let url = URL(string: urlPath) else {
            print("Invalid URL")
            return
        }

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error fetching HTML content: \(error.localizedDescription)")
                return
            }

            if let data = data, let htmlContent = String(data: data, encoding: .utf8) {
                DispatchQueue.main.async {
                    self.htmlString = htmlContent
                    self.isLoading = false
                }
            }
        }

        task.resume()
    }
}

#Preview {
    HTMLtoSwiftUiView(urlPath: "https://psde.pide.org.pk/psde-app/psde_map_1.html")
}
