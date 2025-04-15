//
//  SponsorsView.swift
//  psde
//
//  Created by MacBook Pro on 10/03/2025.
//

import SwiftUI

struct SponsorsView: View {
    let columns = [GridItem(.adaptive(minimum: 150))]
    
    var body: some View {
        ZStack{
            Color.backgroundMain
                .edgesIgnoringSafeArea(.all)
            VStack{
                LazyVGrid(columns: columns, spacing: 30){
                    //SponsorsCard(text: "world-bank-logo")
                    SponsorsCard(text: "pide-logo")
                    SponsorsCard(text: "rasta-logo")
                   // SponsorsCard(text: "bop-logo")
                    
                }
                .padding()
                .padding(.top)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            
        }
    }
}

struct SponsorsCard: View {
    let text: String
    var body: some View {
        VStack{
            Image(text)
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
        }
        .background(.white)
        .cornerRadius(10)
        .shadow(radius: 15)
    }
}

#Preview {
    SponsorsView()
}
