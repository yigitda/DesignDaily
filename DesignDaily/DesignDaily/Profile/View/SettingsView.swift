//
//  SettingsView.swift
//  DesignDaily
//
//  Created by Yigit Dayı on 8.10.2024.
//

import SwiftUI

struct SettingsView: View {
    let options = ["Support/Request", "Share the App", "Privacy Policy", "Log Out"]
    
    @EnvironmentObject var coordinator: AppCoordinator
    @StateObject private var viewModel = SettingsViewModel()
    var body: some View {
        VStack(spacing: 20) {
            // Navigation Bar
            TopNavigationBar(title: "DesignDaily")
            
            VStack(alignment: .leading, spacing: 15) {
                ForEach(options, id: \.self) { option in
                    HStack {
                        Text(option)
                            .font(.body)
                            .foregroundColor(.black)
                        Spacer()
                    }
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(10)
                }
            }
            .padding()

            Spacer()
            
            // Bottom Navigation
            BottomNavigationView()
        }
        .background(Color.white)
        .ignoresSafeArea()
    }
}
