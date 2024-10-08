//
//  ProductDetailView.swift
//  DesignDaily
//
//  Created by Yigit Dayı on 8.10.2024.
//

import SwiftUI

struct ProductDetailView<ViewModel: ProductDetailViewModelProtocol>: View {
    @StateObject private var viewModel: ViewModel
    @EnvironmentObject var coordinator: AppCoordinator

    init(viewModel: ViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        VStack(spacing: 20) {
            // Navigation Bar
            TopNavigationBar(title: "DesignDaily")

            if viewModel.isLoading {
                ProgressView()
            } else if let errorMessage = viewModel.errorMessage {
                Text(errorMessage)
                    .foregroundColor(.red)
            } else {
                // Product Image and Details
                Image(viewModel.product.imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(height: 200)
                    .clipped()

                VStack(alignment: .leading, spacing: 10) {
                    Text(viewModel.product.name)
                        .font(.title2)
                        .bold()

                    Text(viewModel.product.details)
                        .font(.footnote)
                        .foregroundColor(.gray)

                    Text(viewModel.product.description)
                        .font(.body)
                }
                .padding()
            }

            Spacer()

            // Bottom Navigation
            BottomNavigationView()
        }
        .task {
            await viewModel.fetchProductDetails()
        }
        .background(Color.white)
        .ignoresSafeArea()
    }
}
