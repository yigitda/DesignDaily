//
//  MockUserService.swift
//  DesignDaily
//
//  Created by Yigit Dayı on 8.10.2024.
//

import Foundation

class MockUserService: UserServiceProtocol {
    var shouldFail: Bool

    init(shouldFail: Bool = false) {
        self.shouldFail = shouldFail
    }

    func login(email: String, password: String) async throws -> User {
        if shouldFail {
            throw NSError(domain: "LoginError", code: 1, userInfo: [NSLocalizedDescriptionKey: "Invalid credentials"])
        } else {
            return User(id: UUID(), fullName: "Test User", email: email, biography: "", contactInfo: "", profileImageName: "")
        }
    }

    func signUp(user: User, password: String) async throws -> User {
        if shouldFail {
            throw NSError(domain: "SignUpError", code: 1, userInfo: [NSLocalizedDescriptionKey: "Sign up failed"])
        } else {
            return user
        }
    }

    func fetchUserProfile(userId: UUID) async throws -> User {
        return User(id: userId, fullName: "Test User", email: "test@example.com", biography: "", contactInfo: "", profileImageName: "")
    }
}
