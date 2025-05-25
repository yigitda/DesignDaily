//
//  UserServiceProtocol.swift
//  DesignDaily
//
//  Created by Yigit Dayı on 8.10.2024.
//

import Foundation

protocol UserServiceProtocol {
    func login(email: String, password: String) async throws -> User
    func signUp(user: User, password: String) async throws -> User
}
