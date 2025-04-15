//
//  RegistrationViewBrowser.swift
//  PSDEAGM
//
//  Created by MacBook Pro on 10/04/2025.
//

import SwiftUI

struct RegistrationViewBrowser: View {
    var body: some View {
            VStack {
                Text("Opening registration page...")
                    .padding()
            }
            .onAppear {
                if let url = URL(string: "https://psde.pide.org.pk/mobile-registration") {
                    UIApplication.shared.open(url)
                }
            }
        }
}

#Preview {
    RegistrationViewBrowser()
}
