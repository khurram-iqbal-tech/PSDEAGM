//
//  LocationsView.swift
//  psde
//
//  Created by MacBook Pro on 15/02/2025.
//


import SwiftUI
import MapKit
import SafariServices

struct LocationsView: View {
    let latitude: Double = 33.747983020835335
    let longitude: Double = 73.13800654809621  // Example: San Francisco
    
    let appleMapsURL = URL(string: "http://maps.apple.com/?ll=50.894967,4.341626")!
    
    let columns = [GridItem(.adaptive(minimum: 300))]
    @State  var showSafari = false
    
    var body: some View {
        ScrollView{
        LazyVGrid(columns: columns){
            VStack(spacing: 0){
                Image(.marriott)
                    .resizable()
                    .scaledToFit()
                Text("Agha Khan Rd, F-5/1, Islamabad, 44000, Islamabad Marriott Hotel")
                    .padding(.vertical)
                    .frame(maxWidth: .infinity)
                    .background(Color.buttonBackground.gradient)
                    .foregroundStyle(.white)
                    .multilineTextAlignment(.center)
                    
//                Button{
//                    openInSafari()
//                } label:{
//                    HStack{
//                        Text("PIDE")
//                            .font(.title2)
//                            .bold()
//                        Text("(View on Map)")
//                    }
//                    .padding(.vertical)
//                    .frame(maxWidth: .infinity)
//                    .background(Color.buttonBackground.gradient)
//                    .foregroundStyle(.white)
//                }
                
            }
            .cornerRadius(10)
            
//            VStack(spacing: 0){
//                Image(.pide)
//                    .resizable()
//                    .scaledToFit()
//                
//                Button{
//                    openInSafari()
//                } label:{
//                    HStack{
//                        Text("PIDE")
//                            .font(.title2)
//                            .bold()
//                        Text("(View on Map)")
//                    }
//                    .padding(.vertical)
//                    .frame(maxWidth: .infinity)
//                    .background(Color.buttonBackground.gradient)
//                    .foregroundStyle(.white)
//                }
//            }
//            .cornerRadius(10)
//            
//            VStack(spacing: 0){
//                Image(.pide)
//                    .resizable()
//                    .scaledToFit()
//                
//                Button{
//                    openInSafari()
//                } label:{
//                    HStack{
//                        Text("PIDE")
//                            .font(.title2)
//                            .bold()
//                        Text("(View on Map)")
//                    }
//                    .padding(.vertical)
//                    .frame(maxWidth: .infinity)
//                    .background(Color.buttonBackground.gradient)
//                    .foregroundStyle(.white)
//                }
//            }
//            .cornerRadius(10)
        }
        .padding()
        
    }
}
    


    func openInSafari() {
        if let url = URL(string: "https://www.google.com/maps?q=33.749372426439734,73.13872449621915") {
             UIApplication.shared.open(url, options: [:], completionHandler: nil)
         }
    }
    
        func openMaps() {
            let url = URL(string: "http://maps.apple.com/?ll=33.7473,73.1374&t=s")!  // Standard Map Mode
            
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url)
            } else {
                print("Apple Maps cannot be opened.")
            }
        }
    }

struct SafariView: UIViewControllerRepresentable {
    let url: URL

    func makeUIViewController(context: Context) -> SFSafariViewController {
        return SFSafariViewController(url: url)
    }

    func updateUIViewController(_ uiViewController: SFSafariViewController, context: Context) {}
}

#Preview {
    LocationsView()
}
