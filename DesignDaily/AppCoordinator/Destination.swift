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
    case listsView
    case productDetail(Product)
    case searchView
    case profileView(User)
    case profileEditView(User)
    case settingsView
}

