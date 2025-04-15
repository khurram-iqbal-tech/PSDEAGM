//
//  HTMLView.swift
//  psde
//
//  Created by MacBook Pro on 12/03/2025.
//

import SwiftUI
import WebKit


struct GenerateHTMLView: UIViewRepresentable {
    let htmlContent: String

    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.loadHTMLString(htmlContent, baseURL: nil)
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {}
}

struct HTMLView: View {
    let htmlContent = """
      <html>
      <head>
         <style>
             body { font-family: -apple-system, Helvetica, Arial; padding: 16px; color: #333; }
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
         <p><strong>April 15-17, 2025 | Islamabad</strong></p>

         <p>As the world races ahead in the digital revolution, Pakistan stands at a crossroads. The ambition of 
         <span class="highlight">URAAN Pakistan</span>—a trillion-dollar economy by 2035—rests on the nation’s ability to harness digital 
         transformation as the engine of sustainable growth.</p>

         <h2>Unlocking Pakistan's Digital Future</h2>
         <ul>
             <li><strong>Accelerating Digital Transformation:</strong> Key policies for a leading digital economy.</li>
             <li><strong>Fintech Revolution:</strong> Reshaping economies and financial inclusion.</li>
             <li><strong>The Future of Work:</strong> Labor market shifts in the digital era.</li>
             <li><strong>AI-Driven Learning:</strong> The next frontier in education.</li>
             <li><strong>Scaling IT Services Exports:</strong> Unlocking new opportunities.</li>
         </ul>

         <h2>Conference Structure</h2>
         <ul>
             <li>Distinguished Special Lectures from global experts.</li>
             <li>4-5 High-Impact Panel Discussions.</li>
             <li>9 Technical Sessions for in-depth research.</li>
         </ul>

         <h2>Important Dates</h2>
         <p><strong>Submission Deadline:</strong> March 25, 2025</p>
         <p><strong>Notification of Accepted Papers:</strong> April 10, 2025</p>
         <p><strong>38th Annual PSDE Conference:</strong> April 15-17, 2025</p>

         <p><a href="https://psde.pide.org.pk">Visit Conference Website</a></p>
         <p><strong>For Paper Submission:</strong> <a href="mailto:submissions_psde@pide.org.pk">submissions_psde@pide.org.pk</a></p>
      </body>
      </html>
      """

    var body: some View {
        GenerateHTMLView(htmlContent: htmlContent)
    }
}

#Preview {
    HTMLView()
}
