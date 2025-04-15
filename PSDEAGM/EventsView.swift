//
//  EventsOnlinePDFView.swift
//  psde
//
//  Created by MacBook Pro on 12/02/2025.
//


import SwiftUI
import PDFKit

struct EventsView: View {
    var body: some View {
        VStack{
            Text("38th AGM PSDE Event")
                .font(.title)
                .bold()
            
            Image(.banner)
                .resizable()
                .scaledToFit()
            Text("38th AGM - Growth through Digital Transformation")
            Text("April 15-17, 2025 , Islamabad")
            
            Text("Conference Sessions")
                .font(.title)
                .bold()
                .padding(.vertical)
            HStack{
 
                NavigationLink{
//                    WebPDFView2(urlString: PDFLinks.programme)
//                        .navigationTitle("Day 1 - Session")
                } label: {
                    Text("Day 1")
                        .padding()
                        .background(Color.buttonBackground.gradient)
                        .foregroundStyle(.white)
                        .cornerRadius(10)
                }
                
                NavigationLink{
//                    PDFViewOnline(urlString: PDFLinks.programme)
//                        .navigationTitle("Day 1 - Session")
                } label: {
                    Text("Day 2")
                        .padding()
                        .background(Color.buttonBackground.gradient)
                        .foregroundStyle(.white)
                        .cornerRadius(10)
                }
                
                NavigationLink{
//                    PDFViewOnline(urlString: PDFLinks.programme)
//                        .navigationTitle("Day 1 - Session")
                } label: {
                    Text("Day 3")
                        .padding()
                        .background(Color.buttonBackground.gradient)
                        .foregroundStyle(.white)
                        .cornerRadius(10)
                }
            }
            Spacer()
        }
    }
}

//struct WebPDFView2: View {
//    var urlString: String
//    @State private var pdfDocument: PDFDocument?
//
//    var body: some View {
//        VStack {
//            if let pdfDocument = pdfDocument {
//                PDFKitView2(document: pdfDocument)
//            } else {
//                ProgressView("Loading PDF...") // Show a loading spinner
//            }
//        }
//        .onAppear {
//            downloadPDF(from: urlString)
//        }
//    }
//
//    // Function to download the PDF
//    private func downloadPDF(from urlString: String) {
//        guard let url = URL(string: urlString) else {
//            print("❌ Invalid URL")
//            return
//        }
//
//        URLSession.shared.dataTask(with: url) { data, response, error in
//            if let error = error {
//                print("❌ Error downloading PDF: \(error.localizedDescription)")
//                return
//            }
//
//            if let data = data, let document = PDFDocument(data: data) {
//                DispatchQueue.main.async {
//                    self.pdfDocument = document
//                }
//            } else {
//                print("❌ Failed to create PDF document from data")
//            }
//        }.resume()
//    }
//}

//struct PDFKitView2: UIViewRepresentable {
//    var document: PDFDocument
//
//    func makeUIView(context: Context) -> PDFView {
//        let pdfView = PDFView()
//        pdfView.document = document
//        pdfView.autoScales = true
//        return pdfView
//    }
//
//    func updateUIView(_ uiView: PDFView, context: Context) {}
//}



#Preview {
    EventsView()
}
