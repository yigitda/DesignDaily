//
//  UserService.swift
//  DesignDaily
//
//  Created by Yigit Dayı on 8.10.2024.
//

import Foundation

class UserService: UserServiceProtocol {
    func login(email: String, password: String) async throws -> User {
        // Simulate network delay
        try await Task.sleep(nanoseconds: 1_000_000_000)
        // Simulate login success
        if email == "test@example.com" && password == "password" {
            return User(id: UUID(), fullName: "Test User", email: email, biography: "", contactInfo: "", profileImageName: "" )
        } else {
            throw NSError(domain: "LoginError", code: 1, userInfo: [NSLocalizedDescriptionKey: "Invalid email or password"])
        }
    }

    func signUp(user: User, password: String) async throws -> User {
        // Simulate network delay
        try await Task.sleep(nanoseconds: 1_000_000_000)
        // Simulate sign-up success
        return user
    }
}
