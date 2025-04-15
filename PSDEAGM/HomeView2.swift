//
//  HomeView2.swift
//  PSDEAGM
//
//  Created by MacBook Pro on 30/03/2025.
//


import SwiftUI

struct HomeView2: View {
    
    var body: some View {

            ScrollView{
                VStack{
                    Header2()
                    CardsGrid2()
                       // .frame(maxHeight: .infinity)
                        .background(.backgroundTheme)
                        
                      
                }
            }
    }
}


struct CardsGrid2: View {
    let columns = [
        GridItem(.adaptive(minimum: 100, maximum: 150), spacing: 16) // Horizontal spacing
    ]
    
    var body: some View {
        LazyVGrid(
            columns: columns,
            spacing: 16, // Vertical spacing
            pinnedViews: []
        ) {
            NavigationLink{
                ElementorView(urlPath: "https://psde.pide.org.pk/events-mobile-app/")
                    .navigationTitle("Events")
            } label: {
                CardView2(title: "Events", icon: "calendar")
            }
            NavigationLink{
                ThemesView()
                    .navigationTitle("Conference Theme")
            } label: {
                CardView2(title: "Themes", icon: "scroll")
            }
            NavigationLink{
                ElementorView(urlPath: "https://psde.pide.org.pk/profile-book-mobile-app/")
                    .navigationTitle("Profile Book")
            } label: {
                CardView2(title: "Profile Book", icon: "person.text.rectangle")
            }
            NavigationLink{
                PDFViewOnline(urlString: PDFLinks.abstract)
                        .navigationTitle("Abstract Book")
                    } label: {
                        CardView2(title: "Abstract Book", icon: "book")
            }
//            NavigationLink{
//                ElementorView(urlPath: "https://psde.pide.org.pk/profile-book-mobile-app/")
//                    .navigationTitle("Abstract Book")
//            } label: {
//                CardView2(title: "Abstract Book", icon: "book.pages")
//            }
            NavigationLink{
                PDFViewOnline(urlString: PDFLinks.conceptNote)
                        .navigationTitle("Concept Note")
                    } label: {
                        CardView2(title: "Concept Note", icon: "book.pages")
                }
//            NavigationLink{
//                ElementorView(urlPath: "https://psde.pide.org.pk/profile-book-mobile-app/")
//                    .navigationTitle("Concept Note")
//            } label: {
//                CardView2(title: "Concept Note", icon: "book.pages")
//            }
            NavigationLink{
                ElementorView(urlPath: "https://psde.pide.org.pk/sponsors-mobile-app/")
                    .navigationTitle("Sponsors")
                   // .background(Color(.backgroundMain))
            } label: {
                CardView2(title: "Sponsors", icon: "dollarsign.arrow.circlepath")
            }
            
            NavigationLink{
                LocationsView()
                    .navigationTitle("Location")
            } label: {
                CardView2(title: "Location", icon: "mappin.and.ellipse")
            }
            
            
            Button {
                if let url = URL(string: "https://psde.pide.org.pk/mobile-registration") {
                    UIApplication.shared.open(url)
                }
            } label: {
                CardView2(title: "Registration", icon: "person")
            }
//            NavigationLink{
//                RegistrationViewBrowser()
//                //RegistrationViewPicture()
//                //RegistrationView()
//                    .navigationBarTitleDisplayMode(.inline)
//                    .background(Color(.backgroundMain))
//                    .navigationTitle("38th AGM Registration")
//            } label: {
//                CardView2(title: "Registration", icon: "person")
//            }




//            NavigationLink{
//                HTMLtoSwiftUiView(urlPath: "https://file.pide.org.pk/pdf/test1.html")
//                    .navigationTitle("Technical Session")
//            } label: {
//                CardView(title: "Technical Session", icon: "lightbulb.max")
//            }
            NavigationLink{
                ElementorView(urlPath: "https://psde.pide.org.pk/live-streaming-mobile-app/")
            } label: {
                CardView2(title: "LIVE Streaming", icon: "video.and.waveform")
            }


        }
        .padding([.horizontal, .vertical])
        
    }
}

struct Header2: View {
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

struct CardView2: View{
    var title: String
    var icon: String
    
    var body: some View{
        VStack{
            Image(systemName: icon)
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40)
                .fontWeight(.light)
                .foregroundStyle(.black)
                .padding(.top,18)
            
            Text(title)
                .font(.callout)
                .foregroundStyle(.textTheme)
                .padding(4)
                .padding(.bottom)
            
        }
        .frame(maxWidth: .infinity, minHeight: 100)
        
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(.white) // Or any background color you want
        )
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

#Preview {
    HomeView2()
}
