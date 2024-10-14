//
//  Untitled.swift
//  DesignDaily
//
//  Created by Yigit Dayı on 8.10.2024.
//

import SwiftUI

class ListsViewModel: ListsViewModelProtocol {
    @Published private(set) var products: [Product] = []
    @Published private(set) var isLoading: Bool = false
    @Published private(set) var errorMessage: String?

    private let productService: ProductServiceProtocol

    init(productService: ProductServiceProtocol = ProductService()) {
        self.productService = productService
    }

    func fetchProducts() async {
        isLoading = true
        defer { isLoading = false }

        do {
            products = try await productService.fetchProducts()
        } catch {
            errorMessage = error.localizedDescription
        }
    }
}

