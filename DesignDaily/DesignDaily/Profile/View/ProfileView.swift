//
//  Untitled.swift
//  DesignDaily
//
//  Created by Yigit Dayı on 8.10.2024.
//

import SwiftUI

struct ProfileView: View {
    var userName: String = "Anna Smith"
    var biography: String = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum laoreet metus quis iaculis..."
    var contactInfo: String = "smith-john@gmail.com\n+21 567 839 3478\nNevoyak street, Haga, No:2"
    let user: User
    @EnvironmentObject var coordinator: AppCoordinator
    var body: some View {
        VStack(spacing: 20) {
            // Navigation Bar
            HStack {
                Text("DesignDaily")
                    .font(.title)
                    .fontWeight(.bold)
                Spacer()
                Image(systemName: "line.horizontal.3")
            }
            .padding()
            
            // Profile Image and Name
            Image("anna-smith") // Replace with your asset name
                .resizable()
                .scaledToFill()
                .clipShape(Circle())
                .frame(width: 100, height: 100)
                .shadow(radius: 4)
            
            Text(userName)
                .font(.title)
                .bold()
            
            // Biography Section
            VStack(alignment: .leading, spacing: 10) {
                Text("Biography")
                    .font(.headline)
                Text(biography)
                    .font(.body)
                
                Text("Contact")
                    .font(.headline)
                Text(contactInfo)
                    .font(.body)
                
                Text("Lists")
                    .font(.headline)
                // Example of a list item
                HStack {
                    Image("lighting") // Replace with actual image asset
                        .resizable()
                        .frame(width: 50, height: 50)
                        .cornerRadius(8)
                    Text("Lightings")
                        .font(.body)
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
