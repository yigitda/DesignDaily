//
//  ProductServiceProtocol.swift
//  DesignDaily
//
//  Created by Yigit Dayı on 8.10.2024.
//

import Foundation

protocol ProductServiceProtocol {
    func fetchProducts() async throws -> [Product]
    func fetchProductDetails(productId: UUID) async throws -> Product
}
