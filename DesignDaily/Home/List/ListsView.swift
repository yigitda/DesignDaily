//
//  Untitled.swift
//  DesignDaily
//
//  Created by Yigit Dayı on 8.10.2024.
//

import SwiftUI

struct ListsView<ViewModel: ListsViewModelProtocol>: View {
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
                ScrollView {
                    VStack(spacing: 15) {
                        ForEach(viewModel.products) { product in
                            ProductRowView(product: product)
                                .onTapGesture {
                                    coordinator.navigate(to: .productDetail(product))
                                }
                        }
                    }
                    .padding(.horizontal)
                }
            }

            Spacer()

            // Bottom Navigation
            BottomNavigationView()
        }
        .task {
            await viewModel.fetchProducts()
        }
        .background(Color.white)
        .ignoresSafeArea()
    }
}

struct ProductRowView: View {
    let product: Product

    var body: some View {
        HStack {
            Image(product.imageName)
                .resizable()
                .frame(width: 100, height: 100)
                .cornerRadius(12)
            VStack(alignment: .leading) {
                Text(product.name)
                    .font(.headline)
                Button("Details") {
                    // This button can also trigger navigation if needed
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
