//
//  User.swift
//  DesignDaily
//
//  Created by Yigit Dayı on 8.10.2024.
//

import Foundation

struct User: Identifiable, Hashable {
    let id: UUID
    var fullName: String
    var email: String
    var biography: String
    var contactInfo: String
    var profileImageName: String
}
