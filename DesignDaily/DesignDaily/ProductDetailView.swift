//
//  ProductDetailView.swift
//  DesignDaily
//
//  Created by Yigit Dayı on 8.10.2024.
//

// ProductDetailView.swift

import SwiftUI

struct ProductDetailView: View {
    @EnvironmentObject var coordinator: AppCoordinator
    @ObservedObject var viewModel: ProductDetailViewModel
    @EnvironmentObject var favoritesManager: FavoritesManager

    var body: some View {
        VStack(spacing: 0) {
            // Header
            TopNavigationBar(title: "DesignDaily")
                .background(Color.black)
                .foregroundColor(.white)

            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    // Product Image with Favorite Button
                    ZStack(alignment: .topTrailing) {
                        Image(viewModel.product.imageName)
                            .resizable()
                            .scaledToFit()
                        Button(action: {
                            let productID = viewModel.product.id
                            if favoritesManager.isFavorited(productID: productID) {
                                favoritesManager.removeFavorite(productID: productID)
                            } else {
                                favoritesManager.addFavorite(productID: productID)
                            }
                        }) {
                            Image(systemName: favoritesManager.isFavorited(productID: viewModel.product.id) ? "heart.fill" : "heart")
                                .foregroundColor(.red)
                                .padding()
                        }
                    }

                    // Product Title
                    Text(viewModel.product.name)
                        .font(.largeTitle)
                        .bold()
                        .padding(.horizontal)

                    // Product Details
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Designer: \(viewModel.product.designerNames)")
                        Text("Date: \(viewModel.product.date)")
                        Text("Style: \(viewModel.product.style)")
                        Text("Size: \(viewModel.product.size)")
                        Text("Materials: \(viewModel.product.materials)")
                    }
                    .font(.subheadline)
                    .padding(.horizontal)

                    // Product Description
                    Text(viewModel.product.description)
                        .font(.body)
                        .padding(.horizontal)
                }
            }

        }
        .background(Color.white)
        .ignoresSafeArea()
        .onAppear {
            Task {
                await viewModel.fetchProductDetails()
            }
        }
    }
}
