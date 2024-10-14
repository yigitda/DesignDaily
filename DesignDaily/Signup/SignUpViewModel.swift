//
//  Untitled.swift
//  DesignDaily
//
//  Created by Yigit Dayı on 8.10.2024.
//

import SwiftUI

class SignUpViewModel: SignUpViewModelProtocol {
    @Published var fullName: String = ""
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

    func signUp() async {
        isLoading = true
        defer { isLoading = false }

        // Validate inputs
        guard !fullName.isEmpty, !email.isEmpty, !password.isEmpty else {
            await MainActor.run {
                errorMessage = "Please fill all fields."
            }
            return
        }

        do {
            let user = User(id: UUID(), fullName: fullName, email: email, biography: "", contactInfo: "", profileImageName: "")
            let registeredUser = try await userService.signUp(user: user, password: password)
            // Handle successful sign-up
            await MainActor.run {
                coordinator?.isAuthenticated = true
            }
        } catch {
            await MainActor.run {
                errorMessage = error.localizedDescription
            }
        }
    }
}
