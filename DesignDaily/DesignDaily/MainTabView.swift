//
//  MainTabView.swift
//  DesignDaily
//
//  Created by Yigit Dayı on 14.10.2024.
//
import SwiftUI

struct MainTabView: View {
    @EnvironmentObject var coordinator: AppCoordinator
    @State private var selectedTab: MainTab = .home

    var body: some View {
            TabView(selection: $selectedTab) {
                Group {
                    homeTab
                        .tabItem {
                            Label("", image: selectedTab == .home ? "D_selected" : "D")
                        }
                        .tag(MainTab.home)
                    
                    searchTab
                        .tabItem {
                            Label("", image: selectedTab == .search ? "Search_selected" : "Search")
                        }
                        .tag(MainTab.search)
                    
                    favoritesTab
                        .tabItem {
                            Label("", image: selectedTab == .favorites ? "Heart_selected" : "Heart")
                        }
                        .tag(MainTab.favorites)
                    
                    profileTab
                        .tabItem {
                            Label("", image: selectedTab == .profile ? "Profile_selected" : "Profile")
                        }
                        .tag(MainTab.profile)
                }
                .padding()
                .background(Color.black)
            }
            .edgesIgnoringSafeArea(.bottom)
            .background(Color.black.edgesIgnoringSafeArea(.all))
        }
    
    var homeTab: some View {
        NavigationStack(path: $coordinator.homePath) {
            FavoritesView()
                .environmentObject(coordinator)
                .navigationDestination(for: Destination.self) { destination in
                    coordinator.destinationView(for: destination)
                }
        }
    }

    var searchTab: some View {
        NavigationStack(path: $coordinator.searchPath) {
            SearchView()
                .environmentObject(coordinator)
                .navigationDestination(for: Destination.self) { destination in
                    coordinator.destinationView(for: destination)
                }
        }
    }

    var favoritesTab: some View {
        NavigationStack(path: $coordinator.favoritesPath) {
            FavoritesView()
                .environmentObject(coordinator)
                .navigationDestination(for: Destination.self) { destination in
                    coordinator.destinationView(for: destination)
                }
        }
    }

    var profileTab: some View {
        NavigationStack(path: $coordinator.profilePath) {
            ProfileView(user: coordinator.currentUser)
                .environmentObject(coordinator)
                .navigationDestination(for: Destination.self) { destination in
                    coordinator.destinationView(for: destination)
                }
        }
    }
}
