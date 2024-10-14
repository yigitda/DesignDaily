//
//  Untitled.swift
//  DesignDaily
//
//  Created by Yigit Dayı on 8.10.2024.
//

import SwiftUI

import SwiftUI

struct FavoritesView: View {
    @EnvironmentObject var coordinator: AppCoordinator
    @StateObject private var viewModel = FavoritesViewModel()
    
    var body: some View {
        VStack(spacing: 20) {
            // Page Header
            TopNavigationBar(title: "DesignDaily")
            
            // Filter Bar
            FilterBarView(filters: viewModel.activeFilters)
            
            ScrollView {
                // Content Section
                ForEach(viewModel.favoritedProducts) { product in
                    HStack {
                        Image(product.imageName)
                            .resizable()
                            .frame(width: 100, height: 100)
                            .cornerRadius(8)
                        VStack(alignment: .leading) {
                            Text(product.name)
                                .font(.headline)
                            Button(action: {
                                // Navigate to product detail
                                coordinator.navigate(to: .productDetail(product), in: .favorites)
                            }) {
                                Text("Details")
                                    .foregroundColor(.white)
                                    .padding(.horizontal)
                                    .padding(.vertical, 8)
                                    .background(Color.gray)
                                    .cornerRadius(8)
                            }
                        }
                        Spacer()
                    }
                    .padding()
                }
            }
            
            Spacer()
            
            // Bottom Navigation Bar
            BottomNavigationView()
        }
        .onAppear {
            viewModel.fetchFavoritedProducts()
        }
        .background(Color.white)
        .ignoresSafeArea()
    }
}
