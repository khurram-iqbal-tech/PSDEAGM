//
//  HomeView.swift
//  psde
//
//  Created by MacBook Pro on 15/02/2025.
//

import SwiftUI

struct HomeView: View {
    
    var body: some View {

            ScrollView{
                VStack{
                    Header()
                    CardsGrid()
                      
                }
            }
    }
}


struct CardsGrid: View {
    let columns = [GridItem(.adaptive(minimum: 150))]
    
    var body: some View {
        LazyVGrid(columns: columns){
            NavigationLink{
                ThemesView()
                    .navigationTitle("Conference Theme")
            } label: {
                CardView(title: "Themes", icon: "scroll")
            }
//            NavigationLink{
//                HTMLtoSwiftUiView(urlPath: "https://file.pide.org.pk/pdf/test1.html")
//                    .navigationTitle("Profile Book")
//            } label: {
//                CardView(title: "Profile Book", icon: "person.text.rectangle.fill")
//            }
//            NavigationLink{
//                HTMLtoSwiftUiView(urlPath: "https://file.pide.org.pk/pdf/test1.html")
//                    .navigationTitle("Abstract Book")
//            } label: {
//                CardView(title: "Abstract Book", icon: "book.pages")
//            }
            NavigationLink{
                ConceptNoteView()
                    .navigationTitle("Concept Note")
            } label: {
                CardView(title: "Concept Note", icon: "book.pages")
            }
            NavigationLink{
                RegistrationViewPicture()
                //RegistrationView()
                    .navigationBarTitleDisplayMode(.inline)
                    .background(Color(.backgroundMain))
                    .navigationTitle("38th AGM Registration")
            } label: {
                CardView(title: "Registration", icon: "person")
            }
            NavigationLink{
                LocationsView()
                    .navigationTitle("38th AGM & Conference, PSDE")
                    .navigationBarTitleDisplayMode(.inline)
                    .background(Color(.backgroundMain))
                    .navigationTitle("Location")
            } label: {
                CardView(title: "Location", icon: "mappin.and.ellipse")
            }
            NavigationLink{
                SponsorsView()
                    .navigationTitle("Sponsors")
                    .background(Color(.backgroundMain))
            } label: {
                CardView(title: "Sponsors", icon: "dollarsign.arrow.circlepath")
            }


//            NavigationLink{
//                HTMLtoSwiftUiView(urlPath: "https://file.pide.org.pk/pdf/test1.html")
//                    .navigationTitle("Technical Session")
//            } label: {
//                CardView(title: "Technical Session", icon: "lightbulb.max")
//            }
            NavigationLink{
                LIVEStreamingView()
            } label: {
                CardView(title: "LIVE Streaming", icon: "video.and.waveform")
            }

            
  // /////////// NOT USED AFTER THIS //////////////
            
//            NavigationLink{
//                HTMLOnline()
//                    .navigationTitle("HTML Online")
//                    .background(Color(.backgroundMain))
//            } label: {
//                CardView(title: "HTML Online", icon: "book.pages")
//            }
//            NavigationLink{
//                HTMLView()
//                    .navigationTitle("WKWeb Vieww")
//                    .background(Color(.backgroundMain))
//            } label: {
//                CardView(title: "WKWeb View", icon: "book.pages")
//            }
//            NavigationLink{
//                HTMLAttributedView()
//                    .navigationTitle("Attributed View")
//                    .background(Color(.backgroundMain))
//            } label: {
//                CardView(title: "Attributed View", icon: "doc.text.image")
//            }
//            NavigationLink{
//                PDFViewOnline(urlString: PDFLinks.programme)
//                    .navigationTitle("Programme")
//            } label: {
//                CardView(title: "Programme", icon: "doc.text.image")
//            }
//            
//            NavigationLink{
//                PDFViewOnline(urlString: PDFLinks.conceptNote)
//                    .navigationTitle("Concept Note")
//            } label: {
//                CardView(title: "Concept Note", icon: "book.closed.fill")
//            }
//            
//      
//            NavigationLink{
//                PDFViewOnline(urlString: PDFLinks.callForPaper)
//                    .navigationTitle("Profile Book")
//            } label: {
//                CardView(title: "Profile Book", icon: "person.text.rectangle.fill")
//            }
//            
//            NavigationLink{
//                PDFViewOnline(urlString: PDFLinks.callForPaper)
//                    .navigationTitle("Address Book")
//            } label: {
//                CardView(title: "Address Book", icon: "book.pages")
//            }
//            
//            NavigationLink{
//                SponsorsView()
//                    .navigationTitle("Sponsors")
//                    .background(Color(.backgroundMain))
//            } label: {
//                CardView(title: "Sponsors", icon: "heart.fill")
//            }
//
//            NavigationLink{
//                PDFViewOnline(urlString: PDFLinks.callForPaper)
//                    .navigationTitle("LIVE Streaming")
//            } label: {
//                CardView(title: "LIVE Streaming", icon: "video.and.waveform.fill")
//            }

        }
        .padding([.horizontal, .top])
    }
}

struct Header: View {
    var body: some View {
        VStack{
//            Text("URAAN PAKISTAN")
//                .foregroundStyle(.buttonBackground)
//                .font(.largeTitle)
//                .fontWeight(.bold)
//                .padding(.top)
//            Text("Growth through Digital Transformation")
//                .foregroundStyle(.orange)
//                .bold()
            Image(.hero5)
                        .resizable()
                        .scaledToFit()
            
            //       Text("Pakistan Institute of Development Economics")
            //Text("38th AGM - Growth through Digital Transformation")
            //Text("April 15-17, 2025 , Islamabad")
                .foregroundStyle(.gray)
                .padding(1)
        }
    }
}

struct CardView: View{
    var title: String
    var icon: String
    
    var body: some View{
        VStack{
            Image(systemName: icon)
                .resizable()
                .scaledToFit()
                .frame(width: 70, height: 70)
                .foregroundStyle(Color.icon)
                .padding()
                .padding()
                
            VStack{
                Text(title)
                    .font(.headline)
                
            }
            .padding(.vertical)
            .frame(maxWidth: .infinity)
            .background(Color.buttonBackground.gradient)
            .foregroundStyle(.white)
            
        }
        .background(
            RoundedRectangle(cornerRadius: 10)
                //.fill(Color.background) // Or any background color you want
                .stroke(Color.buttonBackground, lineWidth: 4)
        )
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

#Preview {
    HomeView()
}
