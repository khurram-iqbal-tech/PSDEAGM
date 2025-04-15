//
//  PDFViewOnline.swift
//  psde
//
//  Created by MacBook Pro on 16/02/2025.
//

import SwiftUI
import PDFKit

struct PDFViewOnline: View {
    var urlString: String
    var body: some View {
        WebPDFView(urlString: urlString)
    }
}

struct WebPDFView: View {
    var urlString: String
    @State private var pdfDocument: PDFDocument?

    var body: some View {
        VStack {
            if let pdfDocument = pdfDocument {
                PDFKitView(document: pdfDocument)
            } else {
                ProgressView("Loading PDF...") // Show a loading spinner
            }
        }
        .onAppear {
            downloadPDF(from: urlString)
        }
    }

    // Function to download the PDF
    private func downloadPDF(from urlString: String) {
        guard let url = URL(string: urlString) else {
            print("❌ Invalid URL")
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("❌ Error downloading PDF: \(error.localizedDescription)")
                return
            }

            if let data = data, let document = PDFDocument(data: data) {
                DispatchQueue.main.async {
                    self.pdfDocument = document
                }
            } else {
                print("❌ Failed to create PDF document from data")
            }
        }.resume()
    }
}

struct PDFKitView: UIViewRepresentable {
    var document: PDFDocument

    func makeUIView(context: Context) -> PDFView {
        let pdfView = PDFView()
        pdfView.document = document
        pdfView.autoScales = true
        return pdfView
    }

    func updateUIView(_ uiView: PDFView, context: Context) {}
}


#Preview {
    PDFViewOnline(urlString: "https://psde.pide.org.pk/wp-content/uploads/PSDE-Programme-16-11-2023.pdf")
}
