//
//  AppCoordinator.swift
//  DesignDaily
//
//  Created by Yigit Dayı on 8.10.2024.
//

import SwiftUI

class AppCoordinator: ObservableObject {
    @Published var path = NavigationPath()
    @Published var rootView: Destination = .listsView

    // Shared Services
    let userService: UserServiceProtocol
    let productService: ProductServiceProtocol

    // Authentication State
    @Published var isAuthenticated: Bool = false {
        didSet {
            rootView = isAuthenticated ? .listsView : .login
            resetNavigation()
        }
    }

    init(userService: UserServiceProtocol = UserService(),
         productService: ProductServiceProtocol = ProductService()) {
        self.userService = userService
        self.productService = productService
    }

    func navigate(to destination: Destination) {
        path.append(destination)
    }

    func goBack() {
        if !path.isEmpty {
            path.removeLast()
        }
    }

    func resetNavigation() {
        path = NavigationPath()
    }
}

