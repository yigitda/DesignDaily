//
//  Untitled.swift
//  DesignDaily
//
//  Created by Yigit Dayı on 8.10.2024.
//

import SwiftUI

class ListsViewModel: ObservableObject {
    // Properties
    @Published var items: [(name: String, imageName: String)] = [
        ("Chairs", "chairs-image"),
        ("Lightings", "lighting-image"),
        ("Coffee Tables", "coffee-tables-image")
    ]
    
    // Method to add a new item
    func addItem(name: String, imageName: String) {
        items.append((name, imageName))
    }
    
    // Method to remove an item
    func removeItem(at index: Int) {
        guard index < items.count else { return }
        items.remove(at: index)
    }
    
    // Method to update an item
    func updateItem(at index: Int, name: String, imageName: String) {
        guard index < items.count else { return }
        items[index] = (name, imageName)
    }
    
    // Method to fetch details of an item (e.g., navigate to detail view)
    func fetchDetails(forItem item: (name: String, imageName: String)) {
        // Code to fetch item details or navigate to detail view
        print("Fetching details for \(item.name)")
    }
}
