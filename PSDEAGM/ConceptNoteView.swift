//
//  ConceptNoteView.swift
//  PSDEAGM
//
//  Created by MacBook Pro on 24/03/2025.
//

import SwiftUI

struct ConceptNoteView: View {
    var body: some View {
        ScrollView {
                    VStack(alignment: .leading, spacing: 20) {
                        Text("UNLOCKING PAKISTAN'S DIGITAL FUTURE")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.textHeading)
                            .multilineTextAlignment(.leading)
                        
                        Group {
                            Text("As the world races ahead in the digital revolution, Pakistan stands at a crossroads. The ambition of URAAN Pakistan—a trillion-dollar economy by 2035—rests on the nation's ability to harness digital transformation as the engine of sustainable growth. This vision is not just about technology; it's about reimagining Pakistan's economic trajectory, where digitization fuels exports, drives innovation, enhances energy efficiency, transforms education, and ensures economic equality.")
                            
                            Text("Against this backdrop, the 38th Annual PSDE Conference will convene the brightest minds—policy-makers, economists, researchers, industry leaders, and digital pioneers—to chart a course for Pakistan's digital-first future.This conference will not just analyze global best practices but will craft actionable strategies tailored to Pakistan's unique challenges.How can digital technologies unlock new markets, expand financial inclusion, and drive a competitive knowledge economy? What policies can ensure that Pakistan doesn't just catch up but leads the digital race in South Asia?")
                        }
                        .font(.body)
                       // .foregroundColor(.secondary)
                        .multilineTextAlignment(.leading)
                    }
                    .padding()
                }
    }
}

#Preview {
    ConceptNoteView()
}
