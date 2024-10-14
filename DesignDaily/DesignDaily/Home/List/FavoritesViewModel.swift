//
//  Untitled.swift
//  DesignDaily
//
//  Created by Yigit Dayı on 8.10.2024.
//

import SwiftUI

class FavoritesViewModel: ObservableObject {
    @Published var favoritedProducts: [Product] = []
    @Published var activeFilters: [String] = []
    
    private let productService: ProductServiceProtocol
    private let favoritesManager = FavoritesManager.shared
    
    init(productService: ProductServiceProtocol = ProductService()) {
        self.productService = productService
    }
    
    func fetchFavoritedProducts() {
        Task {
            do {
                let allProducts = try await productService.fetchProducts()
                let favoriteProductIDs = favoritesManager.favoriteProductIDs
                let favorites = allProducts.filter { favoriteProductIDs.contains($0.id) }
                await MainActor.run {
                    self.favoritedProducts = favorites
                }
            } catch {
                print("Error fetching products: \(error)")
            }
        }
    }
}

extension FavoritesViewModel {
    func applyFilter(_ filter: String) {
        activeFilters.append(filter)
        // Update favoritedProducts based on filters
    }
    
    func removeFilter(_ filter: String) {
        activeFilters.removeAll { $0 == filter }
        // Update favoritedProducts based on filters
    }
}

