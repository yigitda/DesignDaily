//
//  ProductService.swift
//  DesignDaily
//
//  Created by Yigit Dayı on 8.10.2024.
//

import Foundation

class ProductService: ProductServiceProtocol {
    func fetchProducts() async throws -> [Product] {
        try await Task.sleep(nanoseconds: 1_000_000_000)
        
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
        ]
    }

    func fetchProductDetails(productId: UUID) async throws -> Product {
        
        return Product(
            id: productId,
            name: "Barcelona Chair",
            imageName: "barcelona-chair",
            designerNames: "Ludwig Mies van der Rohe",
            date: "1929",
            style: "Modernism",
            size: "75 x 75 x 75 cm",
            materials: "Leather, Stainless Steel",
            description: "The Barcelona Chair is an icon of modern design."
        )
    }
}

