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
            homeTab
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
                .tag(MainTab.home)

            searchTab
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
                .tag(MainTab.search)

            favoritesTab
                .tabItem {
                    Label("Favorites", systemImage: "heart.fill")
                }
                .tag(MainTab.favorites)

            profileTab
                .tabItem {
                    Label("Profile", systemImage: "person.crop.circle")
                }
                .tag(MainTab.profile)
        }
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
