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
    
    @EnvironmentObject var coordinator: AppCoordinator
    @StateObject private var viewModel = ProfileEditViewModel()
    let user: User
    var body: some View {
        VStack(spacing: 20) {

            TopNavigationBar(title: "DesignDaily")
            

            VStack {
                Image("anna-smith")
                    .resizable()
                    .scaledToFill()
                    .clipShape(Circle())
                    .frame(width: 100, height: 100)
                    .shadow(radius: 4)
                Text("Anna Smith")
                    .font(.title)
                    .bold()
                Button(action: {
                    
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


            BottomNavigationView()
        }
        .background(Color.white)
        .ignoresSafeArea()
    }
}

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
                Image("lighting")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .cornerRadius(8)
            }
        }
    }
}
