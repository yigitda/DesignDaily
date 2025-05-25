//
//  Destination.swift
//  DesignDaily
//
//  Created by Yigit Dayı on 8.10.2024.
//

import Foundation

enum Destination: Hashable {
    case login
    case signUpStep1
    case signUpStep2
    case productDetail(Product)
    case profileEditView(User)
    case settingsView
    case mainTabs(MainTab)
}

enum MainTab: Hashable {
    case home
    case search
    case favorites
    case profile
}

