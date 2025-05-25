//
//  SignUpViewModelProtocol.swift
//  DesignDaily
//
//  Created by Yigit Dayı on 8.10.2024.
//

import Foundation

protocol SignUpViewModelProtocol: ObservableObject {
    var fullName: String { get set }
    var email: String { get set }
    var password: String { get set }
    var isLoading: Bool { get }
    var errorMessage: String? { get }

    func signUp() async
}
