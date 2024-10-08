//
//  Untitled.swift
//  DesignDaily
//
//  Created by Yigit Dayı on 8.10.2024.
//

import SwiftUI

class SignUpViewModel: ObservableObject {
    @Published var fullName: String = ""
    @Published var phoneNumber: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var gender: String = ""
    @Published var birthday: String = ""
    @Published var location: String = ""
    
    func validateStep1() -> Bool {
        return !fullName.isEmpty && !phoneNumber.isEmpty && !email.isEmpty && !password.isEmpty
    }
    
    func validateStep2() -> Bool {
        return !gender.isEmpty && !birthday.isEmpty && !location.isEmpty
    }
}
