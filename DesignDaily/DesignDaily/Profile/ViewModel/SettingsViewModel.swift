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
            // Code to open support page or request form
            print("Support/Request selected")
        case "Share the App":
            // Code to share the app link via system share sheet
            print("Share the App selected")
        case "Privacy Policy":
            // Code to show privacy policy page
            print("Privacy Policy selected")
        case "Log Out":
            // Code to log out the user
            print("Log Out selected")
        default:
            break
        }
    }
}
