//
//  ProductDetailViewModelProtocol.swift
//  DesignDaily
//
//  Created by Yigit Dayı on 8.10.2024.
//

import Foundation

protocol ProductDetailViewModelProtocol: ObservableObject {
    var product: Product { get }
    var isLoading: Bool { get }
    var errorMessage: String? { get }

    func fetchProductDetails() async
}
