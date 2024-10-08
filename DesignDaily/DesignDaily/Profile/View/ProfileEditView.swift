//
//  Untitled.swift
//  DesignDaily
//
//  Created by Yigit Dayı on 8.10.2024.
//

import SwiftUI

struct ProfileEditView: View {
    @State private var biography: String = "Lorem ipsum dolor sit amet..."
    @State private var contactInfo: String = "smith-john@gmail.com\n+21 567 839 3478\nNevoyak street, Haga, No:2"
    
    @StateObject private var viewModel = ProfileEditViewModel()
    var body: some View {
        VStack(spacing: 20) {
            // Navigation Bar
            TopNavigationBar(title: "DesignDaily")
            
            // Profile Image and Name
            VStack {
                Image("anna-smith") // Replace with your asset name
                    .resizable()
                    .scaledToFill()
                    .clipShape(Circle())
                    .frame(width: 100, height: 100)
                    .shadow(radius: 4)
                Text("Anna Smith")
                    .font(.title)
                    .bold()
                Button(action: {
                    // Edit profile picture action
                }) {
                    Image(systemName: "pencil.circle")
                        .foregroundColor(.black)
                        .padding(.top, -80)
                }
            }
            
            VStack(alignment: .leading, spacing: 15) {
                ProfileSection(title: "Biography", content: biography)
                ProfileSection(title: "Contact", content: contactInfo)
                ProfileSection(title: "Lists", content: "Lightings", isList: true)
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

// Helper Component for Profile Sections
struct ProfileSection: View {
    var title: String
    var content: String
    var isList: Bool = false
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(title)
                    .font(.headline)
                Spacer()
                Button(action: {
                    // Edit action
                }) {
                    Image(systemName: "pencil")
                        .foregroundColor(.gray)
                }
            }
            Text(content)
                .font(.body)
                .foregroundColor(.gray)
                .padding(.top, 5)
            
            if isList {
                Image("lighting") // Example item image
                    .resizable()
                    .frame(width: 50, height: 50)
                    .cornerRadius(8)
            }
        }
    }
}
