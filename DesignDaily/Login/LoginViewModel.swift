//
//  LoginViewModel.swift
//  DesignDaily
//
//  Created by Yigit Dayı on 8.10.2024.
//

import SwiftUI

class LoginViewModel: LoginViewModelProtocol {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published private(set) var isLoading: Bool = false
    @Published private(set) var errorMessage: String?

    private let userService: UserServiceProtocol
    weak var coordinator: AppCoordinator?

    init(userService: UserServiceProtocol = UserService(), coordinator: AppCoordinator?) {
        self.userService = userService
        self.coordinator = coordinator
    }

    func login() async {
        isLoading = true
        defer { isLoading = false }

        do {
            let user = try await userService.login(email: email, password: password)
            // Handle successful login
            await MainActor.run {
                coordinator?.isAuthenticated = true
            }
        } catch {
            errorMessage = error.localizedDescription
        }
    }
}
