//
//  ListsViewModelProtocol.swift
//  DesignDaily
//
//  Created by Yigit Dayı on 8.10.2024.
//

import Foundation

import Foundation

class FavoritesManager: ObservableObject {
    @Published var favoriteProductIDs: Set<UUID> = []
    
    static let shared = FavoritesManager()
    
    private init() {
        loadFavorites()
    }
    
    func addFavorite(productID: UUID) {
        favoriteProductIDs.insert(productID)
        saveFavorites()
    }
    
    func removeFavorite(productID: UUID) {
        favoriteProductIDs.remove(productID)
        saveFavorites()
    }
    
    func isFavorited(productID: UUID) -> Bool {
        favoriteProductIDs.contains(productID)
    }
    
    private func loadFavorites() {

        if let data = UserDefaults.standard.data(forKey: "favoriteProductIDs"),
           let ids = try? JSONDecoder().decode(Set<UUID>.self, from: data) {
            favoriteProductIDs = ids
        }
    }
    
    private func saveFavorites() {

        if let data = try? JSONEncoder().encode(favoriteProductIDs) {
            UserDefaults.standard.set(data, forKey: "favoriteProductIDs")
        }
    }
}
