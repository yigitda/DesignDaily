//
//  Untitled.swift
//  DesignDaily
//
//  Created by Yigit Dayı on 8.10.2024.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var coordinator: AppCoordinator
    var user: User?

    var body: some View {
        VStack(spacing: 0) {
            // Header
            TopNavigationBar(title: "DesignDaily")
                .background(Color.black)
                .foregroundColor(.white)

            ScrollView {
                VStack(spacing: 16) {
                    // Profile Image with Edit Option
                    ZStack(alignment: .bottomTrailing) {
                        Image(user?.profileImageName ?? "default-profile")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 120, height: 120)
                            .clipShape(Circle())
                            .shadow(radius: 4)
                        Button(action: {
                            // Edit profile picture action
                        }) {
                            Image(systemName: "pencil.circle.fill")
                                .foregroundColor(.gray)
                                .background(Color.white)
                                .clipShape(Circle())
                        }
                        .offset(x: -10, y: -10)
                    }

                    // User Name
                    Text(user?.fullName ?? "Unknown User")
                        .font(.title)
                        .bold()

                    // Biography Section
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Biography")
                            .font(.headline)
                        Text(user?.biography ?? "No biography available.")
                            .font(.body)
                    }
                    .padding(.horizontal)

                    // Contact Information
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Contact Information")
                            .font(.headline)
                        if let contactInfo = user?.contactInfo {
                            Text(contactInfo)
                                .font(.body)
                        } else {
                            Text("No contact information available.")
                                .font(.body)
                        }
                    }
                    .padding(.horizontal)

                    // Lists Section
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Lists")
                            .font(.headline)
                        // Example list item
                        HStack {
                            Image("lighting") // Replace with actual image
                                .resizable()
                                .frame(width: 50, height: 50)
                                .cornerRadius(8)
                            Text("Lightings")
                                .font(.body)
                        }
                    }
                    .padding(.horizontal)
                }
                .padding(.top, 16)
            }

        }
        .background(Color.white)
        .ignoresSafeArea()
    }
}
