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
        NavigationStack(path: $coordinator.rootPath) {
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
            SignUpStep1View(viewModel: SignUpViewModel(userService: coordinator.userService, coordinator: coordinator))
                .environmentObject(coordinator)
        case .signUpStep2:
            SignUpStep2View(viewModel: SignUpViewModel(userService: coordinator.userService, coordinator: coordinator))
                .environmentObject(coordinator)
        case .productDetail(let product):
            let viewModel = ProductDetailViewModel(productId: product.id )
                    ProductDetailView(viewModel: viewModel)
                .environmentObject(coordinator)
        case .profileEditView(let user):
                    ProfileEditView(user: user)
                        .environmentObject(coordinator)
        case .mainTabs(let selectedTab):
                    MainTabView()
                        .environmentObject(coordinator)
        case .settingsView:
            SettingsView().environmentObject(coordinator)
        }
    }
}
