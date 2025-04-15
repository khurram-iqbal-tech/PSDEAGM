//
//  ContentView.swift
//  psde
//
//  Created by MacBook Pro on 11/02/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabsView()
    }
}

struct TabsView: View {
    @State private var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
                NavigationStack {
                    //HomeView()
                    HomeView2()
                        .navigationTitle("38th AGM & Conference, PSDE")
                        .navigationBarTitleDisplayMode(.inline)
                        .background(Color(.backgroundMain))
                }
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
                .tag(0)
                
                NavigationStack {
                    ThemesView()
                        .navigationTitle("38th AGM & Conference, PSDE")
                        .navigationBarTitleDisplayMode(.inline)
                        .background(Color(.backgroundMain))
                }
                .tabItem {
                    Image(systemName: "calendar")
                    Text("Themes")
                }
                
//                NavigationStack {
//                    RegistrationViewBrowser()
//                        .navigationTitle("38th AGM & Conference, PSDE")
//                        .navigationBarTitleDisplayMode(.inline)
//                        .background(Color(.backgroundMain))
//                }
//                .tabItem {
//                    Image(systemName: "person.badge.plus")
//                    Text("Registration")
//                }
                
                Color(.backgroundMain) // Maintain your background color
                    .tabItem {
                        Image(systemName: "person.badge.plus")
                        Text("Registration")
                    }
                    .tag(2)
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                            if let url = URL(string: "https://psde.pide.org.pk/mobile-registration") {
                                UIApplication.shared.open(url){ _ in
                                    // When returning from Safari, switch back to Home tab
                                    selectedTab = 0
                                }
                            }
                        }
                    }
                
                NavigationStack {
                    LocationsView()
                        .navigationTitle("38th AGM & Conference, PSDE")
                        .navigationBarTitleDisplayMode(.inline)
                        .background(Color(.backgroundMain))
                }
                .tabItem {
                    Image(systemName: "mappin.and.ellipse.circle.fill")
                    Text("Locations")
                }
            }
            

    }
}


#Preview {
    ContentView()
}
