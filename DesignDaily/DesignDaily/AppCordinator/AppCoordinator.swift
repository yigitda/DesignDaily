//
//  AppCoordinator.swift
//  DesignDaily
//
//  Created by Yigit Dayı on 8.10.2024.
//

import SwiftUI

// MARK: - Coordinator Overview
// The AppCoordinator drives all navigation in the application. Each tab has its
// own `NavigationPath` so the stacks remain isolated. `isAuthenticated`
// determines whether the user sees the login flow or the main tab interface.
// When adding a new tab or flow:
// 1. Add a case to `Destination` and possibly `MainTab`.
// 2. Create a `NavigationPath` property to hold the new stack.
// 3. Update `navigate(to:in:)` and `goBack(in:)` to handle the new case.
// 4. Include the tab in `resetNavigation()` so paths clear when authentication
//    changes.

class AppCoordinator: ObservableObject {

    @Published var homePath = NavigationPath()
    @Published var searchPath = NavigationPath()
    @Published var favoritesPath = NavigationPath()
    @Published var profilePath = NavigationPath()
    @Published var rootPath = NavigationPath()

    @Published var rootView: Destination = .mainTabs(.home)


    let userService: UserServiceProtocol
    let productService: ProductServiceProtocol


    @Published var isAuthenticated: Bool = false {
        didSet {
            if isAuthenticated {
                rootView = .mainTabs(.home)
            } else {
                rootView = .login
                resetNavigation()
            }
        }
    }


    @Published var currentUser: User?

    init(userService: UserServiceProtocol = UserService(),
         productService: ProductServiceProtocol = ProductService()) {
        self.userService = userService
        self.productService = productService
    }

    
    func navigate(to destination: Destination) {
        rootPath.append(destination)
    }

    func navigate(to destination: Destination, in tab: MainTab) {
        switch tab {
        case .home:
            homePath.append(destination)
        case .search:
            searchPath.append(destination)
        case .favorites:
            favoritesPath.append(destination)
        case .profile:
            profilePath.append(destination)
        }
    }

    func goBack(in tab: MainTab) {
        switch tab {
        case .home:
            if !homePath.isEmpty {
                homePath.removeLast()
            }
        case .search:
            if !searchPath.isEmpty {
                searchPath.removeLast()
            }
        case .favorites:
            if !favoritesPath.isEmpty {
                favoritesPath.removeLast()
            }
        case .profile:
            if !profilePath.isEmpty {
                profilePath.removeLast()
            }
        }
    }

    func resetNavigation() {
        homePath = NavigationPath()
        searchPath = NavigationPath()
        favoritesPath = NavigationPath()
        profilePath = NavigationPath()
    }

    func logout() {
        isAuthenticated = false
        currentUser = nil
        resetNavigation()
    }

    func userDidAuthenticate(_ user: User) {
        currentUser = user
        isAuthenticated = true
    }
}

extension AppCoordinator {
    @ViewBuilder
    func destinationView(for destination: Destination) -> some View {
        switch destination {
        case .login:
            LoginView(viewModel: LoginViewModel(userService: userService, coordinator: self))
                .environmentObject(self)
        case .signUpStep1:
            SignUpStep1View(viewModel: SignUpViewModel(userService: userService, coordinator: self))
                .environmentObject(self)
        case .signUpStep2:
            SignUpStep2View(viewModel: SignUpViewModel(userService: userService, coordinator: self))
                .environmentObject(self)
        case .productDetail(let product):
            let viewModel = ProductDetailViewModel(productId: product.id, productService: productService)
            ProductDetailView(viewModel: viewModel)
                .environmentObject(self)
        case .profileEditView(let user):
            ProfileEditView(user: user)
                .environmentObject(self)
        case .mainTabs:
            MainTabView()
                .environmentObject(self)
        case .settingsView:
            SettingsView()
                .environmentObject(self)
        }
    }
}
