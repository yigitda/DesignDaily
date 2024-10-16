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
                Product(
                    id: UUID(),
                    name: "Barcelona Chair",
                    imageName: "barcelona-chair",
                    designerNames: "Ludwig Mies van der Rohe",
                    date: "1929",
                    style: "Modernism",
                    size: "75 x 75 x 75 cm",
                    materials: "Leather, Stainless Steel",
                    description: "The Barcelona Chair is an icon of modern design."
                ),
                Product(
                    id: UUID(),
                    name: "Eames Lounge Chair",
                    imageName: "eames-lounge-chair",
                    designerNames: "Charles and Ray Eames",
                    date: "1956",
                    style: "Modernism",
                    size: "84 x 84 x 84 cm",
                    materials: "Leather, Plywood",
                    description: "A timeless piece of modern furniture design."
                )
            ]
        }
    }

    func fetchProductDetails(productId: UUID) async throws -> Product {
        if shouldFail {
            throw NSError(domain: "TestError", code: 1, userInfo: [NSLocalizedDescriptionKey: "Failed to fetch product details"])
        } else {

            return Product(
                id: productId,
                name: "Mock Product",
                imageName: "mock-image",
                designerNames: "Mock Designer",
                date: "2023",
                style: "Contemporary",
                size: "80 x 80 x 80 cm",
                materials: "Wood, Fabric",
                description: "This is a mock product description."
            )
        }
    }
}
