import SwiftUI

struct ThemesView: View {
    let themeColor = Color(.textHeading) // #1A4675
    
    let themes: [(title: String, topics: [String])] = [
        ("Digital Transformation and Economic Resilience", [
            "Fintech Revolution: Reshaping Economies and Financial Inclusion",
            "The Future of Work: Labor Market Shifts in the Digital Era",
            "AI-Driven Learning: The Next Frontier in Education",
            "Reskilling the Workforce: Preparing Youth for the Digital Age",
            "Regulating the Digital Economy: Policies for Innovation and Security",
            "Scaling IT Services Exports: Unlocking New Markets and Opportunities"
        ]),
        ("Digital Economy and Inclusivity", [
            "Freelancing & Gig Economy: Challenges and Opportunities",
            "Bridging Pakistan’s IT Gap: Identifying Missing Links in the Ecosystem",
            "CPEC-II and the Digital Learning Corridor: Tapping into Regional Potential",
            "Metaverse & the Future Economy: Hype or Transformative Opportunity?",
            "Blockchain Beyond Cryptocurrency: Applications for Governance and Industry",
            "Breaking Mental Barriers to Digitalization: Cognitive Inertia and Adoption Challenges",
            "Cybersecurity in the Digital Age: Safeguarding Pakistan’s Digital Transformation"
        ]),
        ("Sustainable Development through Technology", [
            "Digital Twins & Smart Cities: Transforming Infrastructure and Urban Planning",
            "AI for Climate Resilience: Innovative Solutions for Sustainability",
            "Digitalization as a Solution for the Informal Economy",
            "Overcoming Cultural Barriers to Digital Adoption",
            "AI in Policymaking: Enhancing Public Sector Efficiency"
        ])
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    Text("Growth Through Digital Transformation")
                        .font(.largeTitle.bold())
                        .foregroundColor(themeColor)
                        .padding(.top, 20)
                        .padding(.horizontal)
                    
                    ForEach(themes, id: \..title) { theme in
                        VStack(alignment: .leading, spacing: 12) {
                            Text(theme.title)
                                .font(.title2.bold())
                                .foregroundColor(themeColor)
                                .padding(.bottom, 5)
                            
                            ForEach(theme.topics, id: \..self) { topic in
                                HStack(alignment: .top) {
                                    Image(systemName: "circle.fill")
                                        .resizable()
                                        .frame(width: 8, height: 8)
                                        .foregroundColor(themeColor)
                                        .padding(.top, 6)
                                    
                                    Text(topic)
                                        .font(.body)
                                        .foregroundColor(.primary)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                }
                                .padding()
                                .background(themeColor.opacity(0.1))
                                .cornerRadius(10)
                            }
                        }
                        .padding(.horizontal)
                    }
                }
                .padding(.bottom, 20)
            }
            //.navigationTitle("Themes")
            .background(Color(.systemGroupedBackground))
        }
    }
}

#Preview {
    ThemesView()
}
