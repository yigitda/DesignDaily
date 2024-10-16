//
//  Untitled.swift
//  DesignDaily
//
//  Created by Yigit Dayı on 8.10.2024.
//

import SwiftUI

class SettingsViewModel: ObservableObject {
    // Properties
    @Published var options: [String] = ["Support/Request", "Share the App", "Privacy Policy", "Log Out"]
    
    // Action Methods
    func handleOptionSelected(option: String) {
        switch option {
        case "Support/Request":

            print("Support/Request selected")
        case "Share the App":

            print("Share the App selected")
        case "Privacy Policy":

            print("Privacy Policy selected")
        case "Log Out":

            print("Log Out selected")
        default:
            break
        }
    }
}
