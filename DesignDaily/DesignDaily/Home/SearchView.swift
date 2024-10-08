//
//  SearchView.swift
//  DesignDaily
//
//  Created by Yigit Dayı on 8.10.2024.
//

import SwiftUI

struct SearchView: View {
    let categories = ["Modernism", "Maximalism", "Bauhaus", "Minimalism", "Art Nouveau", "De Stijl"]
    @EnvironmentObject var coordinator: AppCoordinator
    var body: some View {
        VStack(spacing: 20) {
            // Navigation Bar
            HStack {
                Text("DesignDaily")
                    .font(.title)
                    .fontWeight(.bold)
                Spacer()
                Image(systemName: "line.horizontal.3")
                Spacer()
                Image(systemName: "magnifyingglass")
            }
            .padding()
            
            ScrollView {
                // Filter Section
                HStack {
                    Image(systemName: "slider.horizontal.3")
                    Spacer()
                    Text("Filter tags")
                    Spacer()
                }
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)
                .padding([.horizontal, .bottom])
                
                // Category Grid
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 150))], spacing: 20) {
                    ForEach(categories, id: \.self) { category in
                        VStack {
                            Image(category.lowercased()) // Replace with actual image assets
                                .resizable()
                                .scaledToFill()
                                .frame(height: 100)
                                .clipped()
                            Text(category)
                                .font(.headline)
                        }
                        .frame(maxWidth: .infinity)
                        .background(Color.white)
                        .cornerRadius(12)
                        .shadow(radius: 2)
                    }
                }
                .padding(.horizontal)
            }

            Spacer()
            
            // Bottom Navigation
            BottomNavigationView()
        }
        .background(Color.white)
        .ignoresSafeArea()
    }
}
