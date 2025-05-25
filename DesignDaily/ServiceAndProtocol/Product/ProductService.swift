//
//  ProductService.swift
//  DesignDaily
//
//  Created by Yigit Dayı on 8.10.2024.
//

import Foundation

class ProductService: ProductServiceProtocol {
    func fetchProducts() async throws -> [Product] {
        // Simulate network delay
        try await Task.sleep(nanoseconds: 1_000_000_000)
        // Return sample data
        return [
            Product(id: UUID(), name: "Barcelona Chair", imageName: "barcelona-chair", details: "Details about Barcelona Chair", description: "Description of Barcelona Chair"),
            Product(id: UUID(), name: "Eames Lounge Chair", imageName: "eames-lounge-chair", details: "Details about Eames Lounge Chair", description: "Description of Eames Lounge Chair")
        ]
    }

    func fetchProductDetails(productId: UUID) async throws -> Product {
        // Simulate network delay
        try await Task.sleep(nanoseconds: 500_000_000)
        // Return sample product details
        return Product(id: productId, name: "Sample Product", imageName: "sample-image", details: "Sample details", description: "Sample description")
    }
}
