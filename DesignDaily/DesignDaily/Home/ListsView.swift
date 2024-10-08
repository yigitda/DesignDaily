//
//  Untitled.swift
//  DesignDaily
//
//  Created by Yigit Dayı on 8.10.2024.
//

import SwiftUI

struct ListsView: View {
    let items = [
        ("Chairs", "chairs-image"),
        ("Lightings", "lighting-image"),
        ("Coffee Tables", "coffee-tables-image")
    ]
    
    @StateObject private var viewModel = ListsViewModel()
    var body: some View {
        VStack(spacing: 20) {
            // Navigation Bar
            TopNavigationBar(title: "DesignDaily")
            
            ScrollView {
                VStack(spacing: 15) {
                    ForEach(items, id: \.0) { item in
                        HStack {
                            Image(item.1) // Replace with the actual image assets
                                .resizable()
                                .frame(width: 100, height: 100)
                                .cornerRadius(12)
                            VStack(alignment: .leading) {
                                Text(item.0)
                                    .font(.headline)
                                Button("Details") {
                                    // Navigate to details
                                }
                                .foregroundColor(.blue)
                            }
                            Spacer()
                        }
                        .padding()
                        .background(Color.white)
                        .cornerRadius(15)
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
