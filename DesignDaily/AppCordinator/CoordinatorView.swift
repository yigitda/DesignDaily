//
//  Untitled.swift
//  DesignDaily
//
//  Created by Yigit Dayı on 8.10.2024.
//

import SwiftUI

struct CoordinatorView: View {
    @EnvironmentObject var coordinator: AppCoordinator

    var body: some View {
        NavigationStack(path: $coordinator.path) {
            destinationView(for: coordinator.rootView)
                .navigationDestination(for: Destination.self) { destination in
                    destinationView(for: destination)
                }
        }
    }

    @ViewBuilder
    func destinationView(for destination: Destination) -> some View {
        switch destination {
        case .login:
            LoginView(viewModel: LoginViewModel(userService: coordinator.userService, coordinator: coordinator))
                .environmentObject(coordinator)
        case .signUpStep1:
            let viewModel = coordinator.signUpViewModel ?? SignUpViewModel(userService: coordinator.userService, coordinator: coordinator)
            coordinator.signUpViewModel = viewModel
            SignUpStep1View(viewModel: viewModel)
                .environmentObject(coordinator)
        case .signUpStep2:
            let viewModel = coordinator.signUpViewModel ?? SignUpViewModel(userService: coordinator.userService, coordinator: coordinator)
            coordinator.signUpViewModel = viewModel
            SignUpStep2View(viewModel: viewModel)
                .environmentObject(coordinator)
        case .listsView:
            ListsView(viewModel: ListsViewModel(productService: coordinator.productService))
                .environmentObject(coordinator)
        case .productDetail(let product):
            let viewModel = ProductDetailViewModel(productId: product.id, productService: coordinator.productService)
            ProductDetailView(viewModel: viewModel)
                .environmentObject(coordinator)
        case .searchView:
            SearchView()
                .environmentObject(coordinator)
        case .profileView(let user):
            ProfileView(user: user)
                .environmentObject(coordinator)
        case .profileEditView(let user):
            ProfileEditView(user: user)
                .environmentObject(coordinator)
        case .settingsView:
            SettingsView()
                .environmentObject(coordinator)
        }
    }
}
