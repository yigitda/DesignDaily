//
//  ListsViewModelProtocol.swift
//  DesignDaily
//
//  Created by Yigit Dayı on 8.10.2024.
//

import Foundation

protocol ListsViewModelProtocol: ObservableObject {
    var products: [Product] { get }
    var isLoading: Bool { get }
    var errorMessage: String? { get }

    func fetchProducts() async
}
