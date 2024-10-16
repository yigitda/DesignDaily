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

            TopNavigationBar(title: "DesignDaily")
                .background(Color.black)
                .foregroundColor(.white)

            ScrollView {
                VStack(spacing: 16) {

                    ZStack(alignment: .bottomTrailing) {
                        Image(user?.profileImageName ?? "default-profile")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 120, height: 120)
                            .clipShape(Circle())
                            .shadow(radius: 4)
                        Button(action: {

                        }) {
                            Image(systemName: "pencil.circle.fill")
                                .foregroundColor(.gray)
                                .background(Color.white)
                                .clipShape(Circle())
                        }
                        .offset(x: -10, y: -10)
                    }


                    Text(user?.fullName ?? "Unknown User")
                        .font(.title)
                        .bold()


                    VStack(alignment: .leading, spacing: 8) {
                        Text("Biography")
                            .font(.headline)
                        Text(user?.biography ?? "No biography available.")
                            .font(.body)
                    }
                    .padding(.horizontal)


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


                    VStack(alignment: .leading, spacing: 8) {
                        Text("Lists")
                            .font(.headline)

                        HStack {
                            Image("lighting")
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
