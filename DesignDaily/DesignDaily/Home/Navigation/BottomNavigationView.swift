//
//  BottomNavigationView.swift
//  DesignDaily
//
//  Created by Yigit Dayı on 8.10.2024.
//



import SwiftUI

struct BottomNavigationView: View {
    @EnvironmentObject var coordinator: AppCoordinator
    
    var body: some View {
        HStack {
            Spacer()
            Button(action: {
                coordinator.rootView = .mainTabs(.home)
            }) {
                Image(systemName: "house.fill")
            }
            Spacer()
            Button(action: {
                coordinator.rootView = .mainTabs(.search)
            }) {
                Image(systemName: "magnifyingglass")
            }
            Spacer()
            Button(action: {
                coordinator.rootView = .mainTabs(.favorites)
            }) {
                Image(systemName: "heart.fill")
            }
            Spacer()
            Button(action: {
                coordinator.rootView = .mainTabs(.profile)
            }) {
                Image(systemName: "person.crop.circle")
            }
            Spacer()
        }
        .padding()
        .background(Color.black)
    }
}


