import SwiftUI
import UIKit

struct HTMLText1: UIViewRepresentable {
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

struct HTMLAttributedView: View {
    @Environment(\.colorScheme) var colorScheme

    var htmlString: String {
        let textColor = colorScheme == .dark ? "#ffffff" : "#000000"
        return """
        <html>
        <head>
            <style>
                body { font-family: -apple-system, Helvetica, Arial; padding: 16px; color: \(textColor); }
                h1 { color: #1F7F8B; font-size: 28px; }
                h2 { color: #1F7F8B; font-size: 22px; }
                p { font-size: 16px; line-height: 1.5; }
                ul { padding-left: 20px; }
                li { margin-bottom: 8px; }
                .highlight { font-weight: bold; color: #1F7F8B; }
            </style>
        </head>
        <body>
            <h1>Concept Note - 38th AGM</h1>
            <h2>Growth through Digital Transformation</h2>
            <p><strong>CALL FOR PAPERS - 38TH ANNUAL GENERAL MEETING</strong></p>
        </body>
        </html>
        """
    }

    var body: some View {
        HTMLText1(htmlContent: htmlString)
            .padding()
            .environment(\.colorScheme, colorScheme) // Pass the color scheme to the HTMLTextView
    }
}

#Preview {
    HTMLAttributedView()
}
