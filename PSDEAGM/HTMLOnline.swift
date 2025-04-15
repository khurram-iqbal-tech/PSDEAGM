import SwiftUI
import UIKit

struct HTMLText: UIViewRepresentable {
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

struct HTMLOnline: View {
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
                HTMLText(htmlContent: htmlString)
                    .padding()
                    .environment(\.colorScheme, colorScheme) // Pass the color scheme to the HTMLTextView
            }
        }
        .onAppear {
            fetchHTMLContent()
        }
    }

    private func fetchHTMLContent() {
        guard let url = URL(string: "https://file.pide.org.pk/pdf/test1.html") else {
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
    HTMLOnline()
}
