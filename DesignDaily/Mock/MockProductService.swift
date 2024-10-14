//
//  MockProductService.swift
//  DesignDaily
//
//  Created by Yigit Dayı on 8.10.2024.
//

import Foundation

class MockProductService: ProductServiceProtocol {
    var shouldFail: Bool

    init(shouldFail: Bool = false) {
        self.shouldFail = shouldFail
    }

    func fetchProducts() async throws -> [Product] {
        if shouldFail {
            throw NSError(domain: "TestError", code: 1, userInfo: [NSLocalizedDescriptionKey: "Failed to fetch products"])
        } else {
            return [
                Product(id: UUID(), name: "Test Product 1", imageName: "test1", details: "Details 1", description: "Description 1"),
                Product(id: UUID(), name: "Test Product 2", imageName: "test2", details: "Details 2", description: "Description 2")
            ]
        }
    }

    func fetchProductDetails(productId: UUID) async throws -> Product {
        if shouldFail {
            throw NSError(domain: "TestError", code: 1, userInfo: [NSLocalizedDescriptionKey: "Failed to fetch product details"])
        } else {
            return Product(id: productId, name: "Mock Product", imageName: "mock-image", details: "Mock Details", description: "Mock Description")
        }
    }
}
