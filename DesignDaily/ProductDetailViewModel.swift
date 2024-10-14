//
//  ProductDetailViewModel.swift
//  DesignDaily
//
//  Created by Yigit Dayı on 8.10.2024.
//

import SwiftUI

class ProductDetailViewModel: ProductDetailViewModelProtocol {
    @Published private(set) var product: Product
    @Published private(set) var isLoading: Bool = false
    @Published private(set) var errorMessage: String?

    private let productId: UUID
    private let productService: ProductServiceProtocol

    init(productId: UUID, productService: ProductServiceProtocol = ProductService()) {
        self.productId = productId
        self.productService = productService
        self.product = Product(id: productId, name: "", imageName: "", details: "", description: "")
    }

    func fetchProductDetails() async {
        isLoading = true
        defer { isLoading = false }

        do {
            product = try await productService.fetchProductDetails(productId: productId)
        } catch {
            errorMessage = error.localizedDescription
        }
    }
}
